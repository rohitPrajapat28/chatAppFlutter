class RegionInfo {
  int id;
  String name;

  RegionInfo({
    required this.id,
    required this.name,
  });

  // Factory constructor to create an instance from a Map
  factory RegionInfo.fromJson(Map<String, dynamic> json) {
    return RegionInfo(
      id: json['id'] ?? 0, // Provide a default value if needed
      name: json['name'] ?? "", // Provide a default value if needed
    );
  }

  // Convert the object to a JSON representation
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
