import 'package:booklyapp/Features/Home/Data/Models/book_model/book_model.dart';
import 'package:booklyapp/core/utils/function/url_launch.dart';
import 'package:booklyapp/core/utils/style.dart';
import 'package:booklyapp/core/widget/custom_button.dart';
import 'package:flutter/material.dart';

class CustomPriceAndFreeBooksDeatils extends StatelessWidget {
  const CustomPriceAndFreeBooksDeatils({
    super.key,
    required this.listModel,
    required this.index,
  });
  final int index;
  final List<BookModel> listModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 300,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 150,
            child: CustomTextButton(
                borderRadiusGeometry: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                text: "Free",
                textStyle: ThemeStyle.textStyle20.copyWith(color: Colors.black),
                backgroundColor: Colors.white,
                onPressed: () {}),
          ),
          SizedBox(
            width: 150,
            child: CustomTextButton(
                borderRadiusGeometry: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20)),
                text: "preview",
                textStyle: ThemeStyle.textStyle20.copyWith(color: Colors.white),
                backgroundColor: const Color(0xffEF8262),
                onPressed: () async {
                  await urlLaunch(listModel, index);
                }),
          ),
        ],
      ),
    );
  }
}
