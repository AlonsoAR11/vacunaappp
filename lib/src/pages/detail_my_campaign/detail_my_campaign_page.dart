// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vacunapp/src/pages/navigation/history_page.dart';
import 'package:vacunapp/src/pages/navigation/home_page.dart';
import 'package:vacunapp/src/pages/navigation/navigation_page.dart';
import 'package:vacunapp/src/preferences/preferences.dart';
import 'package:vacunapp/src/widgets/map_widget.dart';

var hour, minute, second;
var h, m, s;

class DetailMyCampaignPage extends StatefulWidget {
  final String numberTicket;
  final String category;
  final String timer;
  final double lat;
  final double long;
  final String place;
  final String date;
  final String state;

  DetailMyCampaignPage({
    super.key,
    required this.numberTicket,
    required this.category,
    required this.timer,
    required this.lat,
    required this.long,
    required this.place,
    required this.date,
    required this.state,
  });

  @override
  State<DetailMyCampaignPage> createState() => _DetailMyCampaignPageState();
}

class _DetailMyCampaignPageState extends State<DetailMyCampaignPage> {
  final List<dynamic> photos = [
    {
      'imag':
          'https://dirislimacentro.gob.pe/wp-content/uploads/WhatsApp-Image-2022-07-07-at-9.37.12-AM.jpeg',
    },
    {
      'imag':
          'https://estoyenlafrontera.com/sites/default/files/styles/s_apertura/public/2021-07/vacuna%20migrantes%202.jpeg?itok=lz6npK7s',
    },
    {
      'imag':
          'https://cloudfront-us-east-1.images.arcpublishing.com/gruporepublica/6AWNFIKXIFDRLIQPYN5JZIVMUM.jpg',
    },
    {
      'imag':
          'https://cloudfront-us-east-1.images.arcpublishing.com/gruporepublica/J2CSDCAPQFFOVFQ4OOKZMUJKPM.jpeg',
    },
    {
      'imag':
          'https://elperuano.pe/fotografia/thumbnail/2021/02/09/000107942M.jpg',
    },
    {
      'imag':
          'https://gestion.pe/resizer/4eBlaLzz9MGoKpKh79nD13-BWaQ=/980x528/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/CC7OXDZRMFFYNLUGTLX6ONGV74.jpg',
    },
  ];

  final CustomTimerController _controller = CustomTimerController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    var time = widget.timer;

    hour = time.substring(0, 2);
    minute = time.substring(6, 8);
    second = time.substring(10, 12);

    h = int.parse(hour);
    m = int.parse(minute);
    s = int.parse(second);

