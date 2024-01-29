import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Config/LocalStorage.dart';

import '../../config/GlobalFunction.dart';

import '../../utils/AppTheme.dart';
import 'Register.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}
class _state extends State<Login>{
  bool passVisibility = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  FocusNode passwordNode=new FocusNode();
  bool loading =false;
  String message="";
  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
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
                Text("تسجيل الدخول",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: AppTheme.primaryColor),),
                SizedBox(height: 5,),
                Form(
                  key: formKey,
                  child: Padding(
                    padding:  EdgeInsets.only(
                      left: MediaQuery.of(context).size.width*.05,
                      right:  MediaQuery.of(context).size.width*.05
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(margin: EdgeInsets.zero,height: MediaQuery.of(context).size.height*.05,color: Colors.white),
                        Text("البريد الالكتروني ",style: TextStyle(color: Colors.black38,fontSize: 12,fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
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
                            controller: username,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("كلمة المرور",style: TextStyle(color: Colors.black38,fontSize: 12,fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.all(Radius.circular(1000)),

                          ),
                          child: TextFormField(

                            onFieldSubmitted: (value){
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            focusNode: passwordNode,
                            obscureText: passVisibility,
                            validator: (value){
                              if(value!.isEmpty){
                                return 'ادخل كلمة المرور';
                              }
                              // else if(loginValdite['Message']=="Password is incorrect.");
                              return null;
                            },
                            style: TextStyle(height: 1),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(right: 15,left: 15,top: 15,bottom: 0),
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
                              hintText: "كلمة المرور",
                              errorStyle: TextStyle(color: Colors.red,fontSize: 12),
                              hintStyle: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 12),
                              suffixIcon:InkWell(
                                child: Container(
                                    height: 15,
                                    child: Icon(passVisibility?Icons.visibility:Icons.visibility_off,color: Colors.black38,)),
                                onTap: (){
                                  setState(() {
                                    passVisibility=!passVisibility;
                                  });
                                },
                              ) ,
                            ),
                            controller: password,
                          ),
                        ),
                        SizedBox(height: 10,),
                        SizedBox(height: 25,),
                      message==""?SizedBox(height:0,): Container(
                         width: w,
                         alignment: Alignment.center,
                         padding: EdgeInsets.only(bottom: 25),
                         child: Text(message,style: TextStyle(fontSize: 13,color: Colors.red),),
                       ),
                        GestureDetector(
                          onTap: ()async{
                            if(formKey.currentState!.validate()){
                              setState((){
                                loading=true;
                              });
                              await FirebaseAuth.instance.signInWithEmailAndPassword(email: username.text, password: password.text).then((value) => {
                                LocalStorage.SaveData("email", username.text),
                                Navigator.pushNamedAndRemoveUntil(context, "/mainPage", (route) => false)
                              }).onError((error, stackTrace) =>{
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
                              color:loading? Colors.black12:AppTheme.primaryColor,
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
                            child: Text("تسجيل الدخول",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),),
                          ),
                        ),
                        SizedBox(height: h*.1,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, GlobalFunction.route(Register()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("ليس لديك حساب؟",style: TextStyle(color: Colors.black45,fontSize:12,fontWeight: FontWeight.bold),),
                              Text("انشاء حساب جديد",style: TextStyle(color:AppTheme.primaryColor,fontSize: 12,fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          width: w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: w*.4,height: 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.black12.withOpacity(.08)
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 150,),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}