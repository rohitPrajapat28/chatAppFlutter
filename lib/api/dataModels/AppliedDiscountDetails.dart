class AppliedDiscountDetails {
  String? name;
  String? discountCategory;
  String? discountType;
  String? discountCode;
  String? validFrom;
  String? validTo;
  int? fromQty;
  int? toQty;
  double? minAmount;
  double? discountAmount;
  double? discountPercent;
  int? taxIncluded;
  int? shippingIncluded;
  int? priority;
  int? restrictionsCustomerSegments;
  int? restrictionsRegion;
  String? status;
  String? discountApproval;
  String? createdBy;
  String? updatedBy;
  String? created;
  String? updated;

  AppliedDiscountDetails(
      {this.name,
        this.discountCategory,
        this.discountType,
        this.discountCode,
        this.validFrom,
        this.validTo,
        this.fromQty,
        this.toQty,
        this.minAmount,
        this.discountAmount,
        this.discountPercent,
        this.taxIncluded,
        this.shippingIncluded,
        this.priority,
        this.restrictionsCustomerSegments,
        this.restrictionsRegion,
        this.status,
        this.discountApproval,
        this.createdBy,
        this.updatedBy,
        this.created,
        this.updated});

  AppliedDiscountDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    discountCategory = json['discount_category'];
    discountType = json['discount_type'];
    discountCode = json['discount_code'];
    validFrom = json['valid_from'];
    validTo = json['valid_to'];
    fromQty = json['from_qty'];
    toQty = json['to_qty'];
    minAmount = json['min_amount'];
    discountAmount = json['discount_amount'];
    discountPercent = json['discount_percent'];
    taxIncluded = json['tax_included'];
    shippingIncluded = json['shipping_included'];
    priority = json['priority'];
    restrictionsCustomerSegments = json['restrictions_customer_segments'];
    restrictionsRegion = json['restrictions_region'];
    status = json['status'];
    discountApproval = json['discount_approval'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['discount_category'] = this.discountCategory;
    data['discount_type'] = this.discountType;
    data['discount_code'] = this.discountCode;
    data['valid_from'] = this.validFrom;
    data['valid_to'] = this.validTo;
    data['from_qty'] = this.fromQty;
    data['to_qty'] = this.toQty;
    data['min_amount'] = this.minAmount;
    data['discount_amount'] = this.discountAmount;
    data['discount_percent'] = this.discountPercent;
    data['tax_included'] = this.taxIncluded;
    data['shipping_included'] = this.shippingIncluded;
    data['priority'] = this.priority;
    data['restrictions_customer_segments'] = this.restrictionsCustomerSegments;
    data['restrictions_region'] = this.restrictionsRegion;
    data['status'] = this.status;
    data['discount_approval'] = this.discountApproval;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created'] = this.created;
    data['updated'] = this.updated;
    return data;
  }
}
