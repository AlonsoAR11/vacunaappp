import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vacunapp/src/pages/navigation/navigation_page.dart';
import 'package:vacunapp/src/pages/onboarding/onboarding_page.dart';
import 'package:vacunapp/src/services/auth_service.dart';

class VerifyAuthPage extends StatelessWidget {
  const VerifyAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.leerToken(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Text(
                'Procesando...',
                style: TextStyle(fontSize: 30),
              );
            }

            if (snapshot.data == '') {
              Future.microtask(
                () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const OnboardingPage(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                },
                /*
                Navigator.pushNamedAndRemoveUntil(
                context, MyRoutes.rLOGIN, (route) => false);
                */
              );
            } else {
              Future.microtask(
                () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const NavigationPage(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
