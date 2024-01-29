import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Repository/user_repo.dart';

import '../models/UserModel.dart';
class MainProvider extends ChangeNotifier{
List<UserModel>users=[];
User_Repo user_repo=new User_Repo();
Future<void>getUsers()async{
  users=await user_repo.getUsers();
  notifyListeners();
}
}