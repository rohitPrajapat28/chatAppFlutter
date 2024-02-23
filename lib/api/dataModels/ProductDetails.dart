import 'package:flutter/foundation.dart';

class ProductDetails {
   int? id;
   int? productID;
   String? code="";
   int? qty=0;
   String? sku="";
   double? price=0;
   String? status="";

  ProductDetails();


   ProductDetails.withData({this.id, this.productID,this.code, this.sku, this.price, this.qty, this.status});

   ProductDetails.fromJson(Map<String, dynamic> json) {
     try {
       id = json['id'];
       productID = json['product_id'];
       code = json['code'];
       sku = json['sku'];
       price = json['customer_price'];
       qty = json['quantity'];
       status = json['status'];
     }
     catch(error){
       if (kDebugMode) {
         print("error parsing $error");
       }
     }
   }

   Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data['id'] = this.id;
     data['product_id']=this.productID;
     data['code'] = this.code;
     data['sku'] = this.sku;
     data['customer_price'] = this.price;
     data['quantity'] = this.qty;
     data['status'] = this.status;
     return data;
   }
}
