import 'package:flutter/foundation.dart';

class LeadCustomerDetails {
  int? customerType;
  int? lead_id;
  String? customerName;
  String? phone;
  String? website;
  int? region;
  int? customerSegment;
  String? taxDetails;
  String? businessSize;
  String? requirementsDuringYear;
  bool? workWithOtherSupplier;
  String? supplierName;
  int? businessConnectedInMt;
  bool? interested;
  String? engagementScoring;
  String? remarks;


  LeadCustomerDetails();

  LeadCustomerDetails.withData(
      {this.customerType,
        this.lead_id,
        this.customerName,
        this.phone,
        this.website,
        this.region,
        this.customerSegment,
        this.taxDetails,
        this.businessSize,
        this.requirementsDuringYear,
        this.workWithOtherSupplier,
        this.supplierName,
        this.businessConnectedInMt,
        this.interested,
        this.engagementScoring,
        this.remarks});

  LeadCustomerDetails.fromJson(Map<String, dynamic> json) {
    try {
      customerType = json['customer_type'];
      lead_id = json['lead_id'];
      customerName = json['customer_name'];
      phone = json['phone'];
      website = json['website'];
      region = json['region'];
      customerSegment = json['customer_segment'];
      taxDetails = json['tax_details'];
      businessSize = json['business_size'];
      requirementsDuringYear = json['requirements_during_year'];
      workWithOtherSupplier = json['work_with_other_supplier'];
      supplierName = json['supplier_name'];
      businessConnectedInMt = json['business_connected_in_mt']?? 0;
      interested = json['interested'];
      engagementScoring = json['engagement_scoring'];
      remarks = json['remarks'];
    }
    catch(error){
      if (kDebugMode) {
        print("error parsing $error");
      }
    }
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    try {
      data['customer_type'] = customerType?.toString();
      data['lead_id']=lead_id?.toString();
      data['customer_name'] = customerName ?? '';
      data['phone'] = phone ?? '';
      data['website'] = website ?? '';
      data['region'] = region?.toString() ?? ''; // Handle null case for region
      data['customer_segment'] = customerSegment?.toString() ?? ''; // Handle null case for customerSegment
      data['tax_details'] = taxDetails.toString() ?? '';
      data['business_size'] = businessSize ?? '';
      data['requirements_during_year'] = requirementsDuringYear ?? '';
      data['work_with_other_supplier'] = workWithOtherSupplier ?? false; // Handle null case for workWithOtherSupplier
      data['supplier_name'] = supplierName ?? '';
      data['business_connected_in_mt'] = businessConnectedInMt ?? 0;
      data['interested'] = interested ?? false; // Handle null case for interested
      data['engagement_scoring'] = engagementScoring ?? '';
      data['remarks'] = remarks ?? '';

      print("object: $data");
      return data;
    } catch (error) {
      print("Error in object: $error");
    }
    return data;
  }

}

