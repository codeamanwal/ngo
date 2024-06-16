import '../../../data/model/donor.dart';
import '../../../data/model/product.dart';

abstract class ProfileEvent {}

class InitalizeDonorProfileEvent extends ProfileEvent {
  final List<ProductModel>? productList;
  final DonorModel donorModel;
  InitalizeDonorProfileEvent(
      {required this.productList, required this.donorModel});
}

class DisplayDonationEvent extends ProfileEvent {
  final int index;
  final DonorModel donorModel;
  DisplayDonationEvent({required this.index, required this.donorModel});
}
