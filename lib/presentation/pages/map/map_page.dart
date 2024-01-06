import 'package:education_app/presentation/widgets/custom_appbar.dart';
import 'package:education_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    super.initState();

    Provider.of<AppProvider>(context, listen: false)
        .getUserCurrentPosition()
        .then((value) {
      _userPosition = value;
    });
  }

  late GoogleMapController googleMapController;

  Position? _userPosition;

  late Set<Marker> markers = {
    Marker(
        markerId: const MarkerId('currentLocation'),
        position: LatLng(
          _userPosition?.latitude ?? -6.221246349462629,
          _userPosition?.longitude ?? 106.84365891042707,
        ))
  };

  _share() {
    Share.share(
      'https://www.google.com/maps/search/?api=1&query=${_userPosition?.latitude},${_userPosition?.longitude}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppbar(title: 'User Map'),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Consumer<AppProvider>(
          builder: (context, position, _) => GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                position.userPosition?.latitude ?? -6.221246349462629,
                position.userPosition?.longitude ?? 106.84365891042707,
              ),
              zoom: 14,
            ),
            markers: markers,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              googleMapController = controller;
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _share();
        },
        label: const Text('Bagikan Lokasi '),
        icon: const Icon(
          Icons.location_history,
        ),
      ),
    );
  }
}
