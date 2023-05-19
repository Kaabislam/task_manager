
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/style/style.dart';

class pinVerificationScreen extends StatefulWidget {
  const pinVerificationScreen({Key? key}) : super(key: key);

  @override
  State<pinVerificationScreen> createState() => _pinVerificationScreenState();
}

class _pinVerificationScreenState extends State<pinVerificationScreen> {
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
                    onChanged: (String value) {  },
                    onCompleted: (onComplete){},


                ),
                Container(
                  child:ElevatedButton(onPressed: (){}, child: SuccessButtonChild("Verify"),style: AppButtonStyle(),),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
