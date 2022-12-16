import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vacunapp/src/pages/navigation/navigation_page.dart';
import 'package:vacunapp/src/pages/pages.dart';
import 'package:vacunapp/src/preferences/preferences.dart';
import 'package:vacunapp/src/providers/login_provider.dart';
import 'package:vacunapp/src/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80.0),
                Container(
                  width: double.infinity,
                  //height: 200,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/imgs/logo.png',
                        width: 70,
                      ),
                      Text(
                        'VacunApp',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 255, 104, 63),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40.0),
                Text(
                  'Inicio de sesión',
                  style: GoogleFonts.poppins(
                      fontSize: 28, fontWeight: FontWeight.w700),
                ),
                Text(
                  'Ingrese sus credencionales',
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
                const SizedBox(height: 20.0),

                //Login form
                _LoginForm(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '¿No tienes una cuenta?',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const RegisterTempPage(),
                    ));
              },
              child: Text(
                'Regístrate',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 255, 104, 63),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  bool _isPassword = true;

  void _isVisible() {
    setState(() {
      _isPassword = !_isPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return SizedBox(
      child: Form(
        key: loginProvider.formKey,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    //color: Color.fromARGB(255, 248, 248, 248),
                    color: Theme.of(context).shadowColor,
                    offset: const Offset(0.0, 2.0),
                    blurRadius: Preferences.theme == false ? 20.0 : 3.0,
                  )
                ],
              ),
              child: TextFormField(
                style: GoogleFonts.poppins(color: Colors.black),
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                cursorColor: const Color.fromARGB(255, 255, 104, 63),
                decoration: customInputDecoration(
                  hintText: 'E-mail',
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
                onChanged: (value) => loginProvider.email = value,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                  RegExp regExp = RegExp(pattern);

                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'Correo no válido';
                },
              ),
            ),
            const SizedBox(height: 10.0),
            //password
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    //color: Color.fromARGB(255, 248, 248, 248),
                    color: Theme.of(context).shadowColor,
                    offset: const Offset(0.0, 2.0),
                    blurRadius: Preferences.theme == false ? 20.0 : 3.0,
                  )
                ],
              ),
              child: TextFormField(
                style: GoogleFonts.poppins(color: Colors.black),
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                obscureText: _isPassword,
                cursorColor: const Color.fromARGB(255, 255, 104, 63),
                decoration: customInputDecoration(
                  hintText: 'Contraseña',
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                  suffixIcon: InkWell(
                    onTap: _isVisible,
                    child: Icon(
                      _isPassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                ),
                onChanged: (value) => loginProvider.password = value,
                validator: (value) {
                  return (value != null && value.length >= 8)
                      ? null
                      : 'La contraseña debe tener más de 8 carácteres';
                },
              ),
            ),
            const SizedBox(height: 15.0),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                '¿Olvidó su contraseña?',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 255, 104, 63),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            MaterialButton(
              minWidth: double.infinity,
              height: 60,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              onPressed: loginProvider.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();

                      final authService =
                          Provider.of<AuthService>(context, listen: false);

                      if (!loginProvider.isValidadForm()) return;

                      loginProvider.isLoading = true;

                      final String? errorMessage = await authService.login(
                          loginProvider.email, loginProvider.password);

                      if (errorMessage == null) {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const NavigationPage(),
                            ));
                      } else {
                        loginProvider.isLoading = false;
                        final snackBar = SnackBar(
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: '¡Upsss!',
                            message:
                                'El correo electrónico o la contraseña ingresados no son válidos. Inténtalo de nuevo',
                            contentType: ContentType.failure,
                          ),
                        );

                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      }
                    },
              color: const Color.fromARGB(255, 255, 104, 63),
              child: (loginProvider.isLoading)
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                      backgroundColor: Color.fromARGB(255, 255, 104, 63),
                    )
                  : Text(
                      'Ingresar',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

InputDecoration customInputDecoration({
  final String? hintText,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
}) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2,
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    hintStyle: GoogleFonts.poppins(color: Colors.grey),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    contentPadding: const EdgeInsets.all(20.0),
  );
}
