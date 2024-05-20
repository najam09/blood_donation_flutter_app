import 'package:flutter/material.dart';

void main() {
runApp(SignupScreen());
}

class SignupScreen extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
home: Scaffold(
appBar: AppBar(
title: Text('Signup'),
),
body: Padding(
padding: EdgeInsets.all(20.0),
child: SingleChildScrollView(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
Container(
height: 100,
width: 100,
margin: EdgeInsets.only(bottom: 20.0),
child: Image.asset('assets/logo.png'), // Replace 'assets/logo.png' with your logo file path
),
_buildTextFieldWithIcon(Icons.person, "Name"),
SizedBox(height: 20.0),
_buildTextFieldWithIcon(Icons.email, "Email"),
SizedBox(height: 20.0),
_buildTextFieldWithIcon(Icons.lock, "Password", isPassword: true),
SizedBox(height: 20.0),
_buildTextFieldWithIcon(Icons.info, "Additional Info"),
SizedBox(height: 20.0),
ElevatedButton(
onPressed: () {
// Add your signup logic here
},
child: Text('Sign Up'),
),
],
),
),
),
),
);
}

Widget _buildTextFieldWithIcon(IconData icon, String labelText, {bool isPassword = false}) {
return TextField(
obscureText: isPassword,
decoration: InputDecoration(
labelText: labelText,
prefixIcon: Icon(icon),
border: OutlineInputBorder(),
),
);
}
}