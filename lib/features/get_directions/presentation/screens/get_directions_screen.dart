import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:matchup/core/utils/logger.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/features/activities/data/models/activities/activities_model.dart';
import 'package:matchup/features/get_directions/presentation/widgets/get_directions_bottom_sheet.dart';

class GetDirectionScreen extends StatefulWidget {
  const GetDirectionScreen({super.key, required this.activity});
  final Activities activity;
  @override
  State<GetDirectionScreen> createState() => _GetDirectionScreenState();
}

class _GetDirectionScreenState extends State<GetDirectionScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      showModalBottomSheet(
          isDismissible: true,
          isScrollControlled: true,
          scrollControlDisabledMaxHeightRatio: (1 / 2.5),
          showDragHandle: true,
          enableDrag: false,
          context: context,
          builder: ((builderContext) {
            return GetDirectionsBottomSheet(activity: widget.activity);
          }));
      setState(() {
        tappedPoints.add(
          LatLng(
              widget.activity.longLat["latitude"] is String
                  ? double.parse(widget.activity.longLat["latitude"])
                  : widget.activity.longLat["latitude"],
              widget.activity.longLat["longitude"] is String
                  ? double.parse(widget.activity.longLat["longitude"])
                  : widget.activity.longLat["longitude"]),
        );
      });
    });
    logger.f({"Activity Screen": widget.activity});

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isPageTwo = false;

  int page = 0;
  final MapController controller = MapController();
  List<LatLng> tappedPoints = [
    const LatLng(50.5, -0.09),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Marker> markers = tappedPoints.map((latLng) {
      return Marker(
          point: latLng,
          child: Icon(
            Icons.pin_drop,
            color: Theme.of(context).colorScheme.primary,
          ));
    }).toList();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          SizedBox(
            child: FlutterMap(
                mapController: controller,
                options: MapOptions(
                    onTap: (tapPosition, point) {
                      // setState(() {
                      //   tappedPoints.add(point);
                      // });
                    },
                    minZoom: 5,
                    maxZoom: 18,
                    initialCenter: LatLng(
                        widget.activity.longLat["latitude"] is String
                            ? double.parse(widget.activity.longLat["latitude"])
                            : widget.activity.longLat["latitude"],
                        widget.activity.longLat["longitude"] is String
                            ? double.parse(widget.activity.longLat["longitude"])
                            : widget.activity.longLat["longitude"]),
                    initialZoom: 20),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                    userAgentPackageName: "com.matchup.com",
                  ),
                  MarkerLayer(markers: markers)
                ]),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: SafeArea(
              child: Column(
                children: [
                  const Spacer(),
                  PrimaryButton(
                      label: "Next",
                      onPressed: () {
                        showModalBottomSheet(
                            isDismissible: true,
                            isScrollControlled: true,
                            scrollControlDisabledMaxHeightRatio: (1 / 2.5),
                            showDragHandle: true,
                            enableDrag: false,
                            context: context,
                            builder: ((builderContext) {
                              return GetDirectionsBottomSheet(
                                  activity: widget.activity);
                            }));
                      },
                      isEnabled: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
