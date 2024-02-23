class ProductRequestData {
  int? id;
  int? quantity;
  double? productPrice;

  ProductRequestData({this.id, this.quantity, this.productPrice});

  ProductRequestData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    productPrice = json['product_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['product_price'] = this.productPrice;
    return data;
  }
}

