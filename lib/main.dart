import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vacunapp/src/pages/navigation/navigation_page.dart';
import 'package:vacunapp/src/preferences/preferences.dart';
import 'package:vacunapp/src/providers/login_provider.dart';
import 'package:vacunapp/src/providers/theme_provider.dart';
import 'package:vacunapp/src/services/auth_service.dart';

//Pages
import 'package:vacunapp/src/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkMode: Preferences.theme),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthService(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      home: const OnboardingPage(),
      // onGenerateRoute: MyRoutes.generateRoute,
      // initialRoute: MyRoutes.rOnboarding,
    );
  }
}
