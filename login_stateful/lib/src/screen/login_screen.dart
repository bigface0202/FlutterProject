import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  createState(){
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen>{
  Widget build(context){
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin:EdgeInsets.only(top:25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email address',
        hintText:  'yourname@gmail.com',
      ),
    );
  }
  Widget passwordField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Enter password',
        hintText: 'Password',
      ),
    );
  }
  Widget submitButton(){
    return RaisedButton(
    color: Colors.blueAccent,
    child: Text('Submit'),
    onPressed: (){},
    );
  }
}