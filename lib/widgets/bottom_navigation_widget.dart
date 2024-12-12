import 'package:flutter/material.dart';
import 'package:flutter_deep_face_cam/constants/colors.dart';
import 'package:provider/provider.dart';
import '../controllers/home_controller.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, HomeController value, Widget? child) {
        final controller = context.read<HomeController>();
        return Container(
          decoration: BoxDecoration(
              color: controller.currentIndex == 0
                  ? blueBG
                  : controller.currentIndex == 1
                      ? Colors.redAccent.withOpacity(0.8)
                      : Colors.green),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            fixedColor: whiteBG,
            unselectedItemColor: whiteBG,
            onTap: (value) {
              controller.updateIndex(value);
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Deep image ',
                icon: Icon(Icons.image),
              ),
              BottomNavigationBarItem(
                label: 'Deep live',
                icon: Icon(Icons.auto_awesome),
              ),
              BottomNavigationBarItem(
                label: 'Deep video',
                icon: Icon(Icons.video_call),
              ),
            ],
          ),
        );
      },
    );
  }
}
