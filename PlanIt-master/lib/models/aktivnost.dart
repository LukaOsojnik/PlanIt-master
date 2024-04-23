class Activity {
  String activityName;
  String activityCategory;
  String activityLocation;
  double activityRating;
  int reviewNumber;
  
  Activity({
    required this.activityName,
    required this.activityCategory,
    required this.activityLocation,
    required this.activityRating,
    required this.reviewNumber,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      activityName: json['activityName'],
      activityCategory: json['activityCategory'],
      activityLocation: json['activityLocation'],
      activityRating: json['activityRating'].toDouble(),
      reviewNumber: json['reviewNumber'],
    );
  }
}
