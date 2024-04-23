import 'dart:math';

import 'package:flutterproject/models/aktivnost.dart';
import 'package:flutterproject/models/paket.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:supabase_flutter/supabase_flutter.dart';


class DatabaseService{

  final String databaseUrl='https://mjqgepurgeexmhqzjrro.supabase.co';
  final String anonKey='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1qcWdlcHVyZ2VleG1ocXpqcnJvIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcxMjYwMTI3NCwiZXhwIjoyMDI4MTc3Mjc0fQ.65gSntT9kMpX9q-fDCo1gWlD45n2mmt6XPxaB1wH_zw';

 Future<List<Package>> fetchPackages(String location, String date,double budget,List<String> activities) async{
  
  final response = await Supabase.instance.client
    .from('activities')
    .select('name, category, location, rating, reviews_count')
    .eq('location', location)
    .filter('category_id', 'in', '(3, 1)');


  print(response);
  
  
  // String sqlQuery = '''
  //     SELECT name, category, location, actual_rating, reviews_count
  //     FROM activities
  //     WHERE location = '$location'
  //     AND category IN (${activities.map((activity) => "'$activity'").join(',')})
  //   ''';

  // String encodedQuery = Uri.encodeQueryComponent(sqlQuery);
  // String apiUrl = '$databaseUrl/rest/v1/rpc/query?query=$encodedQuery';



  // final response = await http.get(
  //     Uri.parse(apiUrl),
  //     headers: {
  //       'apikey': anonKey,
  //       'Content-Type': 'application/json',
  //     },
  //   );


  // if (response.isNotEmpty) {
  //   // List<dynamic> responseData = json.decode(response.body);

  //   List<Activity> activities = responseData
  //         .map((data) => Activity.fromJson(data))
  //         .toList();

  //   activities.shuffle();

  //   List<Package> packages = [];

  //     for (int i = 0; i < Random().nextInt(2) + 3; i++) {
  //       int numActivities = Random().nextInt(2) + 2;
  //       List<Activity> selectedActivities =
  //           activities.sublist(0, min(numActivities,  activities.length));

  //       double totalRating = selectedActivities.fold(
  //           0.0, (sum, activity) => sum + activity.activityRating);
  //       double averageRating = selectedActivities.isNotEmpty
  //           ? totalRating / selectedActivities.length
  //           : 0.0;

  //       Package package = Package(
  //         activities: selectedActivities,
  //         packagePrice: 100.0, // Assume fixed price
  //         averageActivityRating: averageRating,
  //       );

  //       packages.add(package);

  //       // Remove selected activities from the list to avoid repetition
  //        activities.removeWhere((activity) => selectedActivities.contains(activity));
  //     }

  //     return packages;

    
  // }
  // else{
  //   print('Request failed with status: ${response.statusCode}');
  //   print('Response body: ${response.body}');
  //  throw Exception('Failed to fetch packages');
  // }


  return [];
 }

}