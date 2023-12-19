import 'package:flutter/material.dart';
import 'package:smartcare/screens/navigationmenu/remainder/model.dart';
import 'package:smartcare/screens/navigationmenu/remainder/remainderadd.dart';

class RemainderPage extends StatefulWidget {
  final List<Reminder> allReminders;
  RemainderPage({required this.allReminders});

  @override
  _RemainderPageState createState() => _RemainderPageState();
}

class _RemainderPageState extends State<RemainderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewAllReminders(widget.allReminders),
                  ),
                );
                if (result != null) {
                  widget.allReminders.removeAt(result);
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, // Set the button color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 2.0,
              ),
              child: Text(
                'View All',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AddReminderPage(allReminders: widget.allReminders),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, // Set the button color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 2.0,
              ),
              child: Text(
                'Add Reminder',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewAllReminders extends StatelessWidget {
  final List<Reminder> allReminders;

  ViewAllReminders(this.allReminders);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Reminders'),
      ),
      body: ListView.builder(
        itemCount: allReminders.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ListTile(
              title: Text(allReminders[index].title),
              subtitle: Text(allReminders[index].notes),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  final result = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Delete Reminder'),
                        content: Text(
                            'Are you sure you want to delete this reminder?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Text('Delete'),
                          ),
                        ],
                      );
                    },
                  );
                  if (result != null && result) {
                    Navigator.pop(context, index);
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
