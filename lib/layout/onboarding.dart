import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobsque/layout/home.dart';
import 'package:jobsque/layout/register.dart';
import 'package:jobsque/modules/login/login_screen.dart';
import 'package:jobsque/modules/onboarding/bloc/cubit.dart';
import 'package:jobsque/modules/onboarding/bloc/state.dart';
import 'package:jobsque/modules/onboarding/on_screen.dart';
import 'package:jobsque/modules/onboarding/three_screen.dart';
import 'package:jobsque/modules/onboarding/two_screen.dart';
import 'package:jobsque/shared/components/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnboardScreen extends StatelessWidget {
  // const OnboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => onBoardingCubit(),
      child: BlocConsumer<onBoardingCubit,onBoardingState>(
        builder: (context, state) {
          onBoardingCubit cubit  = onBoardingCubit.get(context);
          final controller = PageController(initialPage: cubit.currentIndex);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal:10),
                child: Image(
                  image: AssetImage("assets/image/Logo.png"),
                  width: 100,
                ),
              ),
              actions: [
                MaterialButton(
                  onPressed: (){
                    // print('skip');
                    navigateTo(context,Home());
                  } ,
                  child: Text('Skip',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15

                    ),
                  ),

                )
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child:
                  PageView.builder(
                    controller: controller,
                    onPageChanged: (value){
                      cubit.changeIndex(value);
                    },
                    itemCount: cubit.Screens.length,
                    itemBuilder: (context, index) {
                      return cubit.Screens[index];
                    },
                  ),

                ),


                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: SmoothPageIndicator(
                          controller:controller,
                          count: cubit.Screens.length,
                          effect: SlideEffect(
                              activeDotColor: HexColor('#3366FF'),
                              dotColor: HexColor('#ADC8FF'),
                              dotHeight: 8,
                              dotWidth: 8
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
                          child: ElevatedButton(onPressed: (){
                            cubit.nextPage();print(cubit.currentIndex);
                            if (cubit.currentIndex <= cubit.Screens.length -1){
                              controller.nextPage(
                                  duration: Duration(microseconds: 2000)
                                  , curve: Curves.bounceInOut);
                            }else{
                              navigateTo(context,RegisterScreen());
                            }

                          },
                            child:Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(cubit.currentIndex < cubit.Screens.length -1 ? 'Next' :'Get Started' ,style: TextStyle(
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
        }, listener: (context, state) {},),
    );

  }
}

