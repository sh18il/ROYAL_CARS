import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'sign_in.dart';

const SAVE_KEY = 'usrLogedin';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final usernameCntr = TextEditingController();
  final passwordCntr = TextEditingController();
  final _SINGUPkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              alignment: const Alignment(-0.8, 0.6),
              child: const Text("ROYAL CARS ",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  )),
            ),
            const Gap(30),
            SizedBox(
              height: 350,
              child: Image.asset(
                "image/carr1.png",
                width: 524,
                height: 210,
              ),
            ),
            Form(
              key: _SINGUPkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 305,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'not valid';
                          }
                          return null;
                        },
                        controller: usernameCntr,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          prefixIcon: const Icon(Icons.person_3),
                          hintText: 'USER NAME ',
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 305,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'not valid';
                          }
                          return null;
                        },
                        controller: passwordCntr,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          prefixIcon: const Icon(Icons.hide_source_rounded),
                          hintText: 'PASSWORD ',
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black87),
                      ),
                      onPressed: () {
                        if (_SINGUPkey.currentState!.validate()) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Singin(
                                      username: usernameCntr.text,
                                      passwoed: passwordCntr.text)));
                        }
                      },
                      child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text('Sing up')))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
