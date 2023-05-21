
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/style/style.dart';

import '../../api/apiClient.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  Map<String,String> Formvalues = {"email":"", "password":""};
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
    else if (Formvalues["password"]!.length == 0) {
      ErrorToast("Password Required !");
    }
    else{
      setState(() {
        Loading = true;
      });
      bool response = await LoginRequest(Formvalues);
      if(response == true){
        Loading = false;

        Navigator.pushNamedAndRemoveUntil(context, "/newTaskList", (route) => false);
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
            child: (Loading)?(Center(child: CircularProgressIndicator(),)):(
              SingleChildScrollView(

                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Get Started With ",style: Head1Text(colorDark),),
                    TextFormField(
                      onChanged: (value){
                        InputOnChange("email", value);
                      },
                      decoration: AppInputDecoration("Email"),),
                    SizedBox(height: 10,),
                    TextFormField(
                      onChanged: (value){
                        InputOnChange("password", value);

                      },
                      decoration: AppInputDecoration("Password"),),
                    SizedBox(height: 10,),
                    Container(
                      child:ElevatedButton(onPressed: (){FormValidity();},
                        child: SuccessButtonChild("Login"),style: AppButtonStyle(),),
                    ),

                    SizedBox(height: 50,),
                    InkWell(
                      onTap: (){Navigator.pushNamed(context, '/emailVerification');},
                      child: Text("Foget Password ?",style: Head7Text(colorLightGray),),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Text("Don't have an Account ? ",style: Head7Text(colorLightGray),),
                        ),
                        InkWell(
                          onTap: (){Navigator.pushNamed(context, "/registration");},
                          child: Text("Sign Up ",style: Head7Text(colorGreen),),
                        ),

                      ],
                    )

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
