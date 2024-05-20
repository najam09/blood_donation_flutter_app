import 'package:blood_donation_app_final/services/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'login_screen.dart';
import 'package:random_string/random_string.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController NameController = new TextEditingController();
  TextEditingController EmailController = new TextEditingController();
  TextEditingController PasswordController = new TextEditingController();
  TextEditingController AgeController = new TextEditingController();
  TextEditingController BloodGroupController = new TextEditingController();
  TextEditingController PhoneController = new TextEditingController();
  TextEditingController LocationController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png', // Make sure to have this image in your assets
                  height: 100,
                ),
                SizedBox(height: 10),
                Text(
                  'Dare To Donate',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: NameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.red),
                    hintText: 'Full Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: EmailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.red),
                    hintText: 'user@gmail.com',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: PasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.red),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: PhoneController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone, color: Colors.red),
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: AgeController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone, color: Colors.red),
                    hintText: 'Age',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: BloodGroupController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.bloodtype, color: Colors.red),
                    hintText: 'Blood Group',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: LocationController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on, color: Colors.red),
                    hintText: 'Location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async{
                    String Id = randomAlphaNumeric(5);
                   Map<String, dynamic> PersonInfoMap = {
                    "Name" : NameController.text,
                     "Age" : AgeController.text,
                     "Password" : PasswordController.text,
                     "Email" : EmailController.text,
                     "Blood_Group" : BloodGroupController.text,
                     "Phone" : PhoneController.text,
                     "Location" : LocationController.text,
                     "id" : Id,// Add your signup functionality here
                   };
                   await DatabaseMethods().addPersonRecord(PersonInfoMap, Id);
                   Fluttertoast.showToast(msg: "Registered Successfully!");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                  ),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 16, color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );// Add your register functionality here
                      },
                      child: Text(
                        'Log In.',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
