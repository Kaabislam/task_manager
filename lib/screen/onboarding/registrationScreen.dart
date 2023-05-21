
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/api/apiClient.dart';

import '../../style/style.dart';

class registrationScreen extends StatefulWidget {
  const registrationScreen({Key? key}) : super(key: key);

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {
  Map<String,String> Formvalues = {"email":"", "firstName":"","lastName":"","mobile":"","password":"","photo":"","cpassword":"",};
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
    else if (Formvalues["firstName"]!.length == 0) {
      ErrorToast("First Name Required !");
    }
    else if (Formvalues["lastName"]!.length == 0) {
      ErrorToast("Last Name Required !");
    }
    else if (Formvalues["password"]!.length == 0) {
      ErrorToast("Password Required !");
    }
    else if (Formvalues["mobile"]!.length == 0) {
      ErrorToast("Mobile Number  Required !");
    }
    else if (Formvalues["password"]! != Formvalues["cpassword"]) {
      ErrorToast("Password and Confirm Password must be same !");
    }
    else{
      setState(() {
        Loading = true;
      });
      bool response = await RegistrationRequest(Formvalues);
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
            alignment: Alignment.center,
            child: (Loading) ? (CircularProgressIndicator()):(
              SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Join With Us ",style: Head1Text(colorDark),),
                    SizedBox(height: 10,),
                    Text("Learn with Kaab",style: Head7Text(colorBlue),),
                    SizedBox(height: 10,),
                    TextFormField(
                      onChanged: (value){
                        InputOnChange("email", value);
                      },
                      decoration: AppInputDecoration("Email"),),
                    SizedBox(height: 10,),
                    TextFormField(
                      onChanged: (value){
                        InputOnChange("firstName", value);
                      },
                      decoration: AppInputDecoration("First Name"),),
                    SizedBox(height: 10,),
                    TextFormField(
                      onChanged: (value){
                        InputOnChange("lastName", value);
                      },
                      decoration: AppInputDecoration("Last Name"),),
                    SizedBox(height: 10,),
                    TextFormField(
                      onChanged: (value){
                        InputOnChange("mobile", value);
                      },
                      decoration: AppInputDecoration("Mobile"),),
                    SizedBox(height: 10,),
                    TextFormField(
                      onChanged: (value){
                        InputOnChange("password", value);
                      },
                      decoration: AppInputDecoration("Password"),),
                    SizedBox(height: 10,),
                    TextFormField(
                      onChanged: (value){
                        InputOnChange("cpassword", value);
                      },
                      decoration: AppInputDecoration("Confirm Password"),),
                    SizedBox(height: 10,),
                    Container(
                      child:ElevatedButton(onPressed: (){FormValidity();}, child: SuccessButtonChild("Registration"),style: AppButtonStyle(),),
                    ),



                  ],
                ),
              )
            ),
          ),

        ],
      ),
    );
  }
}
