import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/features/presentation/bloc/register_donor/register_donor_event.dart';
import 'package:ngo/features/presentation/bloc/register_donor/register_donor_state.dart';

import '../../../../core/resources/data_state.dart';
import '../../../domain/usecase/register_donor.dart';

class RegisterDonorBloc extends Bloc<RegisterDonorEvent, RegisterDonorState> {
  final RegisterDonorUseCase _registerDonorUseCase;

  RegisterDonorBloc(this._registerDonorUseCase) : super(InitialState()) {
    on<TextChangeEvent>(onTextChange);
    on<RegisterDonorSubmittedEvent>(onRegisterPresses);
  }

  void onTextChange(
      TextChangeEvent textChangeEvent, Emitter<RegisterDonorState> emit) async {
    String value = textChangeEvent.value ?? "";
    int flag = textChangeEvent.flag;
    switch (flag) {
      case 1:
        state.donorModel = state.donorModel.copyWith(donor_name: value);
      case 2:
        state.donorModel = state.donorModel.copyWith(donor_mob_number: value);
      case 3:
        state.donorModel = state.donorModel.copyWith(donor_address: value);
      case 4:
        state.donorModel = state.donorModel.copyWith(donor_email: value);
      case 5:
        state.donorModel = state.donorModel.copyWith(donor_id_type: value);
      case 6:
        state.donorModel = state.donorModel.copyWith(donor_id_number: value);
      case 7:
        state.donorModel = state.donorModel.copyWith(donor_pan_number: value);
      case 8:
        state.donorModel = state.donorModel
            .copyWith(donor_anonymous: value == "false" ? false : true);
    }
    print("RegisterTextChangeEvent : ${state.donorModel}");
  }

  void onRegisterPresses(
      RegisterDonorSubmittedEvent registerDonorSubmittedEvent,
      Emitter<RegisterDonorState> emit) async {
    state.isLoading = true;
    // emit(LoadingState());
    print("OnRegisterPressed : ${state.donorModel}");

    final _dataState = await _registerDonorUseCase(parms: state.donorModel);
    if (_dataState is DataSuccess) {
      print(
          "RegistrationSuccess : ${_dataState.data!.message} the token : ${_dataState.data!.token}");
    } else {
      // emit(RegisterErrorState(_dataState.error!));
      print("Registration Error : ${_dataState.error!.error}");
    }
    state.isLoading = false;
  }
}
