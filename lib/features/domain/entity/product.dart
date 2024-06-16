import 'package:equatable/equatable.dart';
import 'package:ngo/features/data/model/picture.dart';

class ProductEntity extends Equatable {
  String? id;
  String? product_title;
  String? product_category;
  List<PictureModel>? product_pictures_before;
  List<PictureModel>? product_pictures_after;
  String? product_description_before;
  String? product_description_after;
  String? product_defects_before;
  String? product_defects_after;
  String? product_area_of_donation;
  bool? product_collection_status;
  bool? product_reimbursement_status;
  bool? product_repair_status;
  double? product_repair_amount;
  bool? product_received;
  String? product_donor;
  String? product_agent;

  ProductEntity(
      this.id,
      this.product_title,
      this.product_category,
      this.product_pictures_before,
      this.product_pictures_after,
      this.product_description_before,
      this.product_description_after,
      this.product_defects_before,
      this.product_defects_after,
      this.product_area_of_donation,
      this.product_collection_status,
      this.product_reimbursement_status,
      this.product_repair_status,
      this.product_repair_amount,
      this.product_received,
      this.product_donor,
      this.product_agent);

  @override
  List<Object?> get props {
    return [
      id,
      product_title,
      product_category,
      product_pictures_before,
      product_pictures_after,
      product_description_before,
      product_description_after,
      product_defects_before,
      product_defects_after,
      product_area_of_donation,
      product_collection_status,
      product_reimbursement_status,
      product_repair_status,
      product_repair_amount,
      product_received,
      product_donor,
      product_agent,
    ];
  }
}
