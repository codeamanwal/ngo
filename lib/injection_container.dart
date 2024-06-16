import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ngo/features/data/remote/ngo_api_service.dart';
import 'package:ngo/features/data/repository/ngo_repository_impl.dart';
import 'package:ngo/features/domain/repository/ngo_repository.dart';
import 'package:ngo/features/domain/usecase/donate_product.dart';
import 'package:ngo/features/domain/usecase/get_products.dart';
import 'package:ngo/features/domain/usecase/login_donor.dart';
import 'package:ngo/features/domain/usecase/register_donor.dart';
import 'package:ngo/features/domain/usecase/verify_donor.dart';
import 'package:ngo/features/presentation/bloc/donation_form/donate_product_bloc.dart';
import 'package:ngo/features/presentation/bloc/login_donor/login_donor_bloc.dart';
import 'package:ngo/features/presentation/bloc/register_donor/register_donor_bloc.dart';

import 'features/presentation/bloc/home/home_bloc.dart';
import 'features/presentation/bloc/profile/profile_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<NGOApiService>(NGOApiService(sl()));

  sl.registerSingleton<NGORepository>(NGORepositoryImpl(sl()));

  sl.registerSingleton<GetProductUseCase>(GetProductUseCase(sl()));
  sl.registerSingleton<RegisterDonorUseCase>(RegisterDonorUseCase(sl()));
  sl.registerSingleton<LoginDonorUseCase>(LoginDonorUseCase(sl()));
  sl.registerSingleton<VerifyDonorUseCase>(VerifyDonorUseCase(sl()));
  sl.registerSingleton<DonateProductUseCase>(DonateProductUseCase(sl()));

  sl.registerSingleton<RegisterDonorBloc>(RegisterDonorBloc(sl()));
  sl.registerSingleton<LoginDonorBloc>(LoginDonorBloc(sl()));
  sl.registerSingleton<HomeBloc>(HomeBloc(sl(), sl()));
  sl.registerSingleton<ProfileBloc>(ProfileBloc());
  sl.registerSingleton<DonateProductBloc>(DonateProductBloc(sl()));
}
