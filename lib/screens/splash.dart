import 'package:flutter/material.dart';
import 'login.dart'; // Import the login page

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/images/splash.png', // Ensure your path is correct
              width: 500.0,
              height: 500.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'Care Connect App',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Simplifying Caregiving Tasks',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the login page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenLogin()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                onPrimary: Colors.white,
                padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 100.0),
              ),
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
