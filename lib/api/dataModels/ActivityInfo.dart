class ActivityInfo {
  int id;
  String name;
  int noOfDays;

  ActivityInfo({
    required this.id,
    required this.name,
    required this.noOfDays
  });

  // Factory constructor to create an instance from a Map
  factory ActivityInfo.fromJson(Map<String, dynamic> json) {
    return ActivityInfo(
      id: json['id'] ?? 0, // Provide a default value if needed
      name: json['name'] ?? "",
      noOfDays: json['no_of_days']?? 0// Provide a default value if needed
    );
  }

  // Convert the object to a JSON representation
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'no_of_days':noOfDays,
    };
  }
}
