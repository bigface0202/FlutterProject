import 'package:flutter/material.dart';

final _categoryNames = <String>[
  'Shoulder',
  'Chest',
  'Back',
  'Arm',
  'Leg',
  'Abdominal',
  'Aerobics',
];

class IndexScreen extends StatefulWidget {
  IndexScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _IndexScreenState createState() => _IndexScreenState();
}

//State is information of the application that can change over time or when some actions are taken.
class _IndexScreenState extends State<IndexScreen> {
  List<bool> inputs = new List<bool>();
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      for (int i = 0; i < 7; i++) {
        inputs.add(false);
      }
    });
  }

  void itemChange(bool val, int index) {
    setState(() {
      inputs[index] = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _categoryNames.length,
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          child: new Container(
            padding: new EdgeInsets.all(5.0),
            child: new Column(
              children: <Widget>[
                trainingList(index),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget trainingList(int index) {
    return new CheckboxListTile(
      value: inputs[index],
      title: new Text('${_categoryNames[index]}'),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (bool val) {
        itemChange(val, index);
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue[300],
      child: Text('Submit'),
      onPressed: () {
        print('Tap');
      },
    );
  }
}

// class IndexScreen extends StatelessWidget {
//   build(context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Trainning list'),
//       ),
//       body: buildList(),
//     );
//   }

//   Widget buildList() {
//     return ListView.builder(
//       itemBuilder: (BuildContext context, int index) {
//         return InkWell(
//           onTap: () {
//             Navigator.pushNamed(context, '/muscle$index');
//           },
//           child: Card(
//             child: Padding(
//               child: Text(
//                 _categoryNames[index],
//                 style: TextStyle(fontSize: 22.0),
//               ),
//               padding: EdgeInsets.all(20.0),
//             ),
//           ),
//         );
//       },
//       itemCount: _categoryNames.length,
//     );
//   }
// }
