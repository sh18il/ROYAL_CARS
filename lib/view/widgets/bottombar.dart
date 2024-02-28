import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royalcars/controller/bottomnav_provider.dart';

import 'package:royalcars/view/settings.dart';

import '../add_screen.dart';
import '../chart_screen.dart';
import '../home_screen.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(builder: (context, provider, child) {
      return Scaffold(
        body: provider.screens[provider.currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
          animationDuration: const Duration(milliseconds: 400),
          animationCurve: Curves.linear,
          backgroundColor: Colors.transparent,
          color: Colors.black,
          onTap: (newIndex) {
            provider.UpdateIndex(newIndex);
          },
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const Icon(
              Icons.home,
              color: Colors.white,
            ),
            const Icon(
              Icons.add,
              color: Colors.white,
            ),
            const Icon(
              Icons.bar_chart,
              color: Colors.white,
            ),
            // ignore: prefer_const_constructors
            Icon(Icons.settings, color: Colors.white),
          ],
        ),
      );
    });
  }
}
