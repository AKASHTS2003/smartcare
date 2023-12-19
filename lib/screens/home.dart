import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartcare/screens/login.dart';
import 'package:smartcare/screens/navigationmenu/chat.dart';
import 'package:smartcare/screens/navigationmenu/help.dart';
import 'package:smartcare/screens/navigationmenu/location.dart';
import 'package:smartcare/screens/navigationmenu/profile.dart';
import 'package:smartcare/screens/navigationmenu/remainder/remainder.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SmartCare',
          style: TextStyle(
            color: Colors.white, // Set the text color to white
          ),
        ),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            onPressed: () {
              signout(context);
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white, // Set the icon color to white
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Container(
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 120,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: ClipOval(
                              child: Image.asset(
                                'asset/images/Amber-R.jpg', // Update with your image asset path
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Amber Roy',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the drawer
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.grey, // Visible line to separate header
                ),
                buildDrawerItem('Profile', Icons.person, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                }),
                buildDrawerItem('Location Tracking', Icons.location_on, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LocationPage()),
                  );
                }),
                buildDrawerItem('Reminder', Icons.notifications, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => RemainderPage(
                              allReminders: [],
                            )),
                  );
                }),
                buildDrawerItem('Chat', Icons.chat, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ChatPage()),
                  );
                }),
                buildDrawerItem('Help', Icons.help, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HelpPage()),
                  );
                }),
                const SizedBox(height: 285),
                Container(
                  height: 1,
                  color: Colors.grey, // Visible line above the link
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          const SafeArea(
            child: Center(
              child: Text('HomeScreen'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDrawerItem(String text, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget buildClickableLink(String link) {
    return GestureDetector(
      onTap: () {
        // Handle link click
      },
      child: Text(
        link,
        style: const TextStyle(
          color: Colors.red, // Change color to red
          decoration: TextDecoration.none,
          fontSize: 16,
        ),
      ),
    );
  }

  void signout(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => ScreenLogin()), (route) => false);
  }
}
