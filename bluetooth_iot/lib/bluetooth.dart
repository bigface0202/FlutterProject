import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'dart:convert';

class BluetoothApp extends StatefulWidget {
  @override
  _BluetoothAppState createState() => _BluetoothAppState();
}

class _BluetoothAppState extends State<BluetoothApp> {
  // Bluetoothの接続状態をUNKNOWにすることで初期化
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  // Bluetoothのインスタンスをゲット
  FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;
  // リモートデバイスと接続しているbluetoothを追跡
  BluetoothConnection connection;
  // デバイスがBluetoothと接続し続けているかを追跡
  bool get isConnected => connection != null && connection.isConnected;
  // _deviceStateはBluetoothデバイスの接続状態を追跡するのに使われる
  int _deviceState;
  // ペアリングされたデバイスを格納するためのリスト
  List<BluetoothDevice> _devicesList = [];
  // 接続が切れたことを追跡
  bool isDisconnecting = false;
  // 今のデバイスの接続状況
  bool _connected = false;
  bool _isButtonUnavailable = false;
  BluetoothDevice _device;

  @override
  void initState() {
    super.initState();
    // 現在の状態を取得
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });
    _deviceState = 0; // neutral
    // 起動した時点でBluetoothの使用が許可されていない場合，
    // 許可するようにリクエストを出す
    enableBluetooth();

    // Listen for further state changes
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;
        // ペアリングされたデバイスをリストとして取得
        getPairedDevices();
      });
    });
  }

  @override
  void dispose() {
    if (isConnected) {
      isDisconnecting = true;
      connection.dispose();
      connection = null;
    }
    super.dispose();
  }

  Future<void> enableBluetooth() async {
    // 今のbluetooth stateを取ってくる
    _bluetoothState = await FlutterBluetoothSerial.instance.state;
    // もしbluetoothがオフならば，まずオンにする
    // そしてペアリングされたデバイスを取ってくる
    if (_bluetoothState == BluetoothState.STATE_OFF) {
      await FlutterBluetoothSerial.instance.requestEnable();
      await getPairedDevices();
      return true;
    } else {
      await getPairedDevices();
    }
    return false;
  }

  Future<void> getPairedDevices() async {
    List<BluetoothDevice> devices = [];
    // ペアリングされたデバイスを取得
    try {
      devices = await _bluetooth.getBondedDevices();
    } on PlatformException {
      print('Error');
    }
    // mountedがtrueじゃなければエラーを返す
    // mountedはStateが作られるとtrueになる？ disposeされるまでtrueらしい
    if (!mounted) {
      return;
    }
    // クラス外の_deviceListにdevicesを代入する
    setState(() {
      _devicesList = devices;
    });
  }

  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devicesList.isEmpty) {
      items.add(
        DropdownMenuItem(
          child: Text('NONE'),
        ),
      );
    } else {
      _devicesList.forEach(
        (device) {
          items.add(DropdownMenuItem(
            child: Text(device.name),
            value: device,
          ));
        },
      );
    }
    return items;
  }

  // Bluetoothデバイスをオンにするメッセージを送る
  // "1"を送ることでオンにする
  void _sendOnMessageToBluetooth() async {
    connection.output.add(utf8.encode("1" + "\r\n"));
    await connection.output.allSent;
    Scaffold.of(context).showSnackBar(
      new SnackBar(content: new Text('Device Turned On')),
    );
    setState(() {
      _deviceState = 1;
    });
  }

  // Bluetoothデバイスをオフにするメッセージを送る
  // "0"を送ることでオフにする
  void _sendOffMessageToBluetooth() async {
    connection.output.add(utf8.encode("0" + "\r\n"));
    await connection.output.allSent;
    Scaffold.of(context).showSnackBar(
      new SnackBar(content: new Text('Device Turned Off')),
    );
    setState(() {
      _deviceState = -1;
    });
  }

  void _connect() async {
    if (_device == null) {
      Scaffold.of(context).showSnackBar(
        new SnackBar(content: new Text('No device selected')),
      );
    } else {
      if (!isConnected) {
        // そのアドレスを使ってデバイスに繋げる事を試みる
        await BluetoothConnection.toAddress(_device.address)
            .then((_connection) {
          print('Connected to device');
          connection = _connection;
          // デバイスの接続状況を更新
          setState(() {
            _connected = true;
          });
          connection.input.listen(null).onDone(() {
            if (isDisconnecting) {
              print('Disconnecting locally!');
            } else {
              print('Disconnected remotely!');
            }
            if (this.mounted) {
              setState(() {});
            }
          });
        }).catchError((error) {
          print('Cannot connect, exception occurred');
          print(error);
        });
        Scaffold.of(context).showSnackBar(
          new SnackBar(content: new Text('Device connected')),
        );
      }
    }
  }

  void _disconnect() async {
    // Bluetoothの接続を閉じる
    await connection.close();
    Scaffold.of(context).showSnackBar(
      new SnackBar(content: new Text('Device disconnected')),
    );
    // [_connected]の変数を更新
    if (!connection.isConnected) {
      setState(() {
        _connected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Enable Bluetooth",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Switch(
                value: _bluetoothState.isEnabled,
                onChanged: (bool value) {
                  future() async {
                    if (value) {
                      // Bluetooth起動
                      await FlutterBluetoothSerial.instance.requestEnable();
                    } else {
                      // Bluetooth切る
                      await FlutterBluetoothSerial.instance.requestDisable();
                    }
                    // デバイスリストをリロードする
                    await getPairedDevices();
                    _isButtonUnavailable = false;
                    // Bluetoothを切る前に全てのデバイスと接続を切る
                    if (_connected) {
                      _disconnect();
                    }
                  }

                  future().then((_) {
                    setState(() {});
                  });
                },
              ),
            ],
          ),
        ),
        Center(
          child: Text(
            'PAIRED DEVICES',
            style: TextStyle(fontSize: 24),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Device:'),
              DropdownButton(
                items: _getDeviceItems(),
                onChanged: (value) => setState(() => _device = value),
                value: _devicesList.isNotEmpty ? _device : null,
              ),
              RaisedButton(
                onPressed: _isButtonUnavailable
                    ? null
                    : _connected ? _disconnect : _connect,
                child: Text(_connected ? 'Disconnect' : 'Connect'),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Device 1',
                  style: TextStyle(fontSize: 18),
                ),
                FlatButton(
                  onPressed: _connected ? _sendOnMessageToBluetooth : null,
                  child: Text('ON'),
                ),
                FlatButton(
                  onPressed: _connected ? _sendOffMessageToBluetooth : null,
                  child: Text('OFF'),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
