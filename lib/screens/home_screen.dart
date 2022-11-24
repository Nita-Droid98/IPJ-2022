import 'package:flutter/material.dart';

import '../route_manager.dart';
import '../widgets/two_rounded_edge_container.dart';
import '../widgets/welcome_screen_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 32,
              ),
              child: FittedBox(
                child: Text(
                  "Welcome",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ),
            Text(
              //TODO: Add Name Retrieval Code, Selector Prolly
              "Welcome",
              style: Theme.of(context).textTheme.headline4,
            ),
            const Spacer(),
            TwoRoundedEdgeContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WelcomeScreenCard(
                    //TODO: Navigate to Edit Profile Page
                    onPressed: () {},
                    title: "Edit Profile",
                    child: const SizedBox(
                      child: CircleAvatar(
                        backgroundColor: Colors.black26,
                        radius: 50,
                        child: Icon(
                          Icons.person_outline_rounded,
                          size: 60,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WelcomeScreenCard(
                        //TODO: Navigate to ScanQR
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.scanQrCodeScreen);
                        },
                        title: "Scan QR",
                        child: const SizedBox(
                          child: Icon(
                            Icons.qr_code_scanner_sharp,
                            size: 60,
                          ),
                        ),
                      ),
                      WelcomeScreenCard(
                        //TODO: Navigate to Attendance Page
                        onPressed: () {},
                        title: "View Attendance",
                        child: const SizedBox(
                          child: Icon(
                            Icons.checklist_rtl,
                            size: 60,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
