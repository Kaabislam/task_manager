
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../api/apiClient.dart';
import '../../style/style.dart';

class emailVerificationScreen extends StatefulWidget {
  const emailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<emailVerificationScreen> createState() => _emailVerificationScreenState();
}

class _emailVerificationScreenState extends State<emailVerificationScreen> {
  Map<String,String> Formvalues = {"email":""};
  var Loading = false;
  InputOnChange(mapKey,textValue){
    setState(() {
      Formvalues.update(mapKey, (value) => textValue);
      // print(Formvalues);
    });
  }
  FormValidity() async {
    if (Formvalues["email"]!.length == 0) {
      ErrorToast("Email Required !");
    }
    else{
      setState(() {
        Loading = true;
      });
      bool response = await VerifyEmailRequest(Formvalues["email"]);
      if(response == true){
        Loading = false;
        Navigator.pushNamedAndRemoveUntil(context, "/pinVerification", (route) => false);
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Your Email Address",style: Head1Text(colorDark),),
                SizedBox(height: 20,),
                Text("A 6 digit verification pin will send to your email address",style: Head6Text(colorLight),),
                SizedBox(height: 20,),

                TextFormField(
                  onChanged: (value){
                    InputOnChange("email", value);
                  },
                  decoration: AppInputDecoration("Email"),),
                SizedBox(height: 20,),

                Container(
                  child:ElevatedButton(onPressed: (){
                    FormValidity();
                  },
                    child: SuccessButtonChild("Next"),style: AppButtonStyle(),),
                ),



              ],
            ),
          ),

        ],
      ),
    );

  }
}
