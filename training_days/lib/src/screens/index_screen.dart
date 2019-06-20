import 'package:flutter/material.dart';

final _categoryNames = <String>[
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

class IndexScreen extends StatelessWidget {
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trainning list'),
      ),
      body: buildList(),
    );
  }

  Widget buildList() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            print('Tap');
            Navigator.pushNamed(context, '/test');
          },
          child: Card(
            child: Padding(
              child: Text(
                _categoryNames[index],
                style: TextStyle(fontSize: 22.0),
              ),
              padding: EdgeInsets.all(20.0),
            ),
          ),
        );
      },
      itemCount: _categoryNames.length,
    );
  }
}

// class IndexScreen extends StatefulWidget {
//   createState() {
//     return IndexScreenState();
//   }
// }

// class IndexScreenState extends State<IndexScreen> {

//   Widget build(condext) {
//     return ListView.builder(
//       itemBuilder: (BuildContext context, int index) {
//       return Inkwell(
//         child: Card(
//           child: Padding(
//             child: Text(
//               _categoryNames[index],
//               style: TextStyle(fontSize: 22.0),
//             ),
//             padding: EdgeInsets.all(20.0),
//           ),
//         );
//       },
//       itemCount: _categoryNames.length,
//     ),
//     );
//   }
// }
