import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vacunapp/src/preferences/preferences.dart';
import 'package:vacunapp/src/providers/login_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final List<Widget> _samplePages = [
    const Center(
      child: FormOneWidget(),
    ),
    const Center(
      child: Text('Page 2'),
    ),
    const Center(
      child: Text('Page 3'),
    )
  ];

  final _controller = PageController();
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  bool _stepOne = true;
  bool _stepTwo = false;
  bool _stepThree = false;

  int _index = 1;

  String _nameStep = 'Datos básicos';

  Color primaryColor = const Color.fromARGB(255, 255, 104, 63);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                '$_index/3',
                style: GoogleFonts.poppins(
                    fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                _nameStep,
                style: GoogleFonts.poppins(
                    fontSize: 17, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 20.0),
            //Steps lines
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      //width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _stepOne ? primaryColor : Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Container(
                      //width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _stepTwo ? primaryColor : Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Container(
                      //width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _stepThree ? primaryColor : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            //Texts
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Registro',
                style: GoogleFonts.poppins(
                    fontSize: 28, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Ingrese sus datos para crear su cuenta',
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ),
            const SizedBox(height: 0.0),
            Flexible(
              child: PageView.builder(
                controller: _controller,
                itemCount: _samplePages.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return _samplePages[index % _samplePages.length];
                },
              ),
            ),

            //Buttons
            Container(
              color: primaryColor,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    splashColor: _index == 1
                        ? Colors.transparent
                        : const Color(0x66C8C8C8),
                    highlightColor: _index == 1
                        ? Colors.transparent
                        : const Color(0x66BCBCBC),
                    enableFeedback: _index == 1 ? false : true,
                    child: Text(
                      'Atras',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: _index == 1 ? Colors.white70 : Colors.white,
                      ),
                    ),
                    onPressed: () {
                      _controller.previousPage(
                          duration: _kDuration, curve: _kCurve);

                      if (_index > 1 && _index <= _samplePages.length + 1) {
                        _index -= 1;

                        if (_index == 1) {
                          _nameStep = 'Datos básicos';
                          _stepTwo = false;
                        }

                        if (_index == 2) {
                          _nameStep = 'Verificación';
                          _stepThree = false;
                        }

                        if (_index == 3) {
                          _nameStep = 'Verificación final';
                        }
                      }

                      setState(() {});
                    },
                  ),
                  MaterialButton(
                    splashColor: _index == 3
                        ? Colors.transparent
                        : const Color(0x66C8C8C8),
                    highlightColor: _index == 3
                        ? Colors.transparent
                        : const Color(0x66BCBCBC),
                    enableFeedback: _index == 3 ? false : true,
                    child: Text(
                      'Continuar',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: _index == 3 ? Colors.white70 : Colors.white,
                      ),
                    ),
                    onPressed: () {
                      _controller.nextPage(
                          duration: _kDuration, curve: _kCurve);

                      if (_index < _samplePages.length) {
                        _index += 1;

                        if (_index == 1) {}

                        if (_index == 2) {
                          _nameStep = 'Verificación';
                          _stepTwo = true;
                        }
                        if (_index == 3) {
                          _nameStep = 'Verificación final';
                          _stepThree = true;
                        }
                      }

                      //Verifico si el step1 es true
                      // if (_stepOne == true) {
                      //   //Verifico si el step2 es true
                      //   if (_stepTwo == true) {
                      //     //Cambio el valor false -> true
                      //     _stepThree = true;
                      //     //_index += 1;
                      //     //_nameStep = 'Verificación final';

                      //   }
                      //   //Cambio el valor false -> true
                      //   _stepTwo = true;

                      //   //_nameStep = 'Verificación';
                      // }

                      setState(() {});
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FormOneWidget extends StatelessWidget {
  const FormOneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
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
              ),
            ),
            const SizedBox(height: 12.0),
            //TextFormField TIpo
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
                  hintText: 'Tipo de documento',
                  prefixIcon: const Icon(
                    Icons.file_copy_rounded,
                    color: Colors.grey,
                  ),
                ),
              ),
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
              ),
            ),
            const SizedBox(height: 12.0),
            //TextFormField fecha emision
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
                keyboardType: TextInputType.datetime,
                cursorColor: const Color.fromARGB(255, 255, 104, 63),
                decoration: _customInputDecoration(
                  hintText: 'Fecha de emisión',
                  prefixIcon: const Icon(
                    Icons.calendar_month,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            //TextFormField fecha nacimiento
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
                keyboardType: TextInputType.datetime,
                cursorColor: const Color.fromARGB(255, 255, 104, 63),
                decoration: _customInputDecoration(
                  hintText: 'Fecha de nacimiento',
                  prefixIcon: const Icon(
                    Icons.calendar_month,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
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
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    hintStyle: GoogleFonts.poppins(color: Colors.grey),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    contentPadding: const EdgeInsets.all(20.0),
  );
}
