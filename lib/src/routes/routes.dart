import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vacunapp/src/pages/navigation/navigation_page.dart';

//Pages
import 'package:vacunapp/src/pages/pages.dart';

class MyRoutes {
  static const String rOnboarding = '/onboarding';
  static const String rLogin = '/login';
  static const String rRegister = '/register';
  static const String rRegisterTemp = '/registerTemp';
  static const String rNavigation = '/navigation';
  static const String rDetailsMyCampaign = '/details_my_campaign';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ('/onboarding'):
        return CupertinoPageRoute(builder: (context) => const OnboardingPage());
      case ('/login'):
        return CupertinoPageRoute(builder: (context) => const LoginPage());
      // case ('/register'):
      //   return CupertinoPageRoute(builder: (context) => const RegisterPage());
      case ('/registerTemp'):
        return CupertinoPageRoute(
            builder: (context) => const RegisterTempPage());
      case ('/navigation'):
        return CupertinoPageRoute(builder: (context) => const NavigationPage());
      // case ('/details_my_campaign'):
      //   return CupertinoPageRoute(
      //       builder: (context) => const DetailMyCampaignPage(
      //             numberTicket: '',
      //           ));
      default:
        return CupertinoPageRoute(builder: (context) => const RegisterPage());
    }
  }
}