    print(hour);
    print(minute);
    print(second);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.start();
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
          'Ticket',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            //width: 100,
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.amber,
            ),
            child: Text(
              widget.state,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 11,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0,
          ),
          child: Column(
            children: [
              //Ticket qr
              Container(
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Theme.of(context).backgroundColor,
                ),
                child: Column(
                  children: [
                    //Texts
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        color: Theme.of(context).backgroundColor,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 15.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Campaña:',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    'Contra: ${widget.category}',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: const Color.fromARGB(
                                          255, 255, 104, 63),
                                      height: 1,
                                    ),
                                  ),
                                  //
                                  const SizedBox(height: 10.0),
                                  //
                                  Text(
                                    'Termina en:',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  CustomTimer(
                                      controller: _controller,
                                      begin: Duration(
                                        hours: h,
                                        minutes: m,
                                        seconds: s,
                                      ),
                                      end: Duration(),
                                      builder: (time) {
                                        return Text(
                                          "${time.hours}:${time.minutes}:${time.seconds}",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            height: 1,
                                          ),
                                        );
                                      }),
                                  // Text(
                                  //   widget.timer,
                                  //   style: GoogleFonts.poppins(
                                  //     fontWeight: FontWeight.w700,
                                  //     fontSize: 16,
                                  //     height: 1,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 15.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nro:',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    widget.numberTicket,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      height: 1,
                                    ),
                                  ),
                                  //
                                  const SizedBox(height: 10.0),
                                  //
                                  Text(
                                    'Fecha:',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    widget.date,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Circles
                    Container(
                      color: Theme.of(context).backgroundColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 10,
                            height: 15,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                              ),
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                          Container(
                            width: 10,
                            height: 15,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                              ),
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //QR
                    Container(
                      height: 250,
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                        color: Theme.of(context).backgroundColor,
                      ),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: QrImage(
                          data: widget.numberTicket,
                          version: QrVersions.auto,
                          size: 200.0,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //More options
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
                      offset: const Offset(0.0, 2.0),
                      blurRadius: Preferences.theme == false ? 20.0 : 3.0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    ExpansionTile(
                      title: Text(
                        '¿Desea cancelar su ticket?',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      leading: const Icon(
                        FontAwesomeIcons.ticket,
                        color: Colors.grey,
                      ),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      childrenPadding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                      children: [
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text("Cancelar ticket"),
                                content: const Text(
                                  "¿Desea cancelar su ticket?",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Container(
                                      child: const Text(
                                        "No",
                                        style: TextStyle(
                                            color: Colors.cyan, fontSize: 17),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // myCampign.removeWhere((element) {
                                      //   return element.ticket ==
                                      //       widget.numberTicket;
                                      // });

                                      myCampign
                                          .where((x) =>
                                              x.ticket == widget.numberTicket)
                                          .first
                                          .state = "Cancelado";

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const NavigationPage(),
                                          ));
                                      setState(() {});
                                    },
                                    child: Container(
                                      child: const Text(
                                        "Sí",
                                        style: TextStyle(
                                            color: Colors.cyan, fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          color: const Color.fromARGB(255, 255, 104, 63),
                          child: Text(
                            'Cancelar',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        '¿Cómo llegar?',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      // collapsedTextColor:
                      //     const Color.fromARGB(255, 255, 104, 63),
                      //iconColor: const Color.fromARGB(255, 255, 104, 63),
                      leading: const Icon(
                        Icons.route,
                        color: Colors.grey,
                      ),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      childrenPadding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                      children: [
                        Container(
                          height: 350,
                          margin: const EdgeInsets.only(bottom: 10.0),
                          child: Column(
                            children: [
                              MapWidget(
                                lat: widget.lat,
                                lon: widget.long,
                              ),
                              Text(
                                'Lugar: ${widget.place}',
                                style: GoogleFonts.poppins(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        'Fotos de campaña',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      // collapsedTextColor:
                      //     const Color.fromARGB(255, 255, 104, 63),
                      //iconColor: const Color.fromARGB(255, 255, 104, 63),
                      leading: const Icon(
                        Icons.photo,
                        color: Colors.grey,
                      ),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      childrenPadding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                      children: [
                        Container(
                          height: 200,
                          //width: 100,
                          child: ListView.builder(
                            itemCount: photos.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final photo = photos[index];
                              return Container(
                                width: 300,
                                height: 200,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                  vertical: 10.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  // image: DecorationImage(
                                  //   image: NetworkImage(photo['imag']),
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: FadeInImage(
                                    placeholder:
                                        AssetImage('assets/imgs/loading.gif'),
                                    image: NetworkImage(
                                      photo['imag'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    const _CustomListTitle(
                      title: 'Compartir',
                      leading: Icon(
                        Icons.share,
                        color: Colors.grey,
                      ),
                    ),
                    ExpansionTile(
                      title: Text(
                        'Preguntas frecuentes',
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      // collapsedTextColor:
                      //     const Color.fromARGB(255, 255, 104, 63),
                      //iconColor: const Color.fromARGB(255, 255, 104, 63),
                      leading: const Icon(
                        Icons.question_mark_sharp,
                        color: Colors.grey,
                      ),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      childrenPadding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                      children: [
                        Text(
                          '1. ¿A quién presento el codigo QR?',
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Enim sint eiusmod adipisicing nostrud Lorem dolore exercitation excepteur do pariatur commodo ipsum cupidatat.',
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          '2. ¿Dónde puedo ver al profesional que me atenderá?',
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Enim sint eiusmod adipisicing nostrud Lorem dolore exercitation excepteur do pariatur commodo ipsum cupidatat.',
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          '3. ¿Por qué es importante tener un registro sanitario de vacunas?',
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Un registro sanitario personal de las vacunaciones le ayuda a usted y a su médico a administrar las vacunas a tiempo. El registro debe empezar a los 2 meses, cuando recibe las primeras vacunaciones, y debe ser actualizado cada vez que al niño se le apliquen nuevas dosis. Esta información le será útil si usted se muda de domicilio o cambia de médico. Recuerde llevar la cartilla de registro cada vez que lleve al niño al médico esta ultima esta buena.',
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          '4. ¿Qué enfermedades evitan las vacunas?',
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Las vacunas más comúnmente empleadas en nuestro país son las siguientes: hepatitis B, difteria, tétanos, tosferina, polio, Haemophilus influenzae tipo b, meningococos C y ACWY, neumococo, sarampión, rubeola, parotiditis o paperas, varicela, virus del papiloma humano, rotavirus, meningococo B, hepatitis A y gripe, entre otras.',
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  final String title;
  final Widget leading;
  final Widget? trailing;

  const _CustomListTitle({
    super.key,
    required this.title,
    required this.leading,
    this.trailing,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
      ),
      trailing: trailing,
      onTap: () {},
    );
  }
}
