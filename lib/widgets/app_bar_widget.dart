import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../controllers/home_controller.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, HomeController value, Widget? child) {
        final controller = context.read<HomeController>();
        return AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                color: controller.currentIndex == 0
                    ? blueBG
                    : controller.currentIndex == 1
                        ? Colors.redAccent.withOpacity(0.8)
                        : Colors.green),
          ),
          title: Text(
            "Deep Face preview",
            style: GoogleFonts.mulish(
              textStyle:
                  const TextStyle(color: whiteBG, fontWeight: FontWeight.bold),
            ),
          ),
          centerTitle: true,
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size(200, 60);
}
