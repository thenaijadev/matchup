import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class PictureBottomSheet extends StatefulWidget {
  const PictureBottomSheet({
    super.key,
    required this.changeImage,
  });
  final Function(XFile?) changeImage;
  @override
  State<PictureBottomSheet> createState() => _PictureBottomSheetState();
}

class Xfile {}

class _PictureBottomSheetState extends State<PictureBottomSheet> {
  int chosenIndex = 0;
  XFile? pickedFile;

  void pickFile({required String source}) async {
    if (source == "Gallery") {
      final picker = ImagePicker();

      pickedFile = await picker.pickImage(source: ImageSource.gallery);
      widget.changeImage(pickedFile);
      setState(() {});
    } else {
      final picker = ImagePicker();

      pickedFile = await picker.pickImage(source: ImageSource.camera);
      widget.changeImage(pickedFile);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 20.0).copyWith(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    chosenIndex = 0;
                    pickFile(source: "Gallery");
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: chosenIndex == 0
                            ? Theme.of(context).colorScheme.primary
                            : Colors.transparent),
                    color: const Color(0xff232323),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    "assets/images/photo.png",
                    width: 80,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                text: "Your Photos",
                textAlign: TextAlign.center,
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    chosenIndex = 1;
                    pickFile(source: "Camera");
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: const Color(0xff232323),
                    border: Border.all(
                        width: 1,
                        color: chosenIndex == 1
                            ? Theme.of(context).colorScheme.primary
                            : Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    "assets/images/camera.png",
                    width: 80,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                text: "Your Camera",
                textAlign: TextAlign.center,
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
