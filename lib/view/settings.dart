import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:royalcars/controller/settings_provider.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);

  final List<String> itemNames = [
    'LOGOUT',
    'RESET',
    'ABOUT',
    'PRIVACY & POLICY',
  ];

  @override
  Widget build(BuildContext context) {
    log('chart');
    final provider = Provider.of<SettingsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Text(
            'SETTINGS',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: ListView.builder(
              itemCount: itemNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      Text(itemNames[index]),
                    ],
                  ),
                  onTap: () {
                    Provider.of<SettingsProvider>(context, listen: false)
                        .handleListItemTap(context, index, provider);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
