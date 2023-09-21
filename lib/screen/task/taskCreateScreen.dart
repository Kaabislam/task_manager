

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/api/apiClient.dart';

import '../../style/style.dart';

class taskCreateScreen extends StatefulWidget{
  const taskCreateScreen({Key? key}):super(key:key);
  @override
  State<taskCreateScreen> createState() => _taskCreateScreen();


}

class _taskCreateScreen extends State<taskCreateScreen> {
  Map<String,String> Formvalues = {"title":"", "description":"","status":"New"};
  var Loading = false;
  InputOnChange(mapKey,textValue){
    setState(() {
      Formvalues.update(mapKey, (value) => textValue);
    });
  }

  FormValidity() async {
    if (Formvalues["title"]!.length == 0) {
      ErrorToast("Title is Required Required !");
    }
    else if (Formvalues["description"]!.length == 0) {
      ErrorToast("Give some description Please !");
    }
    else{
      setState(() {
        Loading = true;
      });
      bool response = await TaskCreateRequest(Formvalues);

      if(response == true){
        Loading = false;
        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
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
      appBar: AppBar(backgroundColor: Colors.green,title: Text("Create New Task"),),
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
                      Text("Create a New Task ",style: Head1Text(colorDark),),
                      TextFormField(
                        onChanged: (value){
                          InputOnChange("title", value);
                        },
                        decoration: AppInputDecoration("Title"),),
                      SizedBox(height: 10,),
                      TextFormField(

                        maxLines: 10,
                        onChanged: (value){
                          InputOnChange("description", value);

                        },
                        decoration: AppInputDecoration("description"),),
                      SizedBox(height: 10,),
                      Container(
                        child:ElevatedButton(onPressed: (){FormValidity();},
                          child: SuccessButtonChild("Create task"),style: AppButtonStyle(),),
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