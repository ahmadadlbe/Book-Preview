import 'package:booklyapp/Features/Home/view/widget/homepage/custom_appbar.dart';
import 'package:booklyapp/Features/Home/view/widget/homepage/custom_listview_bestseller.dart';
import 'package:booklyapp/Features/Home/view/widget/homepage/custom_listviewhome.dart';
import 'package:booklyapp/Features/Home/view/widget/homepage/customrowtexthome.dart';
import 'package:booklyapp/core/utils/function/refresh.dart';
import 'package:flutter/material.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () {
        return refreshHomeView(context);
      },
      child: const Padding(
        padding: EdgeInsets.only(left: 30),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomAppBar(),
                  CustomListViewHome(),
                  CustomRowTextHome(),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: CustomHomeNewstBooks(),
            )
          ],
        ),
      ),
    );
  }
}
