import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Placeholder values for the caregiver's profile data
  String name = 'Amber Roy';
  String email = 'roy@example.com';
  String phoneNumber = '123-456-7890';
  String address = 'ABC House, GH street, Delhi';
  String profileOverview =
      'Seeking a compassionate caregiver with a nursing background and a minimum of 1 year of hospital experience to provide dedicated care for my wife, Amber Roy, who is living with Alzheimer\'s disease. The ideal candidate should exhibit patience, possess medical knowledge, and communicate effectively. Flexible scheduling options available.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Profile Picture with Camera Icon
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/Amber-R.jpg', // Update with your image asset path
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt, color: Colors.white),
                  onPressed: () {
                    // Handle the camera icon press (for changing the photo)
                    // You can open a bottom sheet, modal, or navigate to a new page.
                    // For simplicity, I'm just printing a message.
                    print('Change Photo');
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          // Caregiver's Name
          Text(
            name,
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          SizedBox(height: 8.0),
          // Caregiver's Email (Non-Editable)
          _buildNonEditableField('Email', email, Icons.mail),
          SizedBox(height: 16.0),
          // Divider
          Divider(),
          SizedBox(height: 16.0),
          // Profile Overview (Non-Editable)
          _buildNonEditableField(
              'Profile Overview', profileOverview, Icons.description),
          SizedBox(height: 16.0),
          // Phone Number (Non-Editable)
          _buildNonEditableField('Phone Number', phoneNumber, Icons.phone),
          SizedBox(height: 16.0),
          // Company Name (Non-Editable)
          _buildNonEditableField('Address', address, Icons.location_on),
          SizedBox(height: 32.0), // Add more space below the buttons
          // Submit Button
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildNonEditableField(String label, String value, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.red),
            SizedBox(width: 8.0),
            Text(
              label,
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.edit,
                  color: Colors.red), // Change edit icon color to red
              onPressed: () {
                // Handle the edit button press
                // You can open a dialog, bottom sheet, or navigate to an edit page.
                // For simplicity, I'm just printing a message.
                print('Edit $label');
              },
            ),
          ],
        ),
        SizedBox(height: 8.0),
        Text(
          value,
          style: TextStyle(fontSize: 16.0, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      width: double.infinity, // Make the button take the full width
      child: ElevatedButton(
        onPressed: () {
          // Handle the submit button press
          // You can update the caregiver's information in the database or perform other actions.
          print('Submit Button Pressed');
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.red, // Red background color
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Submit',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}
