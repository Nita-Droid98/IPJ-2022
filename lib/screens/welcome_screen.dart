import 'package:flutter/material.dart';
import 'package:flutter_ipj_project/route_manager.dart';

class WelcomePageScreen extends StatelessWidget {
  const WelcomePageScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: FittedBox(
                    child: Text(
                      'StudAttApp',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
                Text(
                  'Record Better Attendance',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const Text("Teacher"),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    child: const Text("Student"),
                    onPressed: () {
                      Navigator.of(context).pushNamed(RouteManager.loginScreen);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
