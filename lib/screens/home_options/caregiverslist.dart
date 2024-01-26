import 'package:flutter/material.dart';
import 'package:smartcare/screens/home_options/caregiversprofile.dart';

class CaregiversListPage extends StatefulWidget {
  @override
  _CaregiversListPageState createState() => _CaregiversListPageState();
}

class _CaregiversListPageState extends State<CaregiversListPage> {
  late List<CaregiverListItem> allCaregivers;
  late List<CaregiverListItem> displayedCaregivers;

  @override
  void initState() {
    super.initState();
    // Initialize the list of all caregivers
    allCaregivers = [
      CaregiverListItem(
        name: 'John Doe',
        age: 35,
        city: 'New York',
        rating: 4.8,
        reviews: 45,
        experience: 7.2,
        dailyRate: 1800,
        profileImage: 'assets/images/profile_john.jpg',
      ),
      CaregiverListItem(
        name: 'Alice Smith',
        age: 28,
        city: 'Los Angeles',
        rating: 4.5,
        reviews: 32,
        experience: 5.8,
        dailyRate: 1600,
        profileImage: 'assets/images/profile_alice.jpg',
      ),
      CaregiverListItem(
        name: 'Robert Johnson',
        age: 45,
        city: 'Chicago',
        rating: 4.7,
        reviews: 39,
        experience: 6.5,
        dailyRate: 1700,
        profileImage: 'assets/images/profile_robert.jpg',
      ),
      CaregiverListItem(
        name: 'Eva Brown',
        age: 40,
        city: 'San Francisco',
        rating: 4.9,
        reviews: 51,
        experience: 8.1,
        dailyRate: 2000,
        profileImage: 'assets/images/profile_eva.jpg',
      ),
      CaregiverListItem(
        name: 'Daniel Wit',
        age: 29,
        city: 'Miami',
        rating: 4.6,
        reviews: 28,
        experience: 5.2,
        dailyRate: 1500,
        profileImage: 'assets/images/profile_daniel.jpg',
      ),
    ];

    // Set the initial displayed caregivers list
    displayedCaregivers = List.from(allCaregivers);
  }

  void searchCaregivers(String query) {
    setState(() {
      // Filter the caregivers (names,city) based on the search query
      displayedCaregivers = allCaregivers
          .where((caregiver) =>
              caregiver.name.toLowerCase().contains(query.toLowerCase()) ||
              caregiver.city.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Caregivers List',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SearchBar(onSearch: searchCaregivers),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: RoundedButton(label: 'Sort By'),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: RoundedButton(label: 'Filter'),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: RoundedButton(label: 'Salary'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.6,
              ),
              child: ListView(
                shrinkWrap: true,
                children: displayedCaregivers,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final Function(String) onSearch;

  const SearchBar({Key? key, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      margin: EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey,
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              onChanged: onSearch,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search caregivers...',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Container(
            width: 58.0,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Icon(
                Icons.mic,
                color: Colors.redAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedButton extends StatefulWidget {
  final String label;

  RoundedButton({required this.label});

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isButtonPressed = !isButtonPressed;
        });
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isButtonPressed ? Colors.grey : Colors.red,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            widget.label,
            style: TextStyle(
              color: isButtonPressed ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class CaregiverListItem extends StatelessWidget {
  final String name;
  final int age;
  final String city;
  final double rating;
  final int reviews;
  final double experience;
  final int dailyRate;
  final String profileImage;

  CaregiverListItem({
    required this.name,
    required this.age,
    required this.city,
    required this.rating,
    required this.reviews,
    required this.experience,
    required this.dailyRate,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CaregiverProfilePage(name: name),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ListTile(
          contentPadding: EdgeInsets.all(16.0),
          leading: CircleAvatar(
            backgroundImage: AssetImage(profileImage),
            radius: 30.0,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text('($age)'),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                city,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8.0),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    SizedBox(width: 4.0),
                    Text('$rating'),
                    Spacer(),
                    Text('$reviews reviews'),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Text('$experience years'),
                  Spacer(),
                  Text('$dailyRate/day'),
                ],
              ),
            ],
          ),
          trailing: ElevatedButton(
            onPressed: () {
              // Handle button press
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
            ),
            child: Text('Request'),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CaregiversListPage(),
  ));
}
