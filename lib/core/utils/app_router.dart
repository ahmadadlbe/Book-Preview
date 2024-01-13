import 'package:booklyapp/Features/Home/Data/Repo/home_repo_imple.dart';
import 'package:booklyapp/Features/Home/view/book_details_view.dart';
import 'package:booklyapp/Features/Home/view/home_page.dart';
import 'package:booklyapp/Features/Home/view_model/semrller_book_cubit/semrller_book_cubit.dart';
import 'package:booklyapp/Features/Search/View/search_view.dart';
import 'package:booklyapp/Features/Splash/view/splash_view.dart';
import 'package:booklyapp/core/utils/servics_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const homeView = "/homeView";
  static const deatilsView = "/deatilsView";
  static const searchView = "/searchView";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: searchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomePageView(),
      ),
      GoRoute(
          path: deatilsView,
          builder: (context, state) {
            var bookModel = state.extra! as Map;
            return BlocProvider(
                create: (context) {
                  return SemrllerBookCubit(getit.get<HomeRepoImple>());
                },
                child: BookDetailsView(bookModel: bookModel["ListModel"]));
          }),
    ],
  );
}
