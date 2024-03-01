import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royalcars/controller/bottomnav_provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('bottom');
    final provider = Provider.of<BottomNavProvider>(context);
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
        
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.add,
            color: Colors.white,
          ),
          Icon(
            Icons.bar_chart,
            color: Colors.white,
          ),
          
          Icon(Icons.settings, color: Colors.white),
        ],
      ),
    );
  }
}
