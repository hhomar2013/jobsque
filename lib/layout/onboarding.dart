import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobsque/layout/home.dart';
import 'package:jobsque/modules/onboarding/on_screen.dart';
import 'package:jobsque/modules/onboarding/two_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnboardScreen extends StatefulWidget {
  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  List<String> titles = [
    "Welcome",
    "Get Started",
    "Enjoy!"
  ];
  List<Widget> Screens = [
    oneScreen(),
    twoScreen(),
  ];

  List<String> descriptions = [
    "Welcome to our app!",
    "Let's get started with some amazing features.",
    "Enjoy using our app!"
  ];

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal:10),
          child: Image(
            image: AssetImage("assets/image/Logo.png"
            ),
            width: 100,
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: (){} ,
            child: Text('Skip',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold
            ),
            ),

          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: onPageChanged,
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return OnboardItem(
                  title: titles[index],
                  description: descriptions[index],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SmoothPageIndicator(
                      controller: pageController,
                      count: Screens.length,
                    effect: SlideEffect(
                      activeDotColor: HexColor('#3366FF'),
                      dotColor: HexColor('#ADC8FF'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: ElevatedButton(onPressed: (){},
                        child:Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text('Next',style: TextStyle(
                            color: Colors.white
                          )),
                        ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor('#3366FF')
                    ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}

class OnboardItem extends StatelessWidget {
  final String title;
  final String description;

  const OnboardItem({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}

