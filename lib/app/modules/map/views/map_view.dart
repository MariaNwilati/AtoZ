import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

/*import '../controllers/map_controller.dart';

class MapView extends GetView<MapController> {
  const MapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(40.762142,-73.971428),
        zoom: 9.2,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a','b','c']
        ),
        MarkerLayerOptions(
            markers: [
              Marker(
                point: LatLng(32.010532,35.867756),
                builder: (ctx)=> Container(
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red,
                  ),
                ),

              ),
            ]
        )
      ],


    );
  }
}

*/