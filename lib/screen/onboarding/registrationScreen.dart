
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/style.dart';

class registrationScreen extends StatefulWidget {
  const registrationScreen({Key? key}) : super(key: key);

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          ScreenBackground(context),

          Container(
            padding: EdgeInsets.all(20),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Join With Us ",style: Head1Text(colorDark),),
                SizedBox(height: 10,),
                Text("Learn with Kaab",style: Head7Text(colorBlue),),
                SizedBox(height: 10,),
                TextFormField(decoration: AppInputDecoration("Email"),),
                SizedBox(height: 10,),
                TextFormField(decoration: AppInputDecoration("First Name"),),
                SizedBox(height: 10,),
                TextFormField(decoration: AppInputDecoration("Last Name"),),
                SizedBox(height: 10,),
                TextFormField(decoration: AppInputDecoration("Mobile"),),
                SizedBox(height: 10,),
                TextFormField(decoration: AppInputDecoration("Password"),),
                SizedBox(height: 10,),
                Container(
                  child:ElevatedButton(onPressed: (){}, child: SuccessButtonChild("Registration"),style: AppButtonStyle(),),
                ),



              ],
            ),
          ),

        ],
      ),
    );
  }
}
