

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style/style.dart';

class setPasswordScreen extends StatefulWidget {
  const setPasswordScreen({Key? key}) : super(key: key);

  @override
  State<setPasswordScreen> createState() => _setPasswordScreenState();
}

class _setPasswordScreenState extends State<setPasswordScreen> {
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
                Text("Set Password ",style: Head1Text(colorDarkBlue),),
                SizedBox(height: 10,),
                Text("Minimum length of password is 8 with number and letter combination ",style: Head6Text(colorDark),),
                SizedBox(height: 10,),

                TextFormField(decoration: AppInputDecoration("Password"),),
                SizedBox(height: 10,),
                TextFormField(decoration: AppInputDecoration("Confirm Password"),),
                SizedBox(height: 10,),
                Container(
                  child:ElevatedButton(onPressed: (){}, child: SuccessButtonChild("Confirm"),style: AppButtonStyle(),),
                ),



              ],
            ),
          ),

        ],
      ),
    );

  }
}
