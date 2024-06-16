import 'package:equatable/equatable.dart';

class DonorEntity extends Equatable {
  final String? donor_name;
  final String donor_mob_number;
  final String? donor_address;
  final String donor_email;
  final String? donor_id_type;
  final String? donor_id_number;
  final String? donor_pan_number;
  final bool? donor_anonymous;
  final List<String>? donor_products;

  const DonorEntity(
      {this.donor_name,
      required this.donor_mob_number,
      this.donor_address,
      required this.donor_email,
      this.donor_id_type,
      this.donor_id_number,
      this.donor_pan_number,
      this.donor_anonymous,
      this.donor_products});

  @override
  List<Object?> get props {
    return [
      donor_name,
      donor_mob_number,
      donor_address,
      donor_email,
      donor_id_type,
      donor_id_number,
      donor_pan_number,
      donor_anonymous,
      donor_products,
    ];
  }
}
