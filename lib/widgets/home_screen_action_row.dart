import 'package:flutter/material.dart';

import '../helpers/user_helpers.dart';

class HomeScreenActionRow extends StatelessWidget {
  const HomeScreenActionRow({Key? key, required this.nameAndSurname})
      : super(key: key);

  final String nameAndSurname;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Text(nameAndSurname),
        Padding(
          padding: const EdgeInsets.only(right: 15, top: 15),
          child: IconButton(
            iconSize: 45,
            onPressed: () {
              //TODO: Add Logout Functionality
              logoutHelper(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ),
      ],
    );
  }
}
