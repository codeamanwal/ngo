import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ngo/core/resources/data_state.dart';
import 'package:ngo/features/data/model/donor.dart';
import 'package:ngo/features/data/model/product.dart';
import 'package:ngo/features/data/remote/ngo_api_service.dart';
import 'package:ngo/features/data/remote/responses/response.dart';
import 'package:ngo/features/data/remote/responses/verify_response.dart';
import 'package:ngo/features/domain/repository/ngo_repository.dart';

class NGORepositoryImpl implements NGORepository {
  final NGOApiService _ngoApiService;

  NGORepositoryImpl(this._ngoApiService);

  @override
  Future<DataState<List<ProductModel>>> getAllProducts() async {
    try {
      final httpResponse = await _ngoApiService.getProducts();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(httpResponse.data);
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailure(DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<GeneralResponse>> registerDonor(
      DonorModel donorModel) async {
    try {
      final httpResponse =
          await _ngoApiService.registerDonor(donorModel.toJson());
      if (httpResponse.response.statusCode == HttpStatus.created) {
        print(httpResponse.data);
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailure(DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<GeneralResponse>> loginDonor(DonorModel donorModel) async {
    try {
      print("Donor Model : ${donorModel}");
      final httpResponse = await _ngoApiService.loginDonor(donorModel.toJson());
      if (httpResponse.response.statusCode == HttpStatus.created) {
        print("Login Response : ${httpResponse.data.message}");
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailure(DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<VerifyResponse>> verifyDonor(String? token) async {
    print("Verify Donor : ${token}");
    try {
      final httpResponse = await _ngoApiService.verifyDonor("Bearer ${token}");
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(httpResponse.data.donor);
        print(httpResponse.data.iat);
        print(httpResponse.data.exp);
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailure(DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<GeneralResponse>> donateProduct(ProductModel productModel,
      List<File> productImages, String donorMobile) async {
    print("donateProduct : ${productModel}");
    print("donateProduct : ${productImages}");
    print("donateProduct : ${donorMobile}");
    List<MultipartFile> images = [];
    for (var img in productImages) {
      images.add(await MultipartFile.fromFile(img.path));
    }

    try {
      final httpResponse = await _ngoApiService.donateProduct(
          productModel.product_title ?? "",
          productModel.product_category ?? "",
          productModel.product_description_before ?? "",
          productModel.product_defects_before ?? "",
          productModel.product_area_of_donation ?? "",
          donorMobile,
          images);
      print("donateProduct : ${httpResponse.response.statusMessage}");
      if (httpResponse.response.statusCode == HttpStatus.created) {
        print("donateProduct : Success Created");
        print("donateProduct : ${httpResponse.data}");
        return DataSuccess(httpResponse.data);
      } else {
        print("donateProduct : ${httpResponse.response.statusCode}");
        print("donateProduct : ${httpResponse.response.statusMessage}");

        return DataFailure(DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      print("donateProduct : ${e}");
      return DataFailure(e);
    }
  }
}
