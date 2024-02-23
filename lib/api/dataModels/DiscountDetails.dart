import 'package:flutter/foundation.dart';

class DiscountDetails {
  int? id;
  String? name;
  String? discountType;
  double? discountAmount;
  double? discountPercent;


  DiscountDetails();

  DiscountDetails.withData(
      {this.id,
        this.name,
        this.discountType,
        this.discountAmount,
        this.discountPercent});


  DiscountDetails.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      name = json['name'];
      discountType = json['discount_type'];
      discountAmount = json['discount_amount'];
      discountPercent = json['discount_percent'];
    }
    catch(error){
      if (kDebugMode) {
        print("error parsing $error");
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['discount_type'] = this.discountType;
    data['discount_amount'] = this.discountAmount;
    data['discount_percent'] = this.discountPercent;
    return data;
  }
}
