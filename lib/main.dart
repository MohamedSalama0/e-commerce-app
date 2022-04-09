import 'package:flutter/material.dart';
import 'app_router.dart';
import 'common/app_style.dart';
void main() {
  runApp(MyApp(appRouter: AppRouter()));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);
  AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: myWhite,
            centerTitle: true,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          inputDecorationTheme: inputDecorationTheme(),
          fontFamily: 'Muli',
          scaffoldBackgroundColor: const Color(0xFFE7E9F5),
          // primaryColor: const Color(0xFF283C63),
          iconTheme: IconThemeData(color: Colors.black.withOpacity(0.4))),
      // home:  HomeScreen(),
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
