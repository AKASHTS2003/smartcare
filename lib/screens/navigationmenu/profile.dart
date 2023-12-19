import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Placeholder values for the caregiver's profile data
  String name = 'Amber Roy';
  String email = 'amberroy@example.com';
  String phoneNumber = '123-456-7890';
  String companyName = 'XYZ Care Services';
  String profileOverview =
      'Amber Roy is a seasoned caregiver with a passion for providing top-notch support. Known for her empathy and professionalism, Amber excels in personalized care, health monitoring, and creating positive environments. With a wealth of experience, she is dedicated to enhancing the well-being of her clients.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caregiver Profile', style: TextStyle(color: Colors.white)),
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
                    'asset/images/Amber-R.jpg', // Update with your image asset path
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt),
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
          SizedBox(height: 8.0),
          // Review Rating and Client Count
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildShapedContainer('4.5/5'),
              SizedBox(width: 16.0),
              _buildShapedContainer('130+ Clients'),
            ],
          ),
          SizedBox(height: 16.0),
          // Caregiver's Name
          Text(
            name,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          // Caregiver's Email (Non-Editable)
          Text(
            email,
            style: TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
          SizedBox(height: 16.0),
          // Divider
          Divider(),
          SizedBox(height: 16.0),
          // Profile Overview
          _buildEditableField('Profile Overview', profileOverview,
              isEditable: true),
          SizedBox(height: 16.0),
          // Phone Number (Editable)
          _buildEditableField('Phone Number', phoneNumber, isEditable: true),
          SizedBox(height: 16.0),
          // Company Name (Editable)
          _buildEditableField('Company Name', companyName, isEditable: true),
          SizedBox(height: 16.0),
          // Submit Button
          ElevatedButton(
            onPressed: () {
              // Handle the submit button press
              // You can update the caregiver's information in the database or perform other actions.
              print('Submit Button Pressed');
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red, // Red background color
              onPrimary: Colors.white, // White text color
            ),
            child: Text('Submit'),
          ),
          SizedBox(height: 32.0), // Add more space below the button
        ],
      ),
    );
  }

  Widget _buildEditableField(String label, String value,
      {bool isEditable = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 8.0),
        if (isEditable)
          TextFormField(
            initialValue: value,
            maxLines: null, // Allow multiple lines for profile overview
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            onChanged: (newValue) {
              if (label == 'Phone Number') {
                phoneNumber = newValue;
              } else if (label == 'Company Name') {
                companyName = newValue;
              } else if (label == 'Profile Overview') {
                profileOverview = newValue;
              }
            },
          )
        else
          Text(
            value,
            style: TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
      ],
    );
  }

  Widget _buildShapedContainer(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}
