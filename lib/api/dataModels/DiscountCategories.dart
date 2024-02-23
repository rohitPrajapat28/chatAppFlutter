import 'package:flutter/foundation.dart';


import 'DiscountDetails.dart';

class DiscountCategories {
  int? id;
  String? name;
  List<DiscountDetails>? discounts;

  DiscountCategories({this.id, this.name, this.discounts});

  DiscountCategories.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      name = json['name'];
      if (json['discounts'] != null) {
        discounts = <DiscountDetails>[];
        json['discounts'].forEach((v) {
          discounts!.add(DiscountDetails.fromJson(v));
        });
      }
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
    if (this.discounts != null) {
      data['discounts'] = this.discounts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
