import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
    DefaultAssetBundle.of(context)
        .loadString("i_theme/dark_theme_json.json")
        .then((value) {
      themeForMap = value;
    });
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
      setState(() {});
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

  String themeForMap = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
            style: themeForMap,
            markers: {
              Marker(
                icon: BitmapDescriptor.defaultMarker,
                markerId: const MarkerId("_markerPosition"),
                position: LatLng(double.parse(widget.activity.latitude!),
                    double.parse(widget.activity.longitude!)),
              ),
            },
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
                zoom: 20,
                target: LatLng(
                  double.parse(widget.activity.latitude!),
                  double.parse(widget.activity.longitude!),
                )),
            onTap: (point) {
              print(point);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SafeArea(
              child: PrimaryButton(
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
            ),
          ),
        ],
      ),
    );
  }
}
