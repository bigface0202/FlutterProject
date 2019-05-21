import 'package:flutter/material.dart';

class NewTrainingScreen extends StatefulWidget {
  createState() {
    return NewTrainingScreenState();
  }
}

class NewTrainingScreenState extends State<NewTrainingScreen> {
  final formKey = GlobalKey<FormState>();

  String newtraining = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            trainingField(),
            muscleField(),
            trainingTypeField(),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget trainingField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'New Training',
        hintText: 'Bench press',
      ),
    );
  }

  Widget muscleField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Choose the muscle',
        hintText: 'Chest',
      ),
    );
  }

  Widget trainingTypeField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Choose the type of training',
        hintText: 'Weight and reps',
      ),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Icon(Icons.add),
      onPressed: () {},
    );
  }
}
