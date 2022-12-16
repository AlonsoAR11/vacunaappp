import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:vacunapp/src/models/campaigns_model.dart';
import 'package:vacunapp/src/pages/pages.dart';
import 'package:vacunapp/src/preferences/preferences.dart';

List<Campaigns> listProcess = [];
List<Campaigns> listCancelledAndAttended = [];

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    listProcess = myCampign.where((o) => o.state == 'En curso').toList();

    listCancelledAndAttended = myCampign
        .where((o) => o.state == 'Terminado' || o.state == 'Cancelado')
        .toList();

    print('lista cancelado y asistió: ${listCancelledAndAttended.length}');
    print('lista en curso: ${listProcess.length}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> campaignsHistory = [
      {
        'nameCampaign': 'Vacunación contra la COVID-19',
        'descriptionCampaign':
            'Para personas mayores de 18 años que residan en este distrito',
        'ageCampaign': '18 años en adelante',
        'hourCampaign': '05hrs 10m 59s',
        'placeCampaign': 'Estadio Centenario Chimbote. Ref. Mega Plaza',
        'lat': -9.067078424107738,
        'lon': -78.58378291190455,
        'state': 'Cancelado',
        'category': 'COVID 19',
        'date': '20/11/22',
        'ticket': '#72332'
      },
      {
        'nameCampaign': 'Vacunación contra la INFLUENZA',
        'descriptionCampaign':
            'Para personas mayores de 15 años que residan en este distrito',
        'ageCampaign': '15 años en adelante',
        'hourCampaign': '032hrs 33m 29s',
        'placeCampaign': 'Colegio Jorge Chavez N° 89003. Calle. Ramiro Priale',
        'lat': -9.066450084431784,
        'lon': -78.58158032573219,
        'state': 'Terminado',
        'category': 'INFLUENZA',
        'date': '12/11/22',
        'ticket': '#92342'
      },
      {
        'nameCampaign': 'Vacunación contra el DENGUE',
        'descriptionCampaign':
            'Para personas mayores de 3 años que residan en este distrito',
        'ageCampaign': '3 años en adelante',
        'hourCampaign': '03hrs 20m 59s',
        'placeCampaign': 'Colegio Rch N° 834027. Calle. Aviacion 2da. Etapa',
        'lat': -9.06510533976244,
        'lon': -78.58227043719906,
        'state': 'Terminado',
        'category': 'DENGUE',
        'date': '21/11/22',
        'ticket': '#65894'
      },
      {
        'nameCampaign': 'Vacunación contra la COVID-19',
        'descriptionCampaign':
            'Para personas mayores de 18 años que residan en este distrito',
        'ageCampaign': '18 años en adelante',
        'hourCampaign': '05hrs 10m 59s',
        'placeCampaign': 'Estadio Centenario Chimbote. Ref. Mega Plaza',
        'lat': -9.067078424107738,
        'lon': -78.58378291190455,
        'state': 'Cancelado',
        'category': 'COVID 19',
        'date': '20/11/22',
        'ticket': '#72332'
      },
    ];

    final List<dynamic> campaignsProcess = [
      {
        'nameCampaign': 'Vacunación contra la COVID-19',
        'descriptionCampaign':
            'Para personas mayores de 18 años que residan en este distrito',
        'ageCampaign': '18 años en adelante',
        'hourCampaign': '03hrs 20m 59s',
        'placeCampaign': 'Colegio Gomez N° 89007. Urb. 21 de Abril Zona B',
        'lat': -9.06686,
        'lon': -78.58204,
        'state': 'En curso',
        'category': 'COVID 19',
        'date': '15/11/22',
        'ticket': '#98451'
      },
      {
        'nameCampaign': 'Vacunación contra HEPATITIS B',
        'descriptionCampaign':
            'Para personas mayores de 5 años que residan en este distrito',
        'ageCampaign': '5 años en adelante',
        'hourCampaign': '01hrs 20m 12s',
        'placeCampaign':
            'Colegio Maria reina N° 10028. Calle. Ormeño, Nuevo Chimbote',
        'lat': -9.067152744529677,
        'lon': -78.58257345887161,
        'state': 'En curso',
        'category': 'HEPATITIS B',
        'date': '15/11/22',
        'ticket': '#98451'
      },
      {
        'nameCampaign': 'Vacunación contra VIRUELA',
        'descriptionCampaign':
            'Para personas mayores de 7 años que residan en este distrito',
        'ageCampaign': '7 años en adelante',
        'hourCampaign': '09hrs 20m 59s',
        'placeCampaign':
            'Colegio Inmaculada Concepcion N° 89007. Jr. Santa Rosa',
        'lat': -9.072019893770472,
        'lon': -78.58260110905287,
        'state': 'En curso',
        'category': 'VIRUELA',
        'date': '18/11/22',
        'ticket': '#69874'
      }
    ];

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: kToolbarHeight,
            color: Preferences.theme
                ? const Color(0xff252836)
                : const Color.fromARGB(255, 255, 104, 63),
          ),
          Expanded(
            child: ContainedTabBarView(
              tabBarProperties: TabBarProperties(
                indicatorColor: Colors.white,
                //indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3,
                labelPadding: EdgeInsets.zero,
                background: Container(
                  color: Preferences.theme
                      ? const Color(0xff252836)
                      : const Color.fromARGB(255, 255, 104, 63),
                ),
              ),
              tabs: [
                Text(
                  'En espera',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Otros',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ],
              views: [
                listProcess.isEmpty
                    ? _EmptyListCampaigns()
                    : _CustomSliderCampaigns(
                        campaigns: listProcess,
                      ),
                // _CustomSliderCampaigns2(
                //   campaigns2: campaignsHistory,
                // ),

                listCancelledAndAttended.isEmpty
                    ? _EmptyListHistoryCampaigns()
                    : _CustomSliderCampaigns(
                        campaigns: listCancelledAndAttended,
                      ),
              ],
              // ignore: avoid_print
              onChange: (index) => print(index),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomSliderCampaigns2 extends StatelessWidget {
  final List campaigns2;

  const _CustomSliderCampaigns2({required this.campaigns2});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      scrollDirection: Axis.vertical,
      itemCount: campaigns2.length,
      itemBuilder: (context, index) {
        final data = campaigns2[index];
        return _TitleCards(
          numberTicket: data['ticket'],
          stateTicket: data['state'],
          categoryCampaign: data['category'],
          dateCampaign: data['date'],
        );
      },
    );
  }
}

class _CustomSliderCampaigns extends StatelessWidget {
  final List<Campaigns> campaigns;

  const _CustomSliderCampaigns({required this.campaigns});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      scrollDirection: Axis.vertical,
      itemCount: campaigns.length,
      itemBuilder: (context, index) {
        final data = campaigns[index];
        return _TitleCards(
          numberTicket: data.ticket,
          stateTicket: data.state,
          categoryCampaign: data.category,
          dateCampaign: data.date,
        );
      },
    );
  }
}

class _TitleCards extends StatelessWidget {
  final String numberTicket;
  final String stateTicket;
  final String categoryCampaign;
  final String dateCampaign;

  /*
  lat: myData.lat,
  long: myData.lon,
  timer: myData.hour,
  place: myData.place,
  */

  const _TitleCards({
    required this.numberTicket,
    required this.stateTicket,
    required this.categoryCampaign,
    required this.dateCampaign,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            offset: const Offset(0.0, 2.0),
            blurRadius: Preferences.theme == false ? 20.0 : 2.0,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 82,
            height: 82,
            decoration: BoxDecoration(
              //color:
              // const Color.fromARGB(255, 240, 244, 255),
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor,
                  offset: const Offset(0.0, 2.0),
                  blurRadius: Preferences.theme == false ? 20.0 : 2.0,
                )
              ],
            ),
            child: const Icon(
              Icons.vaccines,
              color: Color.fromARGB(255, 255, 104, 63),
              size: 30,
            ),
          ),

          const SizedBox(width: 12.0),

          //info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              SizedBox(
                width: 230,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      //numberTicket,
                      numberTicket,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: stateTicket == 'Terminado'
                            ? Colors.blue
                            : stateTicket == 'En curso'
                                ? Colors.amber
                                : Colors.red,
                      ),
                      child: Text(
                        stateTicket,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 5.0),
              //
              Text(
                'Campaña contra: $categoryCampaign',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.grey,
                ),
                maxLines: 2,
              ),
              RichText(
                text: TextSpan(
                  // Here is the explicit parent TextStyle
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Fecha: ',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Preferences.theme == false
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: dateCampaign,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Preferences.theme == false
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
            ],
          ),
        ],
      ),
    );
  }
}

class _EmptyListCampaigns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/imgs/empty.json', width: 200),
            Text(
              'No tiene campañas en espera',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyListHistoryCampaigns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/imgs/empty.json', width: 200),
            Text(
              'No tiene campañas registradas\ncon anterioridad',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                height: 0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
