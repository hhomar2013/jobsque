import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:mtg/modules/newsapp/webview.dart';
// import 'package:mtg/modules/toDoList/cubit/cubit.dart';
// import 'package:mtg/shared/components/constant.dart';

Widget defaultTextField({
  required  TextEditingController controller,
  required  TextInputType type,
  IconData? prefix,
  required  String label,
  String hintText = 'Enter your email',
  Function? onSubmit ,
  Function? onChange ,
  Function? onTap ,
  Function? validate ,
  Function? suffixPressed ,
  bool  isPassword = false,
  bool obscureText = false,
  IconData? suffix ,
}) => TextFormField(

  controller: controller,
  keyboardType: type,
  obscureText: obscureText,
  onFieldSubmitted: (value){
    onSubmit!(value);
  },
  autovalidateMode: AutovalidateMode.onUserInteraction,
  onChanged: (value){
    onChange!(value);
  },
  validator: (value){
   return validate!(value);
  },
  onTap: (){
    onTap!();
  },
  decoration: InputDecoration(
    hintText: hintText,
    labelText: label,
    prefixIcon: Icon(prefix),
    suffixIcon: IconButton(
      onPressed: ()
      {
        suffixPressed!();
      },
      icon: Icon(suffix),
    ),
    border: OutlineInputBorder(),
  ),
);

Widget defaultButton({
  double width = double.maxFinite,
  double height = 50,
  double radius = 10,
  Color backGround = Colors.brown,
  required Function function,
  required String text,
  bool  isUpperCase = false,
}) => Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: backGround,
      borderRadius: BorderRadius.circular(radius),
    ),
  child: MaterialButton(
    onPressed: (){
      function ();
    },
    child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
  ) ,
));


Widget defaultIconButton({
  double width = double.maxFinite,
  double height = 50,
  double radius = 10,
  Color iconColor = Colors.white,
  Color backGround = Colors.brown,
  IconData Iconbtn = Icons.add,
  required Function function,
  String? text,
  bool  isUpperCase = false,
}) => Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: backGround,
      borderRadius: BorderRadius.circular(radius),
    ),
    child: IconButton(
      onPressed: (){
        function();
      },
      icon: Icon(Iconbtn),
      color: iconColor,
    )
);

Widget buildJobItem(Map model , context) => Center(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 16),
          child: Container(
            height: 183,
            width: 300,
            decoration: BoxDecoration(
              color: HexColor('#091A7A'),
              borderRadius: BorderRadius.circular(12),

            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 16),
          child: Container(
            height: 183,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),

            ),
            child:
            Row(
              children: [
                    
              ],
            )
            ,
          ),
        ),
      ],
    ),

);
Widget jobBuilder({
  required List<Map> suggJop ,
}) => ConditionalBuilder(
  condition: suggJop.length > 0,
  builder: (context) => ListView.separated(
    itemBuilder: (context , index ) => buildJobItem(suggJop[index], context),
    separatorBuilder: (context , index ) => SizedBox(height: 20),
    itemCount: suggJop.length ,
  ),
  fallback: (context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu,
            size: 100,
            color: Colors.grey,
          ),
          Text(
            'No jobs Yet , ',
            style: TextStyle(
              fontSize: 50,
            ),
          )

        ],
      ),
    ),
  ),
);

void navigateTo(context , widget) => Navigator.push(context, MaterialPageRoute(builder: (context) => widget,));