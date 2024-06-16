import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ngo/features/data/model/donor.dart';
import 'package:ngo/features/data/model/product.dart';
import 'package:ngo/features/presentation/bloc/profile/profile_event.dart';
import 'package:ngo/features/presentation/bloc/profile/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final storage = const FlutterSecureStorage();

  ProfileBloc() : super(InitializingState()) {
    on<DisplayDonationEvent>(displayDonation);
    on<InitalizeDonorProfileEvent>(loadDonarProfile);
  }

  void loadDonarProfile(
      InitalizeDonorProfileEvent event, Emitter<ProfileState> emit) async {
    emit(LoadingState());
    DonorModel donorModel = event.donorModel;
    List<ProductModel>? productList = event.productList;
    List<ProductModel>? donorProductList = [];
    for (String id in donorModel.donor_products!) {
      for (ProductModel product in productList!) {
        if (id == product.id) {
          donorProductList.add(product);
          break;
        }
      }
    }
    emit(InitialState(
        donorModel: event.donorModel, donorProducts: donorProductList));
  }

  void displayDonation(
    DisplayDonationEvent event,
    Emitter<ProfileState> emit,
  ) {
    print("dispalay Donation : Display Donation Emitter");
  }
}
