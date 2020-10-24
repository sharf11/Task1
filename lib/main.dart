import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:task1/Badge.dart';
import 'package:task1/HomePage.dart';
import 'package:task1/MydrawerUI.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
          primaryColor: Color(0xff49027c),
          fontFamily: 'DinNextRegular',
          accentColor: Color(0xff49027c)),
    )
  );
}
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return HomeState();
  }
}
class HomeState extends State<Home>{
  List<String>slider=["images/slider1.jpg","images/slider3.jpg",];
  List<String>carsType=['images/car1.png','images/car.png','images/car3.jpg','images/car4.jpg'
    ,'images/car5.jpg','images/car6.jpg'];
  List<String>carsMark=['images/mark1.jpg','images/mark2.jpg','images/mark3.jpg',
    'images/mark4.jpg','images/mark5.jpg','images/mark6.jpg'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
             children: [
              Stack(
                overflow:Overflow.visible,
                children: [
                  Container(
                    height:250.0,
                    width: MediaQuery.of(context).size.width,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return new Center(
                          child: Image.asset(
                            slider[index],
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fill,
                            height: 250.0,
                          ),
                        );
                      },
                      autoplay: true,
                      itemCount: slider.length,
                      pagination: new SwiperPagination(
                        builder: new DotSwiperPaginationBuilder(
                            color: Colors.grey,
                            activeColor: Colors.black,
                            size: 0,
                            activeSize: 0),
                      ),
                      control: new SwiperControl(
                        color: Colors.white,
                        iconNext: null,
                        iconPrevious: null,
                      ),
                    )
                  ),
                  /////////////////////////////////////////end slider
                  Container(padding: EdgeInsets.only(top: 15.0,left:15.0,right: 15.0),
                    child: Positioned(
                         child:   Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Badge(child: Icon(Icons.notifications,size: 30.0,color: Colors.black,),
                                value: '2',color: Colors.red,),
                              GestureDetector(onTap: (){
                                Scaffold.of(context).openDrawer();
                              },child: ImageIcon(AssetImage('images/menuicon.png'),color: Colors.black,))
                            ],
                          )),
                  ),

                ],

              ),
              SizedBox(height: 10.0,),
              Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * .02,),
                       width: MediaQuery.of(context).size.width ,
                  child:
                      Text(
                        "تصفح حسب نوع السيارة",
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                  ),
               SizedBox(height: 10.0,),
              Container(
                height: 120.0,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount:carsType.length,
                  shrinkWrap: true,
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                        height: MediaQuery.of(context).size.height * .13,
                        width: MediaQuery.of(context).size.width * .22,
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * .03),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(carsType[index],
                              width: MediaQuery.of(context).size.width * .2,
                              height: MediaQuery.of(context).size.height * .1,
                              fit: BoxFit.fill,
                            ),

                            Text(
                              "bmw",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Divider(height: 5,color: Colors.black12,)

                          ],
                        ),
                      );

                  },
                ),
              ),
               SizedBox(height: 10.0,),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * .02,),
                width: MediaQuery.of(context).size.width ,
                child:
                Text(
                  "تصفح حسب الماركة ",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ),
               SizedBox(height: 10.0,),
              Container(
                height: 60.0,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: carsMark.length,
                  shrinkWrap: true,
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return  Container(margin: EdgeInsets.all(3.0),
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Colors.grey.withOpacity(0.3),width: 1),
                          color: Colors.white
                        ),
                        child:  Image.asset(carsMark[index],
                            width:  50.0,
                            height: 60.0,
                            fit: BoxFit.contain,
                         
                        ),
                      );

                  },
                ),
              ),
               SizedBox(height: 10.0,),
               Container(
                 alignment: Alignment.centerRight,
                 margin: EdgeInsets.only(left:MediaQuery.of(context).size.width * .02 ,
                   right: MediaQuery.of(context).size.width * .02,),
                 width: MediaQuery.of(context).size.width ,
                 child:
                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(
                       "الكل",
                       style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                       textAlign: TextAlign.right,
                     ),
                     Text(
                       "جديد الوكالات",
                       style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                       textAlign: TextAlign.right,
                     ),

                   ],
                 ),
               ),
               SizedBox(height: 10.0,),
             // Divider(height: 5,color: Colors.black12,),
              Container(
                height: 250.0,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return  Container(margin: EdgeInsets.only(left: 10.0,right: 10.0), width: MediaQuery.of(context).size.width * .75,height: 300.0,
                      child: Column(children: [
                              ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),child: Image.asset("images/slider1.jpg",
                                width: MediaQuery.of(context).size.width * .75,
                                height: 200.0,
                                fit: BoxFit.fill,
                              ),),
                        Container(padding: EdgeInsets.only(left: 10.0,right: 10.0),child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          Column(children: [
                            Text('تبدأ من '),
                            Text('1200.0 ك.د ')
                          ],),Text('Audio 8'),
                       ],),height: 50.0,decoration: BoxDecoration(
                      border: Border.all(width: 1.0,color: Colors.black),color: Colors.white,borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                        bottomRight:Radius.circular(10.0))),)
                            ],),
                    )
                         ;

                  },
                ),
              ),
               SizedBox(height: 10.0,),
               Container(width: MediaQuery.of(context).size.width,
                 alignment: Alignment.centerRight,
                 margin: EdgeInsets.only(
                   right: MediaQuery.of(context).size.width * .02,
                 left:  MediaQuery.of(context).size.width * .02,),

                 child:
                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(
                       "الكل",
                       style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                       textAlign: TextAlign.right,
                     ),
                     Text(
                       "فيديو",
                       style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                       textAlign: TextAlign.right,
                     ),

                   ],
                 ),
               ),
               SizedBox(height: 10.0,),
               Container(
                 height: 250.0,
                 width: MediaQuery.of(context).size.width,
                 child: ListView.builder(
                   itemCount: 5,
                   shrinkWrap: true,
                   primary: false,
                   scrollDirection: Axis.horizontal,
                   itemBuilder: (context, index) {
                     return  Container(margin: EdgeInsets.only(left: 10.0,right: 10.0), width: MediaQuery.of(context).size.width * .75,height: 300.0,
                       child: Column(children: [
                         ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),
                             topRight: Radius.circular(10.0)),child: Image.asset("images/slider1.jpg",
                           width: MediaQuery.of(context).size.width * .75,
                           height: 200.0,
                           fit: BoxFit.fill,
                         ),),
                         Container(padding: EdgeInsets.only(left: 10.0,right: 10.0),child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                           Column(children: [
                             Text('تبدأ من '),
                             Text('1200.0 ك.د ')
                           ],),Text('Audio 8'),
                         ],),height: 50.0,decoration: BoxDecoration(
                             border: Border.all(width: 1.0,color: Colors.black),color: Colors.white,borderRadius: BorderRadius.only(
                             bottomLeft: Radius.circular(10.0),
                             bottomRight:Radius.circular(10.0))),)
                       ],),
                     )
                     ;

                   },
                 ),
               ),
               SizedBox(height: 10.0,),
            ],
          )
        ),
        endDrawer: MydrawerUI(),
      ),
    );
  }
}