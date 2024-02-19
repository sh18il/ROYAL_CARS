import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Privacy Policy')),
          backgroundColor: Colors.black,
        ),
        body: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Gap(10),
                  Text(
                    'Privacy Policy for Used Cars Storing App',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Gap(10),
                  Text(
                      '''This Privacy Policy outlines how ROYAL CARS US collects, uses, discloses, and protects the personal information of users you of our used cars storing mobile application ("the App"). '''),
                  Gap(10),
                  Text('Usage Information',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Gap(10),
                  Text('''We may collect information about how you use the App,
                       including your interactions with the App's features and functionalities, device information, IP address, and usage patterns.'''),
                  Gap(10),
                  Text('Changes to This Privacy Policy',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Gap(10),
                  Text(
                      '''We may update this Privacy Policy from time to time to reflect changes in our practices or legal requirements. 
                      We will notify you of any material changes by posting the updated policy on the App or by other means.'''),
                  Gap(10),
                  Text('Contact Us',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Gap(10),
                  Text(
                      '''If you have any questions, concerns, or complaints about this Privacy Policy or our data practices,
                       please contact us at sshibil379@gmail.com'''),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
