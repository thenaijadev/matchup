import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({
    super.key,
    required this.location,
  });
  final String location;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1.5,
                  color: Theme.of(context).colorScheme.inverseSurface))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/location_pin.png",
                color: Theme.of(context).colorScheme.primary,
                width: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 200.w,
                child: TextWidget(
                  text: location,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.editLocation);
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: const Color(0xffD9D9D9),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                        child: Image.asset("assets/images/edit_location.png")),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                radius: 15,
                backgroundColor: const Color(0xffD9D9D9),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                      child: Image.asset("assets/images/gray_delete.png")),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
