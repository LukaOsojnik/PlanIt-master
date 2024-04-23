import 'package:flutter/material.dart';
import 'package:flutterproject/database_utils/database_service.dart';
import 'package:flutterproject/models/aktivnost.dart';
import 'package:flutterproject/models/paket.dart';

class ThirdScreen extends StatefulWidget {
  final String location;
  final String date;
  final double budget;
  final List<String> selectedOptions;

  const ThirdScreen({
    required this.location,
    required this.date,
    required this.budget,
    required this.selectedOptions,
  });

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<Package> prearrangedTrips = [];

  @override
  void initState() {
    super.initState();
    fetchPackages();
  }

  Future<void> fetchPackages() async {
    try {
      List<Package> packages = await DatabaseService().fetchPackages(
        widget.location,
        widget.date,
        widget.budget,
        widget.selectedOptions,
      );
      setState(() {
        prearrangedTrips = packages;
      });
    } catch (error) {
      print('Error fetching packages: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prearranged Trips'),
      ),
      body: prearrangedTrips.isEmpty
          ? Center(child:Text('No trips available'))
          : ListView.builder(
              itemCount: prearrangedTrips.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  color: Colors.blue,
                  child: ListTile(
                    title: Text('Trip ${index + 1}', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ActivityListScreen(
                            activities: prearrangedTrips[index].activities,
                          ),
                        ),
                      );
                    },
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    subtitle: Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        SizedBox(width: 8.0),
                        Text(
                          'Rating: ${prearrangedTrips[index].averageActivityRating.toStringAsFixed(1)}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class ActivityListScreen extends StatelessWidget {
  final List<Activity> activities;

  const ActivityListScreen({required this.activities});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activities'),
      ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(activities[index].activityName),
            subtitle: Text('Category: ${activities[index].activityCategory}, Rating: ${activities[index].activityRating}'),
          );
        },
      ),
    );
  }
}
