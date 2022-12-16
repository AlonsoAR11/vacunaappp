import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:vacunapp/src/preferences/preferences.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
        title: Text(
          'Ayuda',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/imgs/support.json',
              width: 230,
            ),
            const SizedBox(height: 20.0),

            ///
            Text(
              '¿Como podemos ayudarte?',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ),

            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Si presentas algún problema o tienes alguna duda contáctanos por los siguientes medios:',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 10.0),

            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 180,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20.0,
                    ),
                    margin: const EdgeInsets.only(top: 30.0, left: 20.0),
                    decoration: _customBoxDecoration(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Por correo',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Icon(
                          Icons.mail_outline,
                          color: Color.fromARGB(255, 255, 104, 63),
                          size: 50,
                        ),
                        Text(
                          'vacunapp\n@gmail.com',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    height: 180,
                    margin: const EdgeInsets.only(top: 30.0, right: 20.0),
                    decoration: _customBoxDecoration(context),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 20.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Por WhatsApp',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: Color.fromARGB(255, 255, 104, 63),
                          size: 50,
                        ),
                        Text(
                          '+51 900 800 100',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _customBoxDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      //color: Colors.white,
      color: Theme.of(context).backgroundColor,
      boxShadow: [
        BoxShadow(
          //color: Color.fromARGB(255, 248, 248, 248),
          color: Theme.of(context).shadowColor,
          offset: const Offset(0.0, 2.0),
          blurRadius: Preferences.theme == false ? 20.0 : 2.0,
        )
      ],
    );
  }
}
