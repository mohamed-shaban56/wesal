import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/utliz/app_color.dart';
import 'package:wesal/core/utliz/app_text_style.dart';
import 'package:wesal/l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderTrackingView extends StatefulWidget {
  const OrderTrackingView({super.key});

  @override
  State<OrderTrackingView> createState() => _OrderTrackingViewState();
}

class _OrderTrackingViewState extends State<OrderTrackingView> {
  // Dummy coordinates for Demo (Cairo)
  final LatLng _restaurantLocation = const LatLng(30.0444, 31.2357);
  final LatLng _userLocation = const LatLng(30.0544, 31.2457);
  final LatLng _driverLocation = const LatLng(30.0494, 31.2407);

  List<LatLng> _routePoints = [];

  @override
  void initState() {
    super.initState();
    // Fetch route from Restaurant to User (or Driver to User)
    // Here drawing from Restaurant to User as an example of the full path
    getRouteOnRoad(_restaurantLocation, _userLocation);
  }

  Future<void> getRouteOnRoad(LatLng start, LatLng end) async {
    final url = Uri.parse(
      'https://router.project-osrm.org/route/v1/driving/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?overview=full&geometries=geojson',
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> coordinates =
            data['routes'][0]['geometry']['coordinates'];

        setState(() {
          _routePoints = coordinates
              .map((coord) => LatLng(coord[1].toDouble(), coord[0].toDouble()))
              .toList();
        });
      }
    } catch (e) {
      debugPrint("Error fetching route: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.trackOrder,
          style: AppTextStyle.cairo18Bold(context),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // MAP SECTION
          Expanded(
            flex: 2,
            child: FlutterMap(
              options: MapOptions(
                initialCenter: _driverLocation,
                initialZoom: 14.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.wesal',
                ),
                MarkerLayer(
                  markers: [
                    // Restaurant Marker
                    Marker(
                      point: _restaurantLocation,
                      width: 40,
                      height: 40,
                      child: const Icon(
                        Icons.restaurant,
                        color: Colors.orange,
                        size: 30,
                      ),
                    ),
                    // User Marker
                    Marker(
                      point: _userLocation,
                      width: 40,
                      height: 40,
                      child: const Icon(
                        Icons.home,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                    // Driver Marker (Moving)
                    Marker(
                      point: _driverLocation,
                      width: 40,
                      height: 40,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.delivery_dining,
                          color: AppColor.primaryColor,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: _routePoints.isNotEmpty
                          ? _routePoints
                          : [
                              _restaurantLocation,
                              _userLocation,
                            ], // Fallback to straight line
                      strokeWidth: 4.0,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // STATUS SHEET SECTION
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.estimatedTime,
                        style: AppTextStyle.cairo14(context),
                      ),
                      Text(
                        '15-20 ${AppLocalizations.of(context)!.mins}',
                        style: AppTextStyle.cairo18Bold(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  // Simple Status Timeline
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatusItem(
                        context,
                        AppLocalizations.of(context)!.orderReceived,
                        true,
                      ),
                      _buildLine(true),
                      _buildStatusItem(
                        context,
                        AppLocalizations.of(context)!.preparing,
                        true,
                      ),
                      _buildLine(true),
                      _buildStatusItem(
                        context,
                        AppLocalizations.of(context)!.outForDelivery,
                        true,
                      ), // Active
                      _buildLine(false),
                      _buildStatusItem(
                        context,
                        AppLocalizations.of(context)!.delivered,
                        false,
                      ),
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

  Widget _buildStatusItem(BuildContext context, String title, bool isActive) {
    return Column(
      children: [
        CircleAvatar(
          radius: 10.r,
          backgroundColor: isActive ? AppColor.primaryColor : Colors.grey[300],
          child: isActive
              ? Icon(Icons.check, size: 12.r, color: Colors.white)
              : null,
        ),
        SizedBox(height: 8.h),
        Text(
          title,
          style: TextStyle(
            fontSize: 10.sp,
            color: isActive ? Colors.black : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildLine(bool isActive) {
    return Expanded(
      child: Container(
        height: 2.h,
        color: isActive ? AppColor.primaryColor : Colors.grey[300],
      ),
    );
  }
}
