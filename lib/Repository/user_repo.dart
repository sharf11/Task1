import 'dart:convert';

import 'package:untitled/models/UserModel.dart';
import 'package:http/http.dart'as http;
class User_Repo{
  var url="https://jsonplaceholder.typicode.com/users";
  List<UserModel>users=[];
  Future<List<UserModel>>getUsers()async {
    try
    {
      final response = await http.get(Uri.parse(url));
      if(response.statusCode==200 && response.body!=null)
      {
        List data = json.decode(utf8.decode(response.bodyBytes));
        users=data.map((e) => UserModel.fromJson(e)).toList();
      }
    }
    catch(e)
    {
      print(e);
    }
    return users;
  }
}