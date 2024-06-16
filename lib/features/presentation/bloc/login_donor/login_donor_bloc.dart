import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ngo/core/resources/data_state.dart';
import 'package:ngo/features/data/model/donor.dart';
import 'package:ngo/features/domain/usecase/login_donor.dart';
import 'package:ngo/features/presentation/bloc/login_donor/login_donor_event.dart';
import 'package:ngo/features/presentation/bloc/login_donor/login_donor_state.dart';

class LoginDonorBloc extends Bloc<LoginDonorEvent, LoginDonorState> {
  final LoginDonorUseCase _loginDonorUseCase;
  final storage = const FlutterSecureStorage();

  LoginDonorBloc(this._loginDonorUseCase)
      : super(InitialState(
            DonorModel(donor_mob_number: "", donor_email: ""), false, false)) {
    on<TextChangeEvent>(onTextChange);
    on<LoginDonorSubmitted>(onLoginPresses);
  }

  void onTextChange(
      TextChangeEvent textChangeEvent, Emitter<LoginDonorState> emit) async {
    String value = textChangeEvent.value ?? "";
    int flag = textChangeEvent.flag;

    switch (flag) {
      case 1:
        state.donorModel = state.donorModel!.copyWith(donor_email: value);
      case 2:
        state.donorModel = state.donorModel!.copyWith(donor_mob_number: value);
    }
    print("Donor Model in login : ${state.donorModel}");
  }

  void onLoginPresses(LoginDonorSubmitted loginDonorSubmitted,
      Emitter<LoginDonorState> emit) async {
    emit(InitialState(state.donorModel!, false, true));
    final dataState = await _loginDonorUseCase(parms: state.donorModel);
    if (dataState is DataSuccess) {
      storage.write(key: 'loginToken', value: "${dataState.data!.token}");
      emit(InitialState(
          DonorModel(donor_mob_number: "", donor_email: ""), true, false));
    } else if (dataState is DataFailure) {
      emit(InitialState(state.donorModel!, false, false));
      print("LoginError : ${dataState.error!.error}");
      print("LoginError : ${dataState.error}");
    }
  }
}
