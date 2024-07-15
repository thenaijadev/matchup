import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class SportItemWidget extends StatelessWidget {
  const SportItemWidget(
      {super.key,
      required this.onTap,
      required this.chosenIndex,
      required this.image,
      required this.title,
      required this.isSelected});
  final VoidCallback onTap;
  final int chosenIndex;
  final String image;
  final String title;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // padding: const EdgeInsets.all(30),

        decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.inverseSurface),
          color: isSelected
              ? const Color.fromARGB(22, 254, 94, 8)
              : Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image.contains("example.com"))
              Image.asset(
                image,
                width: 50,
              ),
            if (!image.contains("example.com"))
              Image.network(
                image,
                width: 50,
              ),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
              text: title,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ],
        ),
      ),
    );
  }
}
