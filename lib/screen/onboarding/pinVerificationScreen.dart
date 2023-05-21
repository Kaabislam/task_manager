
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/style/style.dart';
import 'package:task_manager/utility/utitlity.dart';

import '../../api/apiClient.dart';

class pinVerificationScreen extends StatefulWidget {
  const pinVerificationScreen({Key? key}) : super(key: key);

  @override
  State<pinVerificationScreen> createState() => _pinVerificationScreenState();
}

class _pinVerificationScreenState extends State<pinVerificationScreen> {
  Map<String,String> Formvalues = {"otp":""};
  var Loading = false;
  InputOnChange(mapKey,textValue){
    setState(() {
      Formvalues.update(mapKey, (value) => textValue);
      // print(Formvalues);
    });
  }
  FormValidity() async {
    if (Formvalues["otp"]!.length != 6) {
      ErrorToast("Pin Required !");
    }
    else{
      setState(() {
        Loading = true;
      });
      String? emailAddress = await ReadUserData("EmailVerification");
      bool response = await VerifyOTPRequest(emailAddress,Formvalues["otp"]);

      if(response == true){
        Loading = false;

        Navigator.pushNamedAndRemoveUntil(context, "/setPassword", (route) => false);
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

              children: [
                Text("Pin Verification",style: Head1Text(colorDark),),
                SizedBox(height: 10,),
                Text("A 6 digit verification pin has been send to your moblile",style: Head6Text(colorLightGray),),
                SizedBox(height: 10,),

                PinCodeTextField(
                    pinTheme: AppOTPStyle(),
                    length: 6,
                    appContext: context,
                    onChanged: (value) {
                      InputOnChange("otp", value);
                    },
                    onCompleted: (onComplete){},


                ),
                Container(
                  child:ElevatedButton(onPressed: (){
                    FormValidity();
                  }, child: SuccessButtonChild("Verify"),style: AppButtonStyle(),),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
