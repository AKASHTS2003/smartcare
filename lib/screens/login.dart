import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartcare/screens/home.dart';

const String SAVE_KEY_NAME = 'some_key_name';

class ScreenLogin extends StatefulWidget {
  ScreenLogin({Key? key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isDataMatched = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.red, // Red color as the main color
            Colors.white, // White color
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: _buildBottom(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.black, // Set the background color to black
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome",
            style: TextStyle(
              color: Colors.white, // White color
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          _buildGreyText("Please login with your information"),
          SizedBox(height: 60),
          _buildGreyText("Username"),
          _buildInputField(_usernameController),
          SizedBox(height: 40),
          _buildGreyText("Password"),
          _buildInputField(_passwordController, isPassword: true),
          SizedBox(height: 20),
          _buildRememberForgot(),
          SizedBox(height: 20),
          _buildLoginButton(),
          SizedBox(height: 20),
          _buildOtherLogin(),
        ],
      ),
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.grey),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white), // White color
        ),
      ),
      obscureText: isPassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Value is Empty';
        } else {
          return null;
        }
      },
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: _isDataMatched,
              onChanged: (value) {
                setState(() {
                  _isDataMatched = value!;
                });
              },
            ),
            _buildGreyText("Remember me"),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: _buildGreyText("I forgot my password"),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          checkLogin(context);
        } else {
          print('Data Empty');
        }
      },
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        elevation: 20,
        primary: Colors.red, // Set the background color to red
        onPrimary: Colors.white, // Set the text color to white
        minimumSize: Size.fromHeight(60),
      ),
      child: Text("LOGIN", style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildOtherLogin() {
    return Center(
      child: Column(
        children: [
          _buildGreyText("Or Login with"),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SignInButton(
              Buttons.Google,
              onPressed: () {
                // Handle Google sign-in here
                SignInButton(
                  Buttons.Google,
                  onPressed: () {},
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == _password) {
      print('Username Password match');

      // Go to Home
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);

      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => ScreenHome(),
        ),
      );
    } else {
      print('Username Password does not match');
      setState(() {
        _isDataMatched = false;
      });
    }
  }
}
