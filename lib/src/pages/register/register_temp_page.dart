import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vacunapp/src/pages/login/login_page.dart';
import 'package:vacunapp/src/pages/navigation/navigation_page.dart';
import 'package:vacunapp/src/preferences/preferences.dart';
import 'package:vacunapp/src/providers/login_provider.dart';
import 'package:vacunapp/src/services/auth_service.dart';

class RegisterTempPage extends StatelessWidget {
  const RegisterTempPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10.0),
                Text(
                  'Registro',
                  style: GoogleFonts.poppins(
                      fontSize: 28, fontWeight: FontWeight.w700),
                ),
                Text(
                  'Ingrese sus datos para crear su cuenta',
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
                const SizedBox(height: 20.0),
                ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: _LoginForm(),
                ),
              ],
            ),
          ),
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
  final List<String> genderItems = [
    'Documento Nacional de Identidad(DNI)',
    'Carnet de extranjería(CE)',
    'Pasaporte',
  ];

  String? selectedValue;

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
            //TextFormField nombres
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
                keyboardType: TextInputType.text,
                cursorColor: const Color.fromARGB(255, 255, 104, 63),
                decoration: _customInputDecoration(
                  hintText: 'Nombres',
                  prefixIcon: const Icon(
                    Icons.abc,
                    color: Colors.grey,
                  ),
                ),
                validator: (value) {
                  if (value == '') {
                    return 'Por favor ingrese sus nombres';
                  }
                },
                onChanged: (value) {
                  Preferences.name = value;
                  setState(() {});
                },
              ),
            ),
            const SizedBox(height: 12.0),
            //TextFormField apellidos
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
                keyboardType: TextInputType.text,
                cursorColor: const Color.fromARGB(255, 255, 104, 63),
                decoration: _customInputDecoration(
                  hintText: 'Apellidos',
                  prefixIcon: const Icon(
                    Icons.abc,
                    color: Colors.grey,
                  ),
                ),
                validator: (value) {
                  if (value == '') {
                    return 'Por favor ingrese sus apellidos';
                  }
                },
                onChanged: (value) {
                  Preferences.lastname = value;
                  setState(() {});
                },
              ),
            ),
            const SizedBox(height: 12.0),
            //TextFormField TIpo
            DropdownButtonFormField2(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                enabledBorder: OutlineInputBorder(
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
                prefixIcon: const Icon(
                  Icons.file_copy_rounded,
                  color: Colors.grey,
                ),
              ),
              isExpanded: true,
              hint: Text(
                'Tipo de documento',
                style: GoogleFonts.poppins(color: Colors.grey, fontSize: 16.0),
              ),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              style: GoogleFonts.poppins(color: Colors.grey),
              iconSize: 30,
              buttonHeight: 65,
              buttonPadding: const EdgeInsets.only(right: 20),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              dropdownWidth: 250,
              items: genderItems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Container(
                          width: 300,
                          child: Text(
                            item,
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: 16.0),
                          ),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return '      Por favor seleccione el tipo';
                }
              },
              onChanged: (value) {
                //Do something when changing the item if you want.
              },
              onSaved: (value) {
                selectedValue = value.toString();
              },
            ),
            const SizedBox(height: 12.0),
            //TextFormField numero documento
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
                keyboardType: TextInputType.number,
                cursorColor: const Color.fromARGB(255, 255, 104, 63),
                decoration: _customInputDecoration(
                  hintText: 'Número de documento',
                  prefixIcon: const Icon(
                    Icons.file_copy_rounded,
                    color: Colors.grey,
                  ),
                ),
                validator: (value) {
                  if (value == '') {
                    return 'Por favor ingrese su número de documento';
                  }
                },
                onChanged: (value) {
                  Preferences.numberDocument = value;
                  setState(() {});
                },
              ),
            ),
            const SizedBox(height: 12.0),
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
                decoration: _customInputDecoration(
                  hintText: 'E-mail',
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
                onChanged: (value) {
                  loginProvider.email = value;
                  Preferences.email = value;
                  setState(() {});
                },
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
                decoration: _customInputDecoration(
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

                      final String? errorMessage = await authService.createUser(
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
                      'Registrarse',
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

InputDecoration _customInputDecoration({
  final String? hintText,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
}) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 0,
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
