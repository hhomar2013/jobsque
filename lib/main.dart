import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobsque/layout/home.dart';
import 'package:jobsque/layout/onboarding.dart';
import 'package:jobsque/shared/components/constant.dart';
import 'package:jobsque/shared/network/local/cash_helper.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';




Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
    // isHome = CacheHelper.getData(key: 'home');
  // CacheHelper.putData(key: 'home', value: true);
  runApp(MyApp(isHome));
}
class MyApp extends StatelessWidget {
  final  isHome;
  const MyApp(this.isHome);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splashIconSize: 200,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        centered: true,
        splash: RippleAnimation(
          repeat: true,
          color: HexColor("#D6E4FF"),
          minRadius: 90,
          ripplesCount:3, size: Size.infinite,
          child: Center(
            child: Image.asset("assets/image/Logo.png"),
          ),
        )
         , nextScreen: isHome == false || isHome == null ? OnboardScreen() : HomeScreen() ),);
  }
}






