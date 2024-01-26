import 'package:flutter/material.dart';

class CaregiverProfilePage extends StatefulWidget {
  final String name;

  CaregiverProfilePage({required this.name});

  @override
  _CaregiverProfilePageState createState() => _CaregiverProfilePageState();
}

class _CaregiverProfilePageState extends State<CaregiverProfilePage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.name}\'s Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Center(
              child: CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('assets/images/profile_alice.jpg'),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStarRating(4.5, Colors.red, Colors.yellow),
                SizedBox(width: 5.0),
                Text(
                  '32 Reviews',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              '${widget.name}',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Los Angeles',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Age: 28',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              height: 1.0,
              width: 400.0,
              color: Colors.grey,
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Text(
                  '5.8 years',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(width: 10.0),
                Container(
                  height: 20.0,
                  width: 1.0,
                  color: Colors.grey,
                ),
                SizedBox(width: 10.0),
                Text(
                  'Experience',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Text(
                  '1600/day',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(width: 10.0),
                Container(
                  height: 20.0,
                  width: 1.0,
                  color: Colors.grey,
                ),
                SizedBox(width: 10.0),
                Text(
                  'Salary',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'About',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "I am a skilled and experienced caregiver with a passion for providing quality care to individuals. Over the past 5.8 years, I have dedicated myself to ensuring the well-being and comfort of those under my care. My goal is to make a positive impact on the lives of those I work with.",
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                  ),
                  child: Text(
                    'Select Date',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                  ),
                  child: Text(
                    'Select Time',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 20.0),
              ],
            ),
            SizedBox(height: 20.0),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle appointment button press
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding: EdgeInsets.all(16.0),
                    minimumSize: Size(double.infinity, 50.0),
                  ),
                  child: Text(
                    'Make Appointment',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget _buildStarRating(
      double rating, Color starColor, Color emptyStarColor) {
    return Row(
      children: List.generate(5, (index) {
        double starValue = index + 1.0;
        Icon starIcon = Icon(
          starValue <= rating ? Icons.star : Icons.star_border,
          color: starValue <= rating ? starColor : emptyStarColor,
        );
        return starIcon;
      }),
    );
  }
}
