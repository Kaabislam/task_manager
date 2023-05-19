
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/style/style.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Get Started With ",style: Head1Text(colorDark),),
                TextFormField(decoration: AppInputDecoration("Email"),),
                SizedBox(height: 10,),
                TextFormField(decoration: AppInputDecoration("Password"),),
                SizedBox(height: 10,),
                Container(
                  child:ElevatedButton(onPressed: (){}, child: SuccessButtonChild("Login"),style: AppButtonStyle(),),
                ),



              ],
            ),
          ),

        ],
      ),
    );
  }
}
