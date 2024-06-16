// import 'package:flutter/material.dart';
// import 'package:ngo/features/presentation/screens/donate_product/donate_product.dart';
// import 'package:ngo/features/presentation/screens/home/home.dart';
// import 'package:ngo/features/presentation/screens/login_donor/login_donor.dart';
// import 'package:ngo/features/presentation/screens/profile/profile.dart';
// import 'package:ngo/features/presentation/screens/register_donor/register_donor.dart';
//
// class AppRoutes {
//   static Route onGenerateRoutes(RouteSettings settings) {
//     switch (settings.name) {
//       case '/home':
//         print('The Home widget is build');
//         return _materialRoute(Home());
//       case '/register_donor':
//         return _materialRoute(RegisterDonor());
//       case '/login_donor':
//         return _materialRoute(LoginDonor());
//       case '/profile':
//         return _materialRoute(Profile());
//       case '/donate':
//         return _materialRoute(DonateProduct());
//
//       default:
//         return _materialRoute(Home());
//     }
//   }
//
//   static Route<dynamic> _materialRoute(Widget view) {
//     return MaterialPageRoute(builder: (_) => view);
//   }
// }

import 'package:flutter/material.dart';
import 'package:ngo/features/presentation/screens/donate_product.dart';
import 'package:ngo/features/presentation/screens/home.dart';
import 'package:ngo/features/presentation/screens/login_donor.dart';
import 'package:ngo/features/presentation/screens/profile.dart';
import 'package:ngo/features/presentation/screens/register_donor.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return _materialRoute(Home());
      case '/register_donor':
        return _materialRoute(const RegisterDonor());
      case '/login_donor':
        return _materialRoute(const LoginDonor());
      case '/profile':
        // Example: Extract arguments and pass them to the Profile widget
        final args = settings.arguments as Map<String, dynamic>? ?? {};
        return _materialRoute(const Profile(), arguments: args);
      case '/donate':
        return _materialRoute(const DonateProduct());

      default:
        return _materialRoute(Home());
    }
  }

  static Route<dynamic> _materialRoute(Widget view,
      {Map<String, dynamic>? arguments}) {
    return MaterialPageRoute(
        builder: (context) => view,
        settings: RouteSettings(arguments: arguments));
  }
}
