import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/modules/Home/bloc/home_cubit.dart';
import 'package:jobsque/modules/Home/bloc/home_state.dart';
import 'package:jobsque/shared/components/components.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeState>(
        builder:(context, state) {
            var cubit = HomeCubit.get(context);
            return  Scaffold(
              appBar: AppBar(
                title: Text(
                    'message'
                ),

              ),
              body: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 160,
                    color: Colors.red,
                  ),
                  Container(
                    width: 160,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 160,
                    color: Colors.green,
                  ),
                  Container(
                    width: 160,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 160,
                    color: Colors.orange,
                  ),
                ],
              ),
            );
        },
        listener:(context, state) {}
    ),
    );

  }
}
