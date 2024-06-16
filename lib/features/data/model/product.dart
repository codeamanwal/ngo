import 'package:json_annotation/json_annotation.dart';
import 'package:ngo/features/data/model/picture.dart';
import 'package:ngo/features/domain/entity/product.dart';

part 'product.g.dart';

@JsonSerializable()
class ProductModel extends ProductEntity {
  ProductModel({
    String? id,
    String? product_title,
    String? product_category,
    List<PictureModel>? product_pictures_before,
    List<PictureModel>? product_pictures_after,
    String? product_description_before,
    String? product_description_after,
    String? product_defects_before,
    String? product_defects_after,
    String? product_area_of_donation,
    bool? product_collection_status,
    bool? product_reimbursement_status,
    bool? product_repair_status,
    double? product_repair_amount,
    bool? product_received,
    String? product_donor,
    String? product_agent,
  }) : super(
          id = id,
          product_title = product_title,
          product_category = product_category,
          product_pictures_before = product_pictures_before,
          product_pictures_after = product_pictures_after,
          product_description_before = product_description_before,
          product_description_after = product_description_after,
          product_defects_before = product_defects_before,
          product_defects_after = product_defects_after,
          product_area_of_donation = product_area_of_donation,
          product_collection_status = product_collection_status,
          product_reimbursement_status = product_reimbursement_status,
          product_repair_status = product_repair_status,
          product_repair_amount = product_repair_amount,
          product_received = product_received,
          product_donor = product_donor,
          product_agent = product_agent,
        );

  ProductModel copyWith({
    String? id,
    String? product_title,
    String? product_category,
    List<PictureModel>? product_pictures_before,
    List<PictureModel>? product_pictures_after,
    String? product_description_before,
    String? product_description_after,
    String? product_defects_before,
    String? product_defects_after,
    String? product_area_of_donation,
    bool? product_collection_status,
    bool? product_reimbursement_status,
    bool? product_repair_status,
    double? product_repair_amount,
    bool? product_received,
    String? product_donor,
    String? product_agent,
  }) {
    return ProductModel(
      id: id ?? this.id,
      product_title: product_title ?? this.product_title,
      product_category: product_category ?? this.product_category,
      product_pictures_before:
          product_pictures_before ?? this.product_pictures_before,
      product_pictures_after:
          product_pictures_after ?? this.product_pictures_after,
      product_description_before:
          product_description_before ?? this.product_description_before,
      product_description_after:
          product_description_after ?? this.product_description_after,
      product_defects_before:
          product_defects_before ?? this.product_defects_before,
      product_defects_after:
          product_defects_after ?? this.product_defects_after,
      product_area_of_donation:
          product_area_of_donation ?? this.product_area_of_donation,
      product_collection_status:
          product_collection_status ?? this.product_collection_status,
      product_reimbursement_status:
          product_reimbursement_status ?? this.product_reimbursement_status,
      product_repair_status:
          product_repair_status ?? this.product_repair_status,
      product_repair_amount:
          product_repair_amount ?? this.product_repair_amount,
      product_received: product_received ?? this.product_received,
      product_donor: product_donor ?? this.product_donor,
      product_agent: product_agent ?? this.product_agent,
    );
  }

  // Factory method to create a ProductModel from a JSON Map
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
