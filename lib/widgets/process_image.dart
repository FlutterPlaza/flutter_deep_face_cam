import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../controllers/home_controller.dart';

class ProcessImage extends StatefulWidget {
  const ProcessImage({super.key});

  @override
  State<ProcessImage> createState() => _ProcessImageState();
}

class _ProcessImageState extends State<ProcessImage> {
  File? image;
  bool isPickingImage = false;
  ImagePicker imagePicker = ImagePicker();
  XFile? face;
  XFile? target;

  doPickFace(String source) async {
    if (source == "camera") {
      var image = await imagePicker.pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          face = image;
        });
      }
    } else {
      var image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          face = image;
        });
      }
    }

    setState(() {});
  }

  doPickTarget(String source) async {
    if (source == "camera") {
      var image = await imagePicker.pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          target = image;
        });
      }
    } else {
      var image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          target = image;
        });
      }
    }

    setState(() {});
  }

  void showBottomSheetTargetPhoto(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      onTap: () {
                        doPickTarget('camera');
                      },
                      dense: false,
                      leading: const Icon(Icons.camera_alt, color: blueBG),
                      title: const Text(
                        "Camera",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    ListTile(
                      dense: false,
                      onTap: () => {doPickTarget("gallery")},
                      leading:
                          const Icon(Icons.photo_library_sharp, color: blueBG),
                      title: const Text(
                        "Gallery",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void showBottomSheetFacePhoto(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      onTap: () {
                        doPickFace('camera');
                      },
                      dense: false,
                      leading: const Icon(Icons.camera_alt, color: blueBG),
                      title: const Text(
                        "Camera",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    ListTile(
                      dense: false,
                      onTap: () => {doPickFace("gallery")},
                      leading:
                          const Icon(Icons.photo_library_sharp, color: blueBG),
                      title: const Text(
                        "Gallery",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, HomeController value, Widget? child) {
        final controller = context.read<HomeController>();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (face != null)
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        File("${face?.path}"),
                        fit: BoxFit.fitWidth,
                        height: 150,
                        width: 170,
                      ),
                    ),
                    Positioned(
                        top: 5,
                        right: 5,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                face = null;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: const Icon(
                                Icons.close,
                                size: 24,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              Visibility(
                visible: face != null ? false : true,
                child: GestureDetector(
                  child: Container(
                    height: 150,
                    width: 170,
                    decoration: BoxDecoration(
                        color: controller.currentIndex == 0
                            ? blueBG
                            : controller.currentIndex == 1
                                ? Colors.redAccent.withOpacity(0.8)
                                : Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (controller.currentIndex == 2)
                          const Center(
                            child: Icon(
                              Icons.video_camera_back_outlined,
                              size: 30,
                              color: whiteBG,
                            ),
                          ),
                        if (controller.currentIndex != 2)
                          const Center(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 30,
                              color: whiteBG,
                            ),
                          ),
                        const SizedBox(height: 15),
                        Text(
                          controller.cardText,
                          style: GoogleFonts.mulish(
                            textStyle: const TextStyle(
                                color: whiteBG, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    showBottomSheetFacePhoto(context);
                  },
                ),
              ),
              if (target != null)
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        File("${target?.path}"),
                        fit: BoxFit.fitWidth,
                        height: 150,
                        width: 170,
                      ),
                    ),
                    Positioned(
                        right: 5,
                        top: 5,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                target = null;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: const Icon(
                                Icons.close,
                                size: 24,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              Visibility(
                visible: target != null || controller.currentIndex == 1
                    ? false
                    : true,
                child: GestureDetector(
                  child: Container(
                    height: 150,
                    width: 170,
                    decoration: BoxDecoration(
                        color: controller.currentIndex == 0
                            ? blueBG
                            : controller.currentIndex == 1
                                ? Colors.blue
                                : Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 30,
                            color: whiteBG,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          controller.targetText,
                          style: GoogleFonts.mulish(
                            textStyle: const TextStyle(
                                color: whiteBG, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    showBottomSheetTargetPhoto(context);
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
