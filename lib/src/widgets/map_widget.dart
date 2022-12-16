import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:lottie/lottie.dart' as lot;

class MapWidget extends StatelessWidget {
  final double lat;
  final double lon;

  const MapWidget({
    super.key,
    required this.lat,
    required this.lon,
  });

  @override
  Widget build(BuildContext context) {
    final markers = <Marker>[
      Marker(
        width: 80,
        height: 80,
        point: LatLng(lat, lon),
        builder: (ctx) => lot.Lottie.asset('assets/imgs/lottie4.json'),
      ),
    ];
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        height: 300,
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(lat, lon),
            zoom: 18,
          ),
          nonRotatedChildren: [
            AttributionWidget.defaultWidget(
              source: 'OpenStreetMap contributors',
              onSourceTapped: () {},
            ),
          ],
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
            MarkerLayer(markers: markers),
          ],
        ),
      ),
    );
  }
}
