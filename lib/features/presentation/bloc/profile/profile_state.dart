import 'package:ngo/features/data/model/donor.dart';

import '../../../data/model/product.dart';

abstract class ProfileState {
  final DonorModel? donorModel;
  final List<ProductModel>? donorProducts;
  bool? isDisplayingProduct;
  bool? isLoading;
  ProfileState(
      {this.donorModel,
      this.donorProducts,
      this.isDisplayingProduct,
      this.isLoading});
}

class InitializingState extends ProfileState {}

class InitialState extends ProfileState {
  InitialState(
      {required super.donorModel,
      required super.donorProducts,
      super.isLoading});
}

class ErrorState extends ProfileState {
  final String error;
  ErrorState(
      {required this.error,
      super.donorModel,
      super.donorProducts,
      super.isLoading});
}

class LoadingState extends ProfileState {
  LoadingState({super.donorModel, super.donorProducts});
}
