import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Config/LocalStorage.dart';
import '../../config/GlobalFunction.dart';
import '../../main.dart';
import '../../utils/AppTheme.dart';

class Register extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Register>{
  TextEditingController name =new TextEditingController();
  TextEditingController email =new TextEditingController();
  TextEditingController password=new TextEditingController();
  FocusNode passwordNode =new FocusNode();
  FocusNode emailNode =new FocusNode();
  final formKey=GlobalKey<FormState>();
  bool loading=false;
  bool ishidden=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  String message="";
  @override
  Widget build(BuildContext context) {

    var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
                children: [
                  SizedBox(height: h*.053,),
                  Container(
                    width: w*.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.arrow_forward_ios,size: 18,)
                      ],
                    ),
                  ),
                  SizedBox(height: 0,),
                  Image.asset("assets/images/Logo.jpg",
                    width: MediaQuery.of(context).size.height*.1,
                  ),
                  SizedBox(height: 10,),
                  Text("تسجيل حساب جديد",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: AppTheme.primaryColor),),
                  SizedBox(height: 5,),
                  Text("قم بالتسجيل بياناتك لتتمكن من الدخول",style: TextStyle(fontSize: 13,color: AppTheme.primaryColor),),
                  Form(
                    key: formKey,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width*.05,
                        right: MediaQuery.of(context).size.width*.05,
                        top: MediaQuery.of(context).size.height*.03,
                        bottom: MediaQuery.of(context).size.height*.03,
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("اسم المستخدم",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),),
                          SizedBox(height:5,),
                          Container(
                            width: MediaQuery.of(context).size.width*.9,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),
                              controller: name,
                              onFieldSubmitted: (value){
                                FocusScope.of(context).requestFocus(emailNode);
                              },
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'ادخل اسمك';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(fontSize: 12),
                                  enabledBorder: new OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(1000),
                                      borderSide: BorderSide(color:AppTheme.borderColor,width: .5)
                                  ),
                                  focusedBorder:  new OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(1000),
                                      borderSide: BorderSide(color: AppTheme.borderColor,width: .5)
                                  ),
                                  focusedErrorBorder:new OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(1000),
                                      borderSide: BorderSide(color: Colors.red,width: .5)
                                  ),
                                  errorBorder:new OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(1000),
                                      borderSide: BorderSide(color: Colors.red,width: .5)
                                  ),

                                  contentPadding: EdgeInsets.only(
                                      left: 10,right: 10,top: 10,bottom: 10
                                  ),
                                  hintText: "الاسم",
                                  hintStyle: TextStyle(color: Colors.black54,fontSize: 12),
                                  fillColor: Colors.white
                              ),
                            ),
                          ),
                          SizedBox(height:15,),
                          Text("البريد الالكتروني",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),),
                          SizedBox(height:5,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:BorderRadius.all(Radius.circular(10)),

                            ),

                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (value){
                                FocusScope.of(context).requestFocus(passwordNode);
                              },
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'ادخل البريد الالكتروني';
                                }
                                // else if(loginValdite['Message']=="Password is incorrect.");
                                return null;
                              },
                              //textDirection: lang=="ar"?TextDirection.rtl:TextDirection.ltr,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(right: 15,left: 15,top: 0,bottom: 0),
                                enabledBorder: new OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(1000),
                                    borderSide: BorderSide(color:AppTheme.borderColor,width: .5)
                                ),
                                focusedBorder:  new OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(1000),
                                    borderSide: BorderSide(color: AppTheme.borderColor,width: .5)
                                ),
                                focusedErrorBorder:new OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(1000),
                                    borderSide: BorderSide(color: Colors.red,width: .5)
                                ),
                                errorBorder:new OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(1000),
                                    borderSide: BorderSide(color: Colors.red,width: .5)
                                ),
                                hintText:"البريد الالكتروني" ,
                                errorStyle: TextStyle(color: Colors.red,fontSize: 12),
                                hintStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 12),
                              ),
                              controller: email,
                            ),
                          ),
                          //////////////////////////////////////////////

                          /////////////////////////////////////////////
                          SizedBox(height:15,),
                          Text("كلمة المرور",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),),
                          SizedBox(height:5,),
                          Container(
                            width: MediaQuery.of(context).size.width*.9,
                            child: TextFormField(
                              style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),
                              controller: password,
                              obscureText: ishidden,
                              onFieldSubmitted: (value){
                                FocusScope.of(context).requestFocus(FocusNode());
                              },
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'ادخل كلمة المرور';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(fontSize: 12),
                                  enabledBorder: new OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(1000),
                                      borderSide: BorderSide(color:AppTheme.borderColor,width: .5)
                                  ),
                                  focusedBorder:  new OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(1000),
                                      borderSide: BorderSide(color: AppTheme.borderColor,width: .5)
                                  ),
                                  focusedErrorBorder:new OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(1000),
                                      borderSide: BorderSide(color: Colors.red,width: .5)
                                  ),
                                  errorBorder:new OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(1000),
                                      borderSide: BorderSide(color: Colors.red,width: .5)
                                  ),

                                  contentPadding: EdgeInsets.only(
                                      left: 10,right: 10,top: 10,bottom: 10
                                  ),
                                  suffixIcon: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          ishidden=!ishidden;
                                        });
                                      },
                                      child: Icon(ishidden?Icons.visibility_outlined:Icons.visibility_off_outlined,color: Colors.black54,)),
                                  hintText: "كلمة المرور ",
                                  hintStyle: TextStyle(color: Colors.black54,fontSize: 12),
                                  fillColor: Colors.white
                              ),
                            ),
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height*.03,),
                          message==""?SizedBox(height:0,): Container(
                            width: w,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(bottom: 25),
                            child: Text(message,style: TextStyle(fontSize: 13,color: Colors.red),),
                          ),
                          GestureDetector(
                            onTap: ()async{
                              if(formKey.currentState!.validate()){
                                setState(() {
                                  loading=true;
                                });
                                FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text).then((value) => {
                                  FlutterToastr.show("User Created Successfully", context),
                                  LocalStorage.SaveData("email", email.text),
                                  Navigator.pushNamedAndRemoveUntil(context, "/mainPage", (route) => false)
                                }).onError((error, stackTrace) => {
                                  setState(() {
                                    message=error.toString();
                                  })
                                });
                                setState(() {
                                  loading=false;
                                });
                              }
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height*.065,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: loading?Colors.black12:AppTheme.primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(2, 2), // changes position of shadow
                                  ),
                                  BoxShadow(
                                    color: Colors.black12.withOpacity(0.05),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(-2, -2), // changes position of shadow
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Text("تسجيل الحساب",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            ),
                          ),
                          SizedBox( height: MediaQuery.of(context).size.height*.01,),
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height*.06,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("هل لديك حساب؟",style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 14),),
                                  Text("تسجيل الدخول",style: TextStyle(decoration: TextDecoration.underline,color: AppTheme.primaryColor,fontWeight: FontWeight.bold,fontSize: 14),)

                                ],
                              ),
                            ),
                          )
                          ,SizedBox( height: MediaQuery.of(context).size.height*.12,),
                        ],
                      ),

                    ),
                  ),
                  SizedBox( height: MediaQuery.of(context).size.height*.05,),
                ],
              )
        ),
      ),
    );
  }
}