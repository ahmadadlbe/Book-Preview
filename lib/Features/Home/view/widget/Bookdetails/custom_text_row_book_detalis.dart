import 'package:booklyapp/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomRowTextBookDetalis extends StatelessWidget {
  const CustomRowTextBookDetalis({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "You Can Also Like",
          style: ThemeStyle.textStyle14
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
