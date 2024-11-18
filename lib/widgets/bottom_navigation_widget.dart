import 'package:flutter/material.dart';
import 'package:flutter_deep_face_cam/constants/colors.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            orangeBG,
            whiteBG,
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          stops: [0.0, 0.8],
          tileMode: TileMode.clamp,
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        fixedColor: whiteBG,
        unselectedItemColor: whiteBG,
        // currentIndex: context.read<HomeController>().currentIndex,
        onTap: (value) {
          //  counter.updateIndex(value);
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Deep video',
            icon: Icon(Icons.auto_awesome),
          ),
          BottomNavigationBarItem(
            label: 'More',
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
