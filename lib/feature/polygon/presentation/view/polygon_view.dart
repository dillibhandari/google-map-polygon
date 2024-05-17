import 'dart:async';
import 'dart:collection';
import 'package:create_polygon/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:create_polygon/feature/permission/presentation/bloc/permission_bloc/permission_bloc.dart';

class PolygonPage extends StatefulWidget {
  const PolygonPage({super.key});

  @override
  State<PolygonPage> createState() => _PolygonPageState();
}

class _PolygonPageState extends State<PolygonPage> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(27.7158, 85.3125),
    zoom: 12,
  );
  final Set<Polygon> _polygon = HashSet<Polygon>();

  // created list of locations to display polygon
  List<LatLng> points = const [
    LatLng(27.7104, 85.3488),
    LatLng(27.7215, 85.3620),
    LatLng(27.7049, 85.3076),
    LatLng(27.6730, 85.3240),
  ];

  @override
  void initState() {
    context
        .read<PermissionBloc>()
        .add(const CheckPermission(Permission.location));

    _addPolygon();
    super.initState();
  }

  _addPolygon() {
    _polygon.add(Polygon(
      polygonId: const PolygonId('1'),
      points: points,
      fillColor: AppColors.cyan.withOpacity(0.3),
      strokeColor: AppColors.cyan,
      geodesic: true,
      strokeWidth: 4,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparent,
          title: Text(
            "Polygon app",
            style: TextStyle(color: AppColors.black),
          ),
        ),
        body: GoogleMap(
          initialCameraPosition: _kGoogle,
          mapType: MapType.normal,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          compassEnabled: true,
          polygons: _polygon,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
