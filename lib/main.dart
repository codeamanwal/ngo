import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngo/config/routes.dart';
import 'package:ngo/config/themes/theme.dart';
import 'package:ngo/features/presentation/bloc/donation_form/donate_product_bloc.dart';
import 'package:ngo/features/presentation/bloc/home/home_bloc.dart';
import 'package:ngo/features/presentation/bloc/login_donor/login_donor_bloc.dart';
import 'package:ngo/features/presentation/bloc/profile/profile_bloc.dart';
import 'package:ngo/features/presentation/bloc/register_donor/register_donor_bloc.dart';
import 'package:ngo/injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = const MaterialTheme(TextTheme());
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<RegisterDonorBloc>()),
        BlocProvider(create: (context) => sl<LoginDonorBloc>()),
        BlocProvider(create: (context) => sl<HomeBloc>()),
        BlocProvider(create: (context) => sl<ProfileBloc>()),
        BlocProvider(create: (context) => sl<DonateProductBloc>()),
      ],
      child: MaterialApp(
        theme: theme.light(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}
