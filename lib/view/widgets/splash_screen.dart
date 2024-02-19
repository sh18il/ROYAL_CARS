import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:royalcars/view/widgets/bottombar.dart';
import 'package:royalcars/view/widgets/register.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserlLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('image/carr1.png'),
          const Text("ROYAL CARS",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w400,
              )),
          Image.asset('image/rolss.png'),
          const Center(
              child: Text(
            'welcome',
            style: TextStyle(
              color: Colors.white,
            ),
          )),
        ],
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.of(context).pushReplacement(
        (MaterialPageRoute(builder: (ctx) => const RegisterScreen())));
  }

  Future<void> checkUserlLogin() async {
    final sharedprfre = await SharedPreferences.getInstance();
    final userLoggedIn = sharedprfre.getBool(SAVE_KEY);
    if (userLoggedIn == null || userLoggedIn == false) {
      gotoLogin();
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BottomNav()));
    }
  }
}
