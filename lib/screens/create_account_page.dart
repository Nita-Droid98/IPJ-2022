import 'package:flutter/material.dart';

class CreaeteAccountScreen extends StatelessWidget {
  const CreaeteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(),
                  TextFormField(),
                  TextFormField(),
                  TextFormField(),
                  ElevatedButton(
                    child: const Text("Sign Up"),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
