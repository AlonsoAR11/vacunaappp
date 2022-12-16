import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:vacunapp/src/pages/login/login_page.dart';
import 'package:vacunapp/src/routes/routes.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

int numberText = 0;

final styleTextTitle = GoogleFonts.poppins(
  fontSize: 25,
  fontWeight: FontWeight.w900,
  height: 1,
);

final styleTextSubTitle = GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: const Color.fromARGB(255, 121, 121, 121),
  height: 1,
);

final List<dynamic> texts = [
  {
    "title": 'Controla tu salud',
    "subtitle":
        "VacunApp te permite registrar y verificar tu historial de vacunación.",
    "img": 'assets/imgs/lottie1.json',
  },
  {
    "title": 'Personal calificado',
    "subtitle": "Encuentra sugerencias de profesionales de la salud.",
    "img": 'assets/imgs/lottie2.json',
  },
  {
    "title": 'Ponte al día con tus vacunas',
    "subtitle": "Entérate de campañas de vacunación cerca a ti.",
    "img": 'assets/imgs/lottie3.json',
  },
];

const primaryColor = Color.fromARGB(255, 255, 119, 46);

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
                  //Navigator.pushReplacementNamed(context, MyRoutes.rLogin);
                },
                child: Text(
                  'SALTAR',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 255, 104, 63),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Texts slider
          SizedBox(
            height: sizeHeight * 0.7,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  numberText = value;
                });
              },
              itemCount: texts.length,
              itemBuilder: (context, index) {
                final texto = texts[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Lottie.asset(texto['img']),
                      const SizedBox(height: 20.0),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: Text(
                          texto['title'],
                          style: styleTextTitle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Text(
                        texto['subtitle'],
                        style: styleTextSubTitle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          //Circle animation indicator
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  texts.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: numberText == index
                          ? primaryColor
                          : const Color.fromARGB(255, 182, 182, 182),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              )
            ],
          ),

          //Button start
          // MaterialButton(
          //   minWidth: double.infinity,
          //   height: 60,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(20.0),
          //   ),
          //   onPressed: () {},
          //   color: const Color.fromARGB(255, 255, 104, 63),
          //   child: Text(
          //     'Ingresar',
          //     style: GoogleFonts.poppins(
          //       fontSize: 15,
          //       fontWeight: FontWeight.w600,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;

    return Container(
      height: sizeHeight * 0.60,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage('https://i.ibb.co/mT8F10K/fondito.jpg'),
            fit: BoxFit.cover),
      ),
    );
  }
}
