import 'package:flutter/foundation.dart';

class CampaignDetails {
  int? id;
  String? code;
  String? name;
  String? startDate;
  String? endDate;
  String? status;
  bool isSelected=false;

  CampaignDetails();

  CampaignDetails.withData(
      {this.id,
      this.code,
      this.name,
      this.startDate,
      this.endDate,
      this.status,
      this.isSelected=false
      });

  CampaignDetails.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      code = json['code'];
      name = json['name'];
      startDate = json['start_date'];
      endDate = json['end_date'];
      status = json['status'];
      isSelected = json['isSelected'] ?? false;
    }
    catch(error){
      if (kDebugMode) {
        print("error parsing $error");
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['status'] = status;
    data['isSelected'] = isSelected;
    return data;
  }
}
