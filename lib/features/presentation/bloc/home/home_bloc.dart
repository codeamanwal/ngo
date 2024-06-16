import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ngo/core/resources/data_state.dart';
import 'package:ngo/features/data/model/donor.dart';
import 'package:ngo/features/data/remote/responses/verify_response.dart';
import 'package:ngo/features/domain/usecase/verify_donor.dart';
import 'package:ngo/features/presentation/bloc/home/home_event.dart';
import 'package:ngo/features/presentation/bloc/home/home_state.dart';

import '../../../domain/usecase/get_products.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProductUseCase _getProductUseCase;
  final VerifyDonorUseCase _verifyDonorUseCase;
  final storage = const FlutterSecureStorage();

  HomeBloc(this._getProductUseCase, this._verifyDonorUseCase)
      : super(const GetProductsState(true)) {
    on<GetProductsEvent>(getProducts);
    on<ToggleProductInformationEvent>(toggleProductDetails);
    on<ToggleMenuDialogEvent>(toggleMenuDialog);
    on<LogOutEvent>(logOut);
  }

  void getProducts(
      GetProductsEvent getProductsEvent, Emitter<HomeState> emit) async {
    String token = await storage.read(key: 'loginToken') ?? "null";

    // Verifying the Stored Token is Valid or not
    final verifyResponse = await _verifyDonorUseCase(parms: token);
    late bool result;
    late DonorModel? donorModel;
    if (verifyResponse is DataSuccess) {
      print("Verification Successfully : ${verifyResponse.data!.donor}");
      String serializedDonor = jsonEncode(verifyResponse.data!.donor);
      storage.write(key: "donor", value: serializedDonor);
      print("donor data : ${verifyResponse.data!.donor}");
      donorModel = verifyResponse.data!.donor;
      result = true;
    } else {
      print("Verification Error : ${ErrorState(verifyResponse.error!)}");
      storage.write(key: "loginToken", value: "null");
      donorModel = null;
      result = false;
    }

    // Getting the products from the server if the already not fetched
    print("getProducts : Getting Products from database");
    final dataState = await _getProductUseCase();
    if (dataState is DataSuccess) {
      emit(GetProductsDoneState(
          dataState.data, result, false, 0, false, donorModel, false));
    } else {
      emit(ErrorState(dataState.error!));
    }
  }

  Future<DataState<VerifyResponse>> verifyToken(String token) async {
    final dataState = await _verifyDonorUseCase(parms: token);
    if (dataState is DataSuccess) {
      print("Verification Successfully : ${dataState.data!.donor}");
      String serializedDonor = jsonEncode(dataState.data!.donor);
      storage.write(key: "donor", value: serializedDonor);
      print("verifyUser : donor data saved to storage");
      print("donor data : ${dataState.data!.donor}");
      return dataState;
    } else {
      print("Verification Error : ${ErrorState(dataState.error!)}");
      storage.write(key: "loginToken", value: "null");
      return dataState;
    }
  }

  void toggleProductDetails(
      ToggleProductInformationEvent event, Emitter<HomeState> emit) {
    emit(GetProductsDoneState(
        state.products,
        state.isLoggedIn!,
        !state.isDisplayingProductDetails!,
        event.index,
        false,
        state.donorModel,
        false));
  }

  void toggleMenuDialog(ToggleMenuDialogEvent event, Emitter<HomeState> emit) {
    emit(GetProductsDoneState(state.products, state.isLoggedIn!, false,
        state.index!, !state.isDisplayingMenuDialog!, state.donorModel, false));
  }

  void logOut(LogOutEvent logOutEvent, Emitter<HomeState> emit) async {
    storage.write(key: 'loginToken', value: "null");
    emit(GetProductsDoneState(state.products, false, false, state.index, false,
        state.donorModel, false));
  }
}
