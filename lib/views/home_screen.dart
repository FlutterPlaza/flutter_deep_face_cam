import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../controllers/home_controller.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/bottom_navigation_widget.dart';
import '../widgets/custom_button.dart';
import '../widgets/process_image.dart';
import '../widgets/switch_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ImagePicker imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Consumer<HomeController>(
      builder: (BuildContext context, HomeController value, Widget? child) {
        final controller = context.read<HomeController>();
        return Scaffold(
          appBar: const AppBarWidget(),
          bottomNavigationBar: const BottomNavigationWidget(),
          body: Column(
            children: [
              const SizedBox(height: 50),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: size.height / 4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            controller.userCase1,
                            style: GoogleFonts.mulish(
                              textStyle: const TextStyle(
                                  color: blackBG,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (controller.processed)
                    Positioned(
                      bottom: 10,
                      right: 30,
                      child: IconButton(
                        onPressed: () => {},
                        icon: const Icon(Icons.download_rounded),
                      ),
                    )
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const ProcessImage(),
                      const SizedBox(height: 50),
                      if (controller.currentIndex != 0)
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                              controller.switchOtions.length, (index) {
                            var data = controller.switchOtions[index];
                            return SwitchWidget(
                              title: data['name'],
                              toggler: data['status'],
                            );
                          }).toList(),
                        ),
                      SizedBox(
                        width: size.width / 3,
                        child: CustomButton(
                          name: controller.btnText,
                          btnColor: controller.currentIndex == 0
                              ? blueBG
                              : controller.currentIndex == 1
                                  ? Colors.redAccent.withOpacity(0.8)
                                  : Colors.green,
                          textColor: whiteBG,
                          onPress: () async => {
                            if (controller.currentIndex == 1)
                              {
                                await imagePicker.pickImage(
                                    source: ImageSource.camera)
                              }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
