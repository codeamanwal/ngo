import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ngo/features/data/model/donor.dart';

abstract class RegisterDonorState extends Equatable {
  bool? isLoading = false;
  DonorModel donorModel = DonorModel(
    donor_name: "",
    donor_mob_number: "",
    donor_email: "",
    donor_pan_number: "",
    donor_id_type: "",
    donor_id_number: "",
    donor_address: "",
    donor_anonymous: false,
  );
  final DioError? error;

  RegisterDonorState({this.error, this.isLoading});

  @override
  List<Object?> get props => [donorModel];
}

class InitialState extends RegisterDonorState {}

class RegisterErrorState extends RegisterDonorState {
  RegisterErrorState(DioError? error) : super(error: error);
}

class RegisteredSuccessfullyState extends RegisterDonorState {}
