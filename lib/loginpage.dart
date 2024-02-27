import 'package:flutter/material.dart';
import 'package:hotel_management/homescreen.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:hive/hive.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login/Sign Up',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 40.0), // Adjust height as needed
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/logo.jpg'),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Welcome to HoldInn',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: LoginForm(),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.black87),
              ),
              child: InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  _phoneNumber = number.phoneNumber!;
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.DIALOG,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Well call or text to confirm your number. Standard message and data rates apply',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black26),
                children: [
                  TextSpan(
                      text:
                          "By signing in into this app you agree to the HoldInn"),
                  TextSpan(
                    text: "Terms & Conditions",
                    style: TextStyle(color: Colors.blue),
                    // Add your onTap callback if needed
                  ),
                  TextSpan(text: " and acknowledge the "),
                  TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(color: Colors.blue),
                    // Add your onTap callback if needed
                  ),
                  TextSpan(text: "."),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350, // Set desired width
              height: 50, // Set desired height
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final userBox = await Hive.openBox<User>('users');
                    // Combine country code and phone number
                    final combinedPhoneNumber = _phoneNumber;
                    final user = User(combinedPhoneNumber);
                    userBox.add(user);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(logout: User.logout),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Set desired border radius
                  ), // Set background color
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forget Password?',
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text('————————————  or  ————————————'),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'show more options',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class User extends HiveObject {
  late String phoneNumber;

  User(this.phoneNumber);

  static void logout() async {
    final userBox = await Hive.openBox<User>('users');
    userBox.clear();
  }
}
