import 'package:flutter/material.dart';

class CustomRowTextHome extends StatelessWidget {
  const CustomRowTextHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 35,
            bottom: 10,
          ),
          child: Text(
            "Best Seller",
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
