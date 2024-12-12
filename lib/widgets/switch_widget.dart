import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class SwitchWidget extends StatefulWidget {
  bool toggler;
  final String title;
  SwitchWidget({super.key, required this.toggler, required this.title});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, HomeController value, Widget? child) {
        final controller = context.read<HomeController>();
        return Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CupertinoSwitch(
                activeColor: controller.currentIndex == 0
                    ? blueBG
                    : controller.currentIndex == 1
                        ? Colors.redAccent.withOpacity(0.8)
                        : Colors.green,
                value: widget.toggler,
                onChanged: (value) {
                  setState(() {
                    widget.toggler = !widget.toggler;
                  });
                },
              ),
              Text(
                widget.title,
                style: GoogleFonts.mulish(
                  textStyle: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
