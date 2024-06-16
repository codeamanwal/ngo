import 'dart:io';

import 'package:ngo/features/data/model/donor.dart';
import 'package:ngo/features/data/model/product.dart';
import 'package:ngo/features/data/remote/responses/response.dart';
import 'package:ngo/features/data/remote/responses/verify_response.dart';

import '../../../core/resources/data_state.dart';

abstract class NGORepository {
  Future<DataState<List<ProductModel>>> getAllProducts();

  Future<DataState<GeneralResponse>> registerDonor(DonorModel donorModel);

  Future<DataState<GeneralResponse>> loginDonor(DonorModel donorModel);

  Future<DataState<VerifyResponse>> verifyDonor(String token);

  Future<DataState<GeneralResponse>> donateProduct(
      ProductModel productModel, List<File> productImages, String donorMobile);
}
