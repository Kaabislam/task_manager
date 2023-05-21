

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/utility/utitlity.dart';

import '../../api/apiClient.dart';
import '../../style/style.dart';

class setPasswordScreen extends StatefulWidget {
  const setPasswordScreen({Key? key}) : super(key: key);

  @override
  State<setPasswordScreen> createState() => _setPasswordScreenState();
}

class _setPasswordScreenState extends State<setPasswordScreen> {
  Map<String,String> Formvalues = {"email":"", "OTP":"","password":"","cpassword":""};
  var Loading = false;

  @override
  void initState(){
    callUserData();
    super.initState();
  }
  callUserData() async {
    String? Email = await ReadUserData("EmailVerification");
    String? Otp = await ReadUserData("OTPVerification");
    InputOnChange("email", Email);
    InputOnChange("OTP", Otp);
  }
  InputOnChange(mapKey,textValue){
    setState(() {
      Formvalues.update(mapKey, (value) => textValue);
      // print(Formvalues);
    });
  }
  FormValidity() async {
    if (Formvalues["password"]!.length == 0) {
      ErrorToast("Password Required !");
    }
    else if (Formvalues["password"]! != Formvalues["cpassword"]!) {
      ErrorToast("Password Don't Match !!");
    }
    else{
      setState(() {
        Loading = true;
      });
      bool response = await SetPasswordRequest(Formvalues);
      if(response == true){
        Loading = false;
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      }
      else{
        setState(() {
          Loading = false;
        });
      }

    }
  }
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

                TextFormField(
                  onChanged: (value){
                    InputOnChange("password", value);
                  },
                  decoration: AppInputDecoration("Password"),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  onChanged: (value){
                    InputOnChange("cpassword", value);
                  },
                  decoration: AppInputDecoration("Confirm Password"),),
                SizedBox(height: 10,),
                Container(
                  child:ElevatedButton(onPressed: (){
                    FormValidity();
                  }, child: SuccessButtonChild("Confirm"),style: AppButtonStyle(),),
                ),



              ],
            ),
          ),

        ],
      ),
    );

  }
}
