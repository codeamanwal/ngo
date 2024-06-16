import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ngo/core/resources/data_state.dart';
import 'package:ngo/features/data/model/donor.dart';
import 'package:ngo/features/data/model/product.dart';
import 'package:ngo/features/domain/usecase/donate_product.dart';
import 'package:ngo/features/presentation/bloc/donation_form/donate_product_event.dart';
import 'package:ngo/features/presentation/bloc/donation_form/donate_product_state.dart';

class DonateProductBloc extends Bloc<DonateProductEvent, DonateProductState> {
  final DonateProductUseCase _donateProductUseCase;
  final storage = const FlutterSecureStorage();

  DonateProductBloc(this._donateProductUseCase)
      : super(InitialState(
            ProductModel(
              product_title: "",
              product_category: "",
              product_description_before: "",
              product_defects_before: "",
              product_area_of_donation: "",
            ),
            [],
            false)) {
    on<TextChangeEvent>(onTextChange);
    on<DonateProductSubmitted>(onDonatePresses);
    on<ImageAddingEvent>(onImageAdded);
  }
  void onTextChange(
      TextChangeEvent textChangeEvent, Emitter<DonateProductState> emit) async {
    String value = textChangeEvent.value ?? "";
    int flag = textChangeEvent.flag;

    switch (flag) {
      case 1:
        state.productModel =
            state.productModel!.copyWith(product_title: textChangeEvent.value);
      case 2:
        state.productModel = state.productModel!
            .copyWith(product_category: textChangeEvent.value);
      case 3:
        state.productModel = state.productModel!
            .copyWith(product_description_before: textChangeEvent.value);
      case 4:
        state.productModel = state.productModel!
            .copyWith(product_defects_before: textChangeEvent.value);
      case 5:
        state.productModel = state.productModel!
            .copyWith(product_area_of_donation: textChangeEvent.value);
    }
    print("DonationForm onTextChange : ${state.productModel}");
  }

  void onImageAdded(
      ImageAddingEvent imageAddingEvent, Emitter<DonateProductState> emit) {
    print("onImageAdded : ${imageAddingEvent.imageFiles}");
    state.imageFiles = imageAddingEvent.imageFiles;
  }

  void onDonatePresses(DonateProductSubmitted donateProductSubmitted,
      Emitter<DonateProductState> emit) async {
    emit(InitialState(state.productModel!, state.imageFiles ?? [], true));
    print("onDonatePressed : ${state.productModel}");
    print("onDonatePressed : ${state.imageFiles}");

    late String serializedDonor;
    try {
      serializedDonor = await storage.read(key: "donor") ?? "null";
      if (serializedDonor == "null") {
        throw Exception("donor data not found");
      }
    } catch (e) {
      emit(InitialState(state.productModel!, state.imageFiles, false));
    }

    DonorModel donorModel =
        await DonorModel.fromJson(jsonDecode(serializedDonor));

    try {
      final dataState = await _donateProductUseCase(parms: [
        state.productModel,
        state.imageFiles,
        donorModel.donor_mob_number
      ]);
      print("onDonatePresses : ${dataState.data!.message}");
      if (dataState is DataSuccess) {
        print("onDonatePresses : Product registered for Donation");
        emit(SuccessState(state.productModel!, state.imageFiles!));
      } else {
        print("onDonatePressed error : ${dataState.error}");
        emit(InitialState(state.productModel!, state.imageFiles, false));
      }
    } on DioError catch (e) {
      print("onDonatePressed catch : ${e}");
      emit(InitialState(state.productModel!, state.imageFiles, false));
    }
  }
}
