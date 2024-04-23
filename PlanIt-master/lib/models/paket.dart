import 'package:flutterproject/models/aktivnost.dart';

class Package{
  List<Activity> activities;
  double packagePrice;
  double averageActivityRating;

  Package({
    required this.activities,
    required this.packagePrice,
    required this.averageActivityRating,
  });

  List<Activity> get getActivities=>activities;
  double get getPackagePrice=>packagePrice;
  double get getAverageActivityRating=>averageActivityRating;

}