import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapGoogle extends StatefulWidget {
  const MapGoogle(
      {Key? key,
      this.markers = const <Marker>{},
      this.circles = const <Circle>{},
      this.latLng,
      this.polyLines = const <Polyline>{},
      this.myLocationEnabled = true})
      : super(key: key);
  final Set<Marker> markers;
  final Set<Circle> circles;
  final LatLng? latLng;
  final Set<Polyline> polyLines;
  final bool myLocationEnabled;
  @override
  State<MapGoogle> createState() => _MapState();
}

class _MapState extends State<MapGoogle> with WidgetsBindingObserver {
  late String mapStyle;
  late GoogleMapController mapController;
  Completer<GoogleMapController> completer = Completer();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    DefaultAssetBundle.of(context)
        .loadString('assets/style_map/style.json')
        .then((string) {
      mapStyle = string;
    });
    super.initState();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.resumed:
        final GoogleMapController controller = await completer.future;
        if (!completer.isCompleted) {
          completer.complete(controller);
        }
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      compassEnabled: false,
      markers: widget.markers,
      myLocationEnabled: widget.myLocationEnabled,
      mapToolbarEnabled: false,
      polylines: widget.polyLines,
      circles: widget.circles,
      onMapCreated: (controller) {
        mapController = controller;
        mapController.setMapStyle(mapStyle);
      },
      initialCameraPosition: CameraPosition(
          target: widget.latLng != null
              ? widget.latLng!
              : const LatLng(37.785834, -122.406417),
          zoom: 15),
    );
  }
}
