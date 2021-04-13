import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:prayer_production/utils/constants.dart';
import 'package:prayer_production/views/accueil.dart';
import 'package:prayer_production/views/signup.dart';
import 'package:prayer_production/views/walkthrough.dart';
import 'package:prayer_production/widgets/bottom_bar_widgets.dart';
import 'package:prayer_production/widgets/search_mosque.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: kDarkTheme,
      child: Builder(
          builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Prayer_App',
          theme: ThemeProvider.of(context),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: OnBoardingPage(),
      ///HomeMainBottomBar(),
      ///AppBarSearchExample(),
      /// SignupPage(),
      /// AppBarSearchExample(),//AccueilPage(),//OnBoardingPage(),
      photoSize: 180,
      image: Image.asset('assets/images/prayer_mosque_logo.png'),
      backgroundColor: Colors.white,
      loaderColor: Colors.greenAccent,
    );
  }
}
