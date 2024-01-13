import 'package:booklyapp/Features/Home/Data/Repo/home_repo_imple.dart';
import 'package:booklyapp/Features/Home/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/Features/Home/view_model/featured_newst_books_cubit/featured_newst_books_cubit.dart';
import 'package:booklyapp/Features/Search/Data/Repo/implemnt_home_repo.dart';
import 'package:booklyapp/Features/Search/View_model/cubit/search_cubit.dart';
import 'package:booklyapp/constant/colorconst.dart';
import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/utils/servics_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServicsGetit();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getit.get<HomeRepoImple>())..fetchbooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewstBooksCubit(getit.get<HomeRepoImple>())..fetchNewstBooks(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(getit.get<ImpHomeRepoSearch>()),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimeColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
      ),
    );
  }
}
