import 'dart:convert';
import 'package:http/http.dart' as http;

import '../style/style.dart';
import '../utility/utitlity.dart';


var BaseURL="https://task.teamrabbil.com/api/v1";
var RequestHeader={"Content-Type":"application/json"};

Future<bool> LoginRequest(FormValues) async{
  var URL=Uri.parse("${BaseURL}/login");
  var PostBody=json.encode(FormValues);

  var response= await http.post(URL,headers:RequestHeader,body: PostBody);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);

  print(ResultCode);
  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    await WriteUserData(ResultBody);
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}
