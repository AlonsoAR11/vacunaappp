import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:lottie/lottie.dart' as lot;
import 'package:vacunapp/src/preferences/preferences.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    final markers = <Marker>[
      Marker(
        width: 80,
        height: 80,
        point: LatLng(-9.06686, -78.58204),
        builder: (ctx) => GestureDetector(
          onTap: () {
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Container(
                        width: 45,
                        height: 5,
                        margin: const EdgeInsets.symmetric(vertical: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Campaña contra la COVID - 19',
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.amber,
                      ),
                      child: Text(
                        'En curso',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
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
                          '18 a más',
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
                            text: 'Colegio Julio Cesar Tello NROº 2, Chimbote',
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
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            );
          },
          child: Container(
            color: Colors.transparent,
            child: lot.Lottie.asset('assets/imgs/lottie4.json'),
          ),
        ),
      ),
      Marker(
        width: 80,
        height: 80,
        point: LatLng(-9.078570315353575, -78.58079966585021),
        builder: (ctx) => lot.Lottie.asset('assets/imgs/marker_cyan.json'),
      ),
      Marker(
        width: 80,
        height: 80,
        point: LatLng(-9.068526650778262, -78.58294543298189),
        builder: (ctx) => lot.Lottie.asset('assets/imgs/lottie4.json'),
      ),
      Marker(
        width: 80,
        height: 80,
        point: LatLng(-9.061142982798453, -78.58369821094715),
        builder: (ctx) => lot.Lottie.asset('assets/imgs/marker_cyan.json'),
      ),
      Marker(
        width: 80,
        height: 80,
        point: LatLng(-9.063398764280684, -78.57762393049532),
        builder: (ctx) => lot.Lottie.asset('assets/imgs/lottie4.json'),
      ),
      Marker(
        width: 80,
        height: 80,
        point: LatLng(-9.070603212078002, -78.56972750745072),
        builder: (ctx) => lot.Lottie.asset('assets/imgs/lottie4.json'),
      ),
      Marker(
        width: 80,
        height: 80,
        point: LatLng(-9.074542560513226, -78.57154748815115),
        builder: (ctx) => lot.Lottie.asset('assets/imgs/marker_purple.json'),
      ),
      Marker(
        width: 80,
        height: 80,
        point: LatLng(-9.066167551700724, -78.5734529245468),
        builder: (ctx) => lot.Lottie.asset('assets/imgs/lottie4.json'),
      ),
      Marker(
        width: 80,
        height: 80,
        point: LatLng(-9.072882332007968, -78.58880850020584),
        builder: (ctx) => lot.Lottie.asset('assets/imgs/marker_purple.json'),
      ),
      Marker(
        width: 80,
        height: 80,
        point: LatLng(-9.066056867456595, -78.58619319534907),
        builder: (ctx) => lot.Lottie.asset('assets/imgs/lottie4.json'),
      ),
      Marker(
        width: 80,
        height: 80,
        point: LatLng(-9.072194937693288, -78.5881723732039),
        builder: (ctx) => lot.Lottie.asset('assets/imgs/marker_yellow.json'),
      ),
      Marker(
        width: 80,
        height: 80,
        point: LatLng(-9.072845437953932, -78.58996670664241),
        builder: (ctx) => lot.Lottie.asset('assets/imgs/marker_yellow.json'),
      ),
      Marker(
        width: 80,
        height: 80,
        point: LatLng(-9.063178562625307, -78.5783976500351),
        builder: (ctx) => lot.Lottie.asset('assets/imgs/marker_green.json'),
      ),
      Marker(
        width: 80,
        height: 80,
        point: LatLng(-9.068641065063401, -78.57646492071017),
        builder: (ctx) => lot.Lottie.asset('assets/imgs/marker_yellow.json'),
      ),
      Marker(
        width: 80,
        height: 80,
        point: LatLng(-9.075331968834366, -78.57717580965728),
        builder: (ctx) => lot.Lottie.asset('assets/imgs/lottie4.json'),
      ),
      Marker(
        width: 80,
        height: 80,
        point: LatLng(-9.064977468187147, -78.5827740601157),
        builder: (ctx) => lot.Lottie.asset('assets/imgs/lottie4.json'),
      ),
      Marker(
        width: 80,
        height: 80,
        point: LatLng(-9.063661196709223, -78.57908632370261),
        builder: (ctx) => lot.Lottie.asset('assets/imgs/marker_green.json'),
      ),
    ];
    //const Icon(Icons.map)
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // const Padding(
              //   padding: EdgeInsets.only(top: 8, bottom: 8),
              //   child: Text('This is a map that is showing (51.5, -0.9).'),
              // ),
              Expanded(
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(-9.06686, -78.58204),
                    zoom: 15,
                  ),
                  nonRotatedChildren: [
                    AttributionWidget.defaultWidget(
                      source: 'OpenStreetMap contributors',
                      onSourceTapped: () {},
                    ),
                  ],
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                    ),
                    MarkerLayer(markers: markers),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 60,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color.fromARGB(255, 255, 104, 63),
            ),
            child: Text(
              'Campañas disponibles actualmente 📍',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            right: 1,
            bottom: 10,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              margin: const EdgeInsets.only(right: 10, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(192, 2, 2, 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'COVID-19',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      const Icon(
                        Icons.circle,
                        color: Colors.orange,
                        size: 15,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TETANO',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      const Icon(
                        Icons.circle,
                        color: Colors.green,
                        size: 15,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'NEUMOCOCO',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      const Icon(
                        Icons.circle,
                        color: Colors.cyan,
                        size: 15,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'HEPATITIS B',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      const Icon(
                        Icons.circle,
                        color: Colors.amber,
                        size: 15,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'INFLUENZA',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      const Icon(
                        Icons.circle,
                        color: Colors.purple,
                        size: 15,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
