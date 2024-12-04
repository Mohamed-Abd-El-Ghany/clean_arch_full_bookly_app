import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_arch_full_bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:clean_arch_full_bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:clean_arch_full_bookly_app/Features/search/presentation/views/search_view.dart';
import 'package:go_router/go_router.dart';
import '../../Features/splash/presentation/views/splash_view.dart';
import '../../Features/home/data/repos/home_repo_impl.dart';
import '../../Features/home/domain/entities/book_entity.dart';
import '../../Features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import '../../Features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import '../../Features/search/data/repos/search_repo_impl.dart';
import '../../Features/search/presentation/view_models/search_result_cubit/search_result_books_cubit.dart';
import '../../Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'functions/setup_service_locator.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static const kSearchViewResult = '/searchViewResult';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            FetchSimilarBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          )..fetchSimilarBooks,
          child: BookDetailsView(
            booksEntity: state.extra as BookEntity,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchResultCubit(getIt.get<SearchRepoImpl>()),
          child: const SearchView(),
        ),
      ),
      GoRoute(
        path: kSearchViewResult,
        builder: (context, state) => SearchResultListView(
          books: state.extra as List<BookEntity>,
        ),
      ),
    ],
  );
}
