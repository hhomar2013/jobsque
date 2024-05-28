import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/layout/home.dart';
import 'package:jobsque/layout/register.dart';
import 'package:jobsque/modules/CreateAccount/bloc/create_account_cubit.dart';
import 'package:jobsque/modules/CreateAccount/bloc/create_account_state.dart';
import 'package:jobsque/modules/CreateAccount/typeOfWork_screen.dart';
import 'package:jobsque/modules/Home/HomeScreen.dart';
import 'package:jobsque/modules/login/bloc/login_cubit.dart';
import 'package:jobsque/modules/login/bloc/login_state.dart';
import 'package:jobsque/shared/components/components.dart';
import 'package:jobsque/shared/components/constant.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailLoginController = TextEditingController();
    var passwordLoginController = TextEditingController();
    final loginformKey = GlobalKey<FormState>();
    return BlocProvider(
        create:(BuildContext context) => LoginCubit(),
        child: BlocConsumer<LoginCubit,loginState>(
            builder: (context, state) {
              var cubit = LoginCubit.get(context);
                return  Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 150),
                          child: Form(
                            key: loginformKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Login',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                Text('Please login to find your dream job',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 40,),
                                defaultTextField(
                                    controller:emailLoginController,
                                    label: "Email",
                                    type: TextInputType.emailAddress,
                                    hintText: "Email",
                                    prefix: Iconsax.user,
                                    onChange: (value){
                                      if(value != null || value.toString().length > 8) {
                                      }
                                      return null;
                                    },
                                    validate: (value){
                                      if(value == null || value.isEmpty){
                                        return 'Enter your email';
                                      }else if (!value.contains("@")){
                                        return "Enter valid email";
                                      }
                                      return null;


                                    }
                                ),//email
                                SizedBox(height: 15,),
                                defaultTextField(
                                    controller:passwordLoginController,
                                    label: "Password",
                                    type: TextInputType.text,
                                    hintText: "Password",
                                    prefix: Iconsax.lock,
                                    suffix: Iconsax.eye_slash,
                                    obscureText: true,
                                    onChange: (value){
                                      if(value != null || value.toString().length > 8) {
                                      }
                                      return null;
                                    },
                                    validate: (value){
                                      if(value == null || value.toString().length < 8) {
                                        return 'Password must be at least 8 characters';
                                      }
                                      return null;
                                    }
                                ),//Password
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Expanded(child:
                                    Row(
                                      children: [
                                        Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5)
                                            ),
                                            value: cubit.isChecked,
                                            onChanged: (bool? value){
                                              cubit.isCheckedChange(value!);
                                            }),
                                        Text('Remember me'),
                                      ],
                                    )
                                    ),
                                    Expanded(child:
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(onPressed: (){},
                                            child: Text('Forgot Password?',
                                              style: TextStyle(
                                                color: HexColor('#3366FF'),
                                              ),
                                            )
                                        )
                                      ],
                                    )
                                    ),
                                  ],
                                )


                              ],
                            ),
                          ),

                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Dont’t have an account?',

                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                  TextButton(onPressed: (){
                                    navigateTo(context, RegisterScreen());
                                  },
                                      child: Text('Register',
                                        style: TextStyle(
                                          color: HexColor('#3366FF'),
                                        ),
                                      )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 350,
                          height: 48,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: HexColor('#3366FF'),
                              ),
                              onPressed: (){
                                if (loginformKey.currentState!.validate()) {
                                  cubit.login(
                                      email: emailLoginController.text,
                                      password: passwordLoginController.text
                                  );
                                  navigateTo(context, Home());
                                }
                              },
                              child: Text('Login',
                                style: TextStyle(
                                  color: HexColor('#FFFFFF'),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text('Or Login With Account',
                            style: TextStyle(
                              color: HexColor('#6B7280'),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 150,
                                height: 50,
                                child:  TextButton.icon(
                                  onPressed: (){},
                                  icon: Image(
                                    image: AssetImage(
                                        'assets/image/google.png'
                                    ),

                                  ),

                                  label: Text('Google',
                                    style: TextStyle(
                                        color: HexColor('#363F5E'),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                height: 50,
                                child:  TextButton.icon(
                                  onPressed: (){},
                                  icon: Image(
                                    image: AssetImage(
                                        'assets/image/Facebook.png'
                                    ),
                                  ),
                                  label: Text('Facebook',
                                    style: TextStyle(
                                        color: HexColor('#363F5E'),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                      ],
                    ),

                  ),
                );
            },
          listener: (context, state) {

          },
        ),
    );
  }
}