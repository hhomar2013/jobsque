import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:jobsque/layout/home.dart';
import 'package:jobsque/modules/CreateAccount/bloc/create_account_cubit.dart';
import 'package:jobsque/modules/CreateAccount/bloc/create_account_state.dart';
import 'package:jobsque/modules/CreateAccount/typeOfWork_screen.dart';
import 'package:jobsque/modules/login/login_screen.dart';
import 'package:jobsque/shared/components/components.dart';
import 'package:jobsque/shared/components/constant.dart';

class createAccountScreen extends StatelessWidget {
  // const createAcc/ountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final register_formKey = GlobalKey<FormState>();
    var _emailController = TextEditingController();
    var _nameController = TextEditingController();
    var _passwordController = TextEditingController();
    return BlocProvider(
        create:(BuildContext context) => createAccountCubit(),
        child: BlocConsumer<createAccountCubit,createAccountState>(
            builder: (context, state) {

              var cubit = createAccountCubit.get(context);
                return Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Form(
                          key: register_formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Cereate Account',
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text('Please create an account to find your dream job',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 40,),

                              defaultTextField(
                                  controller:_nameController,
                                  label: "User Name",
                                  type: TextInputType.name,
                                  hintText: "User Name",
                                  prefix: Icons.person_2_outlined,
                                  validate: (value){
                                    if(value == null || value.isEmpty){
                                      return 'Enter your name';
                                    }
                                    return null;
                                  }
                              ), //username
                              SizedBox(height: 15,),
                              defaultTextField(
                                  controller:_emailController,
                                  label: "Email",
                                  type: TextInputType.emailAddress,
                                  hintText: "Email",
                                  prefix: Icons.email_outlined,
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
                                  controller:_passwordController,
                                  label: "Password",
                                  type: TextInputType.text,
                                  hintText: "Password",
                                  prefix: Icons.lock,
                                  suffix: Icons.visibility_off_outlined,
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
                                Text('Already have an account?',

                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                TextButton(onPressed: (){
                                  navigateTo(context, loginScreen());
                                },
                                    child: Text('Login',
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
                              if (register_formKey.currentState!.validate()) {
                                  cubit.register(
                                      name: _nameController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text
                                  );
                                  navigateTo(context, typeOfWorkScreen());
                              }


                            },
                            child: Text('Create account',
                              style: TextStyle(
                                color: HexColor('#FFFFFF'),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text('Or Sign up With Account',
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

                );
            },
          listener: (context, state) {

          },
        ),
    );
  }
}