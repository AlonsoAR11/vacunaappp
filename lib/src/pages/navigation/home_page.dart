import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vacunapp/src/models/campaigns_model.dart';
import 'package:vacunapp/src/pages/pages.dart';
import 'package:vacunapp/src/preferences/preferences.dart';
import 'package:vacunapp/src/widgets/map_widget.dart';

List<Campaigns> myCampign = [];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listProcess = myCampign.where((o) => o.state == 'En curso').toList();

    listCancelledAndAttended = myCampign
        .where((o) => o.state == 'Terminado' || o.state == 'Cancelado')
        .toList();

    final List<dynamic> dataCampaign = [
      {
        'nameCampaign': 'Vacunación contra la COVID-19',
        'descriptionCampaign':
            'Para personas mayores de 18 años que residan en este distrito',
        'ageCampaign': '18 años en adelante',
        'hourCampaign': '03hrs 20m 59s',
        'placeCampaign': 'Colegio Gomez N° 89007. Urb. 21 de Abril Zona B',
        'latCampaign': -9.06686,
        'lonCampaign': -78.58204,
        'stateCampaign': 'En curso',
        'categoryCampaign': 'COVID 19',
        'dateCampaign': '15/11/22',
      },
      {
        'nameCampaign': 'Vacunación contra la TETANO',
        'descriptionCampaign':
            'Para personas mayores de 18 años que residan en este distrito',
        'ageCampaign': '18 años en adelante',
        'hourCampaign': '05hrs 10m 59s',
        'placeCampaign': 'Estadio Centenario Chimbote. Ref. Mega Plaza',
        'latCampaign': -9.067078424107738,
        'lonCampaign': -78.58378291190455,
        'stateCampaign': 'En curso',
        'categoryCampaign': 'TETANO',
        'dateCampaign': '16/11/22',
      },
      {
        'nameCampaign': 'Vacunación contra la INFLUENZA',
        'descriptionCampaign':
            'Para personas mayores de 15 años que residan en este distrito',
        'ageCampaign': '15 años en adelante',
        'hourCampaign': '032hrs 33m 29s',
        'placeCampaign': 'Colegio Jorge Chavez N° 89003. Calle. Ramiro Priale',
        'latCampaign': -9.066450084431784,
        'lonCampaign': -78.58158032573219,
        'stateCampaign': 'En curso',
        'categoryCampaign': 'INFLUENZA',
        'dateCampaign': '16/11/22',
      },
      {
        'nameCampaign': 'Vacunación contra HEPATITIS B',
        'descriptionCampaign':
            'Para personas mayores de 5 años que residan en este distrito',
        'ageCampaign': '5 años en adelante',
        'hourCampaign': '01hrs 20m 12s',
        'placeCampaign':
            'Colegio Maria reina N° 10028. Calle. Ormeño, Nuevo Chimbote',
        'latCampaign': -9.067152744529677,
        'lonCampaign': -78.58257345887161,
        'stateCampaign': 'En curso',
        'categoryCampaign': 'HEPATITIS B',
        'dateCampaign': '18/11/22',
      },
      {
        'nameCampaign': 'Vacunación contra el DENGUE',
        'descriptionCampaign':
            'Para personas mayores de 3 años que residan en este distrito',
        'ageCampaign': '3 años en adelante',
        'hourCampaign': '03hrs 20m 59s',
        'placeCampaign': 'Colegio Rch  N° 834027. Calle. Aviacion 2da. Etapa',
        'latCampaign': -9.06510533976244,
        'lonCampaign': -78.58227043719906,
        'stateCampaign': 'En curso',
        'categoryCampaign': 'DENGUE',
        'dateCampaign': '19/11/22',
      },
      {
        'nameCampaign': 'Vacunación contra VIRUELA',
        'descriptionCampaign':
            'Para personas mayores de 7 años que residan en este distrito',
        'ageCampaign': '7 años en adelante',
        'hourCampaign': '09hrs 20m 59s',
        'placeCampaign':
            'Colegio Inmaculada Concepcion N° 89007. Jr. Santa Rosa',
        'latCampaign': -9.072019893770472,
        'lonCampaign': -78.58260110905287,
        'stateCampaign': 'En curso',
        'categoryCampaign': 'VIRUELA',
        'dateCampaign': '19/11/22',
      }
    ];

    final List<dynamic> dataNextCampaigns = [
      {
        'name': 'COVID-19',
        'nameCampaign': 'Vacunación contra la COVID-19',
        'descriptionCampaign':
            'Para personas mayores de 18 años que residan en este distrito',
        'ageCampaign': '18 años en adelante',
        'time': '08:20 - 20:00',
        'date': '25',
        'placeCampaign': 'Colegio "San Lucas" Nº 3210, Chimbote',
      },
      {
        'name': 'POLIO',
        'nameCampaign': 'Vacunación contra la POLIO',
        'descriptionCampaign':
            'Para personas mayores de 1 año a 6 años que residan en este distrito',
        'ageCampaign': '1 año - 6 años',
        'time': '10:00 - 16:00',
        'date': '26',
        'placeCampaign': 'Polideportivo Casuarinas, Nuevo Chimbote',
      },
      {
        'name': 'COVID-19',
        'nameCampaign': 'Vacunación contra la COVID-19',
        'descriptionCampaign':
            'Para personas mayores de 5 años a 11 años que residan en este distrito',
        'ageCampaign': '5 años - 11 años',
        'time': '08:20 - 20:00',
        'date': '27',
        'placeCampaign':
            'Colegio Santa Maria Reyna, Chimbote. Ref Comisaría 21 de Abril',
      },
      {
        'name': 'DENGUE',
        'nameCampaign': 'Vacunación contra el DENGUE',
        'descriptionCampaign':
            'Para personas mayores de 18 años que residan en este distrito',
        'ageCampaign': '18 años en adelante',
        'time': '08:20 - 20:00',
        'date': '28',
        'placeCampaign': 'Colegio "San Lucas" Nº 3210, Chimbote',
      },
      {
        'name': 'HEPATITIS B',
        'nameCampaign': 'Vacunación contra la HEPATITIS B',
        'descriptionCampaign':
            'Para personas mayores de 18 años que residan en este distrito',
        'ageCampaign': '18 años en adelante',
        'time': '09:00 - 19:00',
        'date': '29',
        'placeCampaign': 'Colegio Fe Alegria Nº 230, Nuevo Chimbote.',
      },
      {
        'name': 'TETANO',
        'nameCampaign': 'Vacunación contra el TETANO',
        'descriptionCampaign':
            'Para personas mayores de 18 años que residan en este distrito',
        'ageCampaign': '18 años en adelante',
        'time': '08:20 - 20:00',
        'date': '29',
        'placeCampaign':
            'Colegio Santa Maria Reyna, Chimbote. Ref Comisaría 21 de Abril',
      },
      {
        'name': 'POLIO',
        'nameCampaign': 'Vacunación contra la POLIO',
        'descriptionCampaign':
            'Para personas mayores de 1 año a 6 años que residan en este distrito',
        'ageCampaign': '1 año - 6 años',
        'time': '08:20 - 20:00',
        'date': '30',
        'placeCampaign': 'Colegio "San Lucas" Nº 3210, Chimbote',
      }
    ];

    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 240, 244, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _CustomHeader(),
              const _SearchInput(),
              _TitleCards(
                title: 'Asistirás a estas campañas',
                iconTexT: listProcess.length.toString(),
              ),
              SizedBox(
                width: double.infinity,
                height: 135,
                child: listProcess.length == 0
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).shadowColor,
                              offset: const Offset(0.0, 2.0),
                              blurRadius:
                                  Preferences.theme == false ? 20.0 : 0.0,
                            )
                          ],
                        ),
                        child: Text(
                          'Usted no tiene campañas registradas',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : Swiper(
                        itemCount: listProcess.length, //myCampign
                        viewportFraction: 0.9,
                        scale: 0.95,
                        itemBuilder: (BuildContext context, int index) {
                          final myData = listProcess[index]; //myCampign
                          print(listProcess); //myCampign
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => DetailMyCampaignPage(
                                    numberTicket: myData.ticket,
                                    category: myData.category,
                                    lat: myData.lat,
                                    long: myData.lon,
                                    timer: myData.hour,
                                    place: myData.place,
                                    date: myData.date,
                                    state: myData.state,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              decoration: BoxDecoration(
                                //color: Colors.white,
                                color: Theme.of(context).backgroundColor,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    //color: Color.fromARGB(255, 248, 248, 248),
                                    color: Theme.of(context).shadowColor,
                                    offset: Offset(0.0, 2.0),
                                    blurRadius:
                                        Preferences.theme == false ? 20.0 : 0.0,
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10.0),
                                  Row(
                                    children: [
                                      const Icon(Icons.vaccines),
                                      Text(
                                        myData.name,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    myData.place,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Container(
                                    width: 100,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 10.0),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.amber,
                                    ),
                                    child: Text(
                                      myData.state,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ), //
                            ),
                          );
                        },
                      ),
              ),
              _TitleCards(
                title: 'Campañas disponibles',
                iconTexT: dataCampaign.length.toString(),
              ),
              SizedBox(
                width: double.infinity,
                height: 275,
                child: Swiper(
                  itemCount: dataCampaign.length,
                  viewportFraction: 0.9,
                  scale: 0.95,
                  itemBuilder: (BuildContext context, int index) {
                    final data = dataCampaign[index];

                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        //color: Colors.white,
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            //color: Color.fromARGB(255, 248, 248, 248),
                            color: Theme.of(context).shadowColor,
                            offset: Offset(0.0, 2.0),
                            blurRadius: Preferences.theme == false ? 20.0 : 3.0,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  //color:
                                  // const Color.fromARGB(255, 240, 244, 255),
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context).shadowColor,
                                      offset: Offset(0.0, 2.0),
                                      blurRadius: Preferences.theme == false
                                          ? 20.0
                                          : 2.0,
                                    )
                                  ],
                                ),
                                child: const Icon(
                                  Icons.vaccines,
                                  color: Color.fromARGB(255, 255, 104, 63),
                                ),
                              ),
                              const SizedBox(width: 12.0),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['nameCampaign'],
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Text(
                                        data['descriptionCampaign'],
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 5.0),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Edad: ",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                data['ageCampaign'],
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Termina en: ',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                data['hourCampaign'],
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          RichText(
                            text: TextSpan(
                              // Here is the explicit parent TextStyle
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Lugar: ',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Preferences.theme == false
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: data['placeCampaign'],
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Preferences.theme == false
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          MaterialButton(
                            minWidth: double.infinity,
                            height: 40,
                            elevation: 0,
                            color: const Color.fromARGB(255, 240, 244, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  // <-- for border radius
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                builder: (context) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Center(
                                        child: Container(
                                          width: 45,
                                          height: 5,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 15.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15.0),
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          data['nameCampaign'].toUpperCase(),
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                            color: Preferences.theme == false
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15.0),
                                      //map
                                      Container(
                                        height: 400,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: MapWidget(
                                          lat: data['latCampaign'],
                                          lon: data['lonCampaign'],
                                        ),
                                      ),
                                      //end map
                                      const SizedBox(height: 12.0),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0, horizontal: 10.0),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: const Color.fromARGB(
                                              255, 35, 131, 41),
                                        ),
                                        child: Text(
                                          'En transcurso',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),

                                      Row(
                                        children: [
                                          Text(
                                            "Edad: ",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            data['ageCampaign'],
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          // Here is the explicit parent TextStyle
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'Lugar: ',
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                                color:
                                                    Preferences.theme == false
                                                        ? Colors.black
                                                        : Colors.white,
                                              ),
                                            ),
                                            TextSpan(
                                              text: data['placeCampaign'],
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color:
                                                    Preferences.theme == false
                                                        ? Colors.black
                                                        : Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          // Here is the explicit parent TextStyle
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'Finaliza en: ',
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                                color:
                                                    Preferences.theme == false
                                                        ? Colors.black
                                                        : Colors.white,
                                              ),
                                            ),
                                            TextSpan(
                                              text: data['hourCampaign'],
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color:
                                                    Preferences.theme == false
                                                        ? Colors.black
                                                        : Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(height: 20.0),
                                      //Button
                                      // MaterialButton(
                                      //   onPressed: () {
                                      //     //setState(() {});
                                      //   },
                                      //   color: const Color(0xFF336bfe),
                                      //   minWidth: double.infinity,
                                      //   height: 62,
                                      //   shape: const RoundedRectangleBorder(
                                      //     borderRadius: BorderRadius.all(
                                      //       Radius.circular(10.0),
                                      //     ),
                                      //   ),
                                      //   child: Text(
                                      //     (Preferences.img.isEmpty)
                                      //         ? 'Register'
                                      //         : 'Update',
                                      //     style: GoogleFonts.poppins(
                                      //       fontSize: 17,
                                      //       color: Colors.white,
                                      //       fontWeight: FontWeight.w600,
                                      //     ),
                                      //   ),
                                      // ),
                                      // const SizedBox(height: 20.0),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'DETALLES',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          MaterialButton(
                            minWidth: double.infinity,
                            height: 40,
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            onPressed: () {
                              Random rnd = Random();
                              int min = 999, max = 2000;
                              int num = min + rnd.nextInt(max - min);

                              myCampign.add(
                                Campaigns(
                                  name: data['nameCampaign'],
                                  description: data['descriptionCampaign'],
                                  hour: data['hourCampaign'],
                                  place: data['placeCampaign'],
                                  date: data['dateCampaign'],
                                  age: data['ageCampaign'],
                                  lat: data['latCampaign'],
                                  lon: data['lonCampaign'],
                                  category: data['categoryCampaign'],
                                  state: data['stateCampaign'],
                                  ticket: '#$num',
                                ),
                              );
                              setState(() {});
                            },
                            child: Text(
                              'REGISTRAR',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10.0),
              const _TitleCards(
                title: 'Proximas campañas',
                iconTexT: 'Más',
              ),
              Container(
                height: 100,
                margin: const EdgeInsets.only(bottom: 20.0),
                child: ListView.builder(
                  itemCount: dataNextCampaigns.length,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(left: 20.0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final dataN = dataNextCampaigns[index];

                    return Container(
                      width: 110,
                      margin: const EdgeInsets.only(right: 10.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 7.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            //color: Color.fromARGB(255, 248, 248, 248),
                            color: Theme.of(context).shadowColor,
                            offset: const Offset(0.0, 2.0),
                            blurRadius: Preferences.theme == false ? 20.0 : 2.0,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            dataN['name'],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            dataN['date'],
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 35,
                              color: const Color.fromARGB(255, 255, 104, 63),
                            ),
                          ),
                          Text(
                            'Diciembre',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: const Color.fromARGB(255, 255, 104, 63),
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleCards extends StatelessWidget {
  final String title;
  final String iconTexT;

  const _TitleCards({
    required this.title,
    required this.iconTexT,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 20.0,
        top: 30.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          Container(
            width: 50,
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color.fromARGB(255, 255, 104, 63),
            ),
            child: Text(
              iconTexT,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 11,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {
  const _SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      margin: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
      decoration: BoxDecoration(
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
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Buscar campaña cercana',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, fontSize: 15, color: Colors.grey),
          ),
          const Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class _CustomHeader extends StatelessWidget {
  const _CustomHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bienvenid@ 👋,',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 15),
              ),
              Text(
                '${Preferences.name} ${Preferences.lastname}',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 22.0,
                  height: 1,
                ),
              ),
            ],
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              //color: Colors.white,
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(18.0),
              boxShadow: [
                BoxShadow(
                  //color: Color.fromARGB(255, 248, 248, 248),
                  color: Theme.of(context).shadowColor,
                  offset: const Offset(0.0, 2.0),
                  blurRadius: Preferences.theme == false ? 20.0 : 0.0,
                )
              ],
            ),
            child: const Icon(
              Icons.notifications,
              color: Color.fromARGB(255, 255, 104, 63),
            ),
          )
        ],
      ),
    );
  }
}
