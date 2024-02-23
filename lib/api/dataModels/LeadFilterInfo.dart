class LeadFilterInfo {
  int id;
  String name;
  bool isSelected=false;

  LeadFilterInfo({
    required this.id,
    required this.name,
    required this.isSelected,
  });

  // Factory constructor to create an instance from a Map
  factory LeadFilterInfo.fromJson(Map<String, dynamic> json) {
    return LeadFilterInfo(
      id: json['id'] ?? 0, // Provide a default value if needed
      name: json['name'] ?? "",
      isSelected: json['isSelected']?? false, // Provide a default value if needed
    );
  }

  // Convert the object to a JSON representation
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isSelected':isSelected,
    };
  }
}
