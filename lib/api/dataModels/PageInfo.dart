class PageInfo {
  int pageIndex;
  bool keepAlive;

  PageInfo({
    required this.pageIndex,
    required this.keepAlive,
  });

  // Factory constructor to create an instance from a Map
  factory PageInfo.fromJson(Map<String, dynamic> json) {
    return PageInfo(
      pageIndex: json['pageIndex'] ?? 0, // Provide a default value if needed
      keepAlive: json['keepAlive'] ?? false, // Provide a default value if needed
    );
  }

  // Convert the object to a JSON representation
  Map<String, dynamic> toJson() {
    return {
      'pageIndex': pageIndex,
      'keepAlive': keepAlive,
    };
  }
}
