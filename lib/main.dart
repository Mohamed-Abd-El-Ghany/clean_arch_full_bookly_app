import 'package:clean_arch_full_bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:clean_arch_full_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_full_bookly_app/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:clean_arch_full_bookly_app/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:clean_arch_full_bookly_app/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_full_bookly_app/constants.dart';
import 'package:clean_arch_full_bookly_app/Core/utils/app_router.dart';
import 'package:clean_arch_full_bookly_app/Core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'Core/utils/functions/setup_service_locator.dart';
import 'Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setupServiceLocator();
  await Future.wait([
    Hive.openBox<BookEntity>(kFeaturedBox),
    Hive.openBox<BookEntity>(kNewestBox),
  ]);
  Bloc.observer = SimpleBlocObserver();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              FetchFeaturedBooksUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            )..fetchFeaturedBooks();
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(
              FetchNewestBooksUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            )..fetchNewestBooks();
          },
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
