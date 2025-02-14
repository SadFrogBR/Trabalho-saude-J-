import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'grupoFamiliar.dart';
import 'perfil.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Position? _currentPosition;
  late MapController _mapController;
  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentPosition = position;
      _addHospitalsMarkers();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _mapController.move(
          LatLng(position.latitude, position.longitude),
          14.0,
        );
      }
    });
  }

  void _addHospitalsMarkers() {
    setState(() {
      _markers = [
        // UPA Corumbá
        Marker(
          point: LatLng(-19.0112, -57.6512),
          width: 80,
          height: 80,
          child: const Icon(Icons.local_hospital, color: Colors.red, size: 40),
        ),
        // Hospital CASSEMS
        Marker(
          point: LatLng(-19.0081, -57.6576),
          width: 80,
          height: 80,
          child: const Icon(Icons.local_hospital, color: Colors.red, size: 40),
        ),
        // Hospital Municipal Dr. Règis Bittencourt
        Marker(
          point: LatLng(-19.0037, -57.6518),
          width: 80,
          height: 80,
          child: const Icon(Icons.local_hospital, color: Colors.red, size: 40),
        ),
        // Unidade Básica de Saúde Luís Fragelli
        Marker(
          point: LatLng(-19.0065, -57.6493),
          width: 80,
          height: 80,
          child: const Icon(Icons.local_hospital, color: Colors.red, size: 40),
        ),
        // Pronto Socorro Municipal
        Marker(
          point: LatLng(-19.0142, -57.6580),
          width: 80,
          height: 80,
          child: const Icon(Icons.local_hospital, color: Colors.red, size: 40),
        ),
      ];
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PerfilScreen()),
      );
    }
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FamilyGroupPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saúde Já"),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          zoom: 14.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: _markers,
            rotate: true,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Grupo Familiar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support),
            label: "Suporte",
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
