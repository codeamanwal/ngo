import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ngo/features/data/model/product.dart';

import '../../../data/model/donor.dart';

abstract class HomeState extends Equatable {
  final List<ProductModel>? products;
  final DonorModel? donorModel;
  final int? index;
  final DioError? error;
  final bool? isLoggedIn;
  final bool? isDisplayingProductDetails;
  final bool? isDisplayingMenuDialog;
  final bool? isLoading;
  const HomeState(
      {this.donorModel,
      this.products,
      this.error,
      this.index,
      this.isLoggedIn,
      this.isDisplayingProductDetails,
      this.isDisplayingMenuDialog,
      this.isLoading});

  @override
  List<Object?> get props => [
        products,
        donorModel,
        error,
        index,
        isDisplayingProductDetails,
        isDisplayingMenuDialog,
        isLoading,
      ];
}

class GetProductsState extends HomeState {
  const GetProductsState(bool isLoading) : super(isLoading: isLoading);
}

class GetProductsDoneState extends HomeState {
  const GetProductsDoneState(
      List<ProductModel>? products,
      bool isLoggedIn,
      bool isDisplayingProductDetails,
      int? index,
      bool isDisplayingMenuDialog,
      DonorModel? donorModel,
      bool isLoading)
      : super(
            index: index,
            products: products,
            isLoggedIn: isLoggedIn,
            isDisplayingProductDetails: isDisplayingProductDetails,
            isDisplayingMenuDialog: isDisplayingMenuDialog,
            donorModel: donorModel,
            isLoading: isLoading);
}

class ErrorState extends HomeState {
  const ErrorState(DioError error) : super(error: error);
}
