import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartcare/screens/home_options/caregiverslist.dart';
import 'package:smartcare/screens/login.dart';
import 'package:smartcare/screens/navigationmenu/chat.dart';
import 'package:smartcare/screens/navigationmenu/help.dart';
import 'package:smartcare/screens/navigationmenu/location.dart';
import 'package:smartcare/screens/navigationmenu/profile.dart';
import 'package:smartcare/screens/navigationmenu/remainder/remainder.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SmartCare',
          style: TextStyle(
            color: Colors.white,
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
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: _buildBody(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Call',
          ),
        ],
      ),
      drawer: buildDrawer(),
    );
  }

  Widget buildDrawer() {
    return Drawer(
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
                              'assets/images/Amber-R.jpg',
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
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey,
              ),
              buildDrawerItem('Profile', Icons.person, () {
                navigateToPage(ProfilePage());
              }),
              buildDrawerItem('Location Tracking', Icons.location_on, () {
                navigateToPage(LocationPage());
              }),
              buildDrawerItem('Reminder', Icons.notifications, () {
                navigateToPage(RemainderPage(allReminders: []));
              }),
              buildDrawerItem('Chat', Icons.chat, () {
                navigateToPage(ChatPage());
              }),
              buildDrawerItem('Help', Icons.help, () {
                navigateToPage(HelpPage());
              }),
              const SizedBox(height: 285),
              Container(
                height: 1,
                color: Colors.grey,
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return _buildHomeScreenContent();
      case 1:
        return buildPaymentScreen();
      case 2:
        return buildVideoScreen();
      case 3:
        return buildCallScreen();
      default:
        return Container();
    }
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

  Widget _buildHomeScreenContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: _buildPaymentCard(
              'Kids',
              'assets/images/rh1.jpg',
              Colors.white,
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: _buildPaymentCard(
              'Older People',
              'assets/images/rh2.jpg',
              Colors.white,
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: _buildPaymentCard(
              'Disabled People',
              'assets/images/rh3.jpg',
              Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard(
    String title,
    String backgroundImage,
    Color textColor,
  ) {
    return GestureDetector(
      onTap: () {
        navigateToPage(CaregiversListPage());
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPaymentScreen() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: _buildPaymentCard(
              'Credit/Debit/ATM',
              'assets/images/rb1.jpg',
              Colors.white,
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: _buildPaymentCard(
              'Net Banking',
              'assets/images/rb2.jpg',
              Colors.white,
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: _buildPaymentCard(
              'Wallet',
              'assets/images/rb3.jpg',
              Colors.white,
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: _buildPaymentCard(
              'UPI',
              'assets/images/rb4.jpg',
              Colors.white,
            ),
          ),
          SizedBox(height: 16.0),
          _buildCircleBubbleButton(),
        ],
      ),
    );
  }

  Widget _buildCircleBubbleButton() {
    return GestureDetector(
      onTap: () {
        // Handle payment history button press
      },
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        child: Center(
          child: Icon(
            Icons.history,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildVideoScreen() {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Video Calls',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Recent',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildVideoCallTile('John Doe',
                    'assets/images/profile_john.jpg', '10:15 AM', true),
                _buildVideoCallTile('Alice Smith',
                    'assets/images/profile_alice.jpg', 'Yesterday', false),
                _buildVideoCallTile('Robert Johnson',
                    'assets/images/profile_robert.jpg', '9:30 AM', true),
                _buildVideoCallTile('Eva Brown',
                    'assets/images/profile_eva.jpg', '2 days ago', false),
                _buildVideoCallTile('Daniel Wit',
                    'assets/images/profile_daniel.jpg', '3 days ago', true),
                // Add more video call tiles as needed
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle video call button press
        },
        backgroundColor: Colors.red,
        child: Icon(
          Icons.videocam,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildVideoCallTile(
      String name, String profileImage, String time, bool isCallTaken) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(profileImage),
      ),
      title: Text(name),
      subtitle: Text(time),
      trailing: Icon(
        isCallTaken ? Icons.videocam_off : Icons.videocam,
        color: isCallTaken ? Colors.red : Colors.green,
      ),
      onTap: () {
        // Handle tapping on the video call tile
      },
    );
  }

  Widget buildCallScreen() {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Calls',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Recent',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildCallTile('John Doe', 'assets/images/profile_john.jpg',
                    '10:15 AM', true),
                _buildCallTile('Alice Smith', 'assets/images/profile_alice.jpg',
                    'Yesterday', false),
                _buildCallTile('Robert Johnson',
                    'assets/images/profile_robert.jpg', '9:30 AM', true),
                _buildCallTile('Eva Brown', 'assets/images/profile_eva.jpg',
                    '2 days ago', false),
                _buildCallTile('Daniel Wit', 'assets/images/profile_daniel.jpg',
                    '3 days ago', true),
                // Add more call tiles as needed
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle call button press
        },
        backgroundColor: Colors.red,
        child: Icon(
          Icons.phone,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildCallTile(
      String name, String profileImage, String time, bool isCallTaken) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(profileImage),
      ),
      title: Text(name),
      subtitle: Text(time),
      trailing: Icon(
        isCallTaken ? Icons.call_missed : Icons.call_received,
        color: isCallTaken ? Colors.red : Colors.green,
      ),
      onTap: () {
        // Handle tapping on the call tile
      },
    );
  }

  void signout(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => ScreenLogin()),
      (route) => false,
    );
  }

  void navigateToPage(Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
