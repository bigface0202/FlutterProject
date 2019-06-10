import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {
  createState() {
    return IndexScreenState();
  }
}

class IndexScreenState extends State<IndexScreen> {
  static const _categoryNames = <String>[
    'Shoulder',
    'Chest',
    'Back',
    'Upper arm',
    'Lower arm',
    'Upper leg',
    'Lower leg',
    'Abdominal',
    'Aerobics',
  ];

  Widget build(condext) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Padding(
            child: Text(
              _categoryNames[index],
              style: TextStyle(fontSize: 22.0),
            ),
            padding: EdgeInsets.all(20.0),
          ),
        );
      },
      itemCount: _categoryNames.length,
    );
  }
}
