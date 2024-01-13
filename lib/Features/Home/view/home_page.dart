import 'package:booklyapp/Features/Home/view/widget/homepage/home_page_body.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBodyView(),
    );
  }
}
