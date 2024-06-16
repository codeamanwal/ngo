import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ngo/features/data/model/product.dart';

abstract class DonateProductState extends Equatable {
  ProductModel? productModel;
  List<File>? imageFiles;
  bool? isLoading;
  final DioError? error;

  DonateProductState(
      {this.productModel, this.error, this.imageFiles, this.isLoading});

  @override
  List<Object?> get props => [productModel, error, imageFiles, isLoading];
}

class InitialState extends DonateProductState {
  InitialState(
      ProductModel productModel, List<File>? imageFiles, bool isLoading)
      : super(
            productModel: productModel,
            imageFiles: imageFiles,
            isLoading: isLoading);
}

class InvalidState extends DonateProductState {
  InvalidState(ProductModel productModel, List<File> imageFiles)
      : super(productModel: productModel, imageFiles: imageFiles);
}

class ErrorState extends DonateProductState {
  ErrorState(ProductModel productModel, DioError? error, List<File> imageFiles)
      : super(productModel: productModel, error: error, imageFiles: imageFiles);
}

class SuccessState extends DonateProductState {
  SuccessState(ProductModel productModel, List<File> imageFiles)
      : super(productModel: productModel, imageFiles: imageFiles);
}
