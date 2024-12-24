import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_bookly/Features/home/data/repos/home_repo_implementation.dart';
import 'package:my_bookly/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:my_bookly/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:my_bookly/const.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/core/utils/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const Bookyl(),
    ),
  );
}

class Bookyl extends StatelessWidget {
  const Bookyl({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImplementation>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImplementation>(),
          )..fetchNewestBooks(),
        ),
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
