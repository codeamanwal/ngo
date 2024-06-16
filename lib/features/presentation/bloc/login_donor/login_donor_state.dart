import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:ngo/features/data/model/donor.dart';

abstract class LoginDonorState extends Equatable {
  DonorModel? donorModel;
  bool? isLoggedIn;
  bool? isLoading;

  final DioError? error;

  LoginDonorState(
      {this.donorModel, this.error, this.isLoggedIn, this.isLoading});

  @override
  List<Object?> get props => [donorModel, isLoggedIn, isLoading];
}

class InitialState extends LoginDonorState {
  InitialState(DonorModel donorModel, bool isLoggedIn, bool isLoading)
      : super(
            donorModel: donorModel,
            isLoggedIn: isLoggedIn,
            isLoading: isLoading);
}

class InvalidState extends LoginDonorState {
  InvalidState(DonorModel donorModel) : super(donorModel: donorModel);
}

class ErrorState extends LoginDonorState {
  ErrorState(DonorModel donorModel, DioError? error)
      : super(donorModel: donorModel, error: error);
}
