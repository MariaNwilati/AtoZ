import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_hotels_controller.dart';

class UserHotelsView extends GetView<UserHotelsController> {
  const UserHotelsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (context) => IconButton(
                icon: Icon(Icons.arrow_back),
                color: Color(0xffff9114),
               onPressed: () =>Get.back(),


        ),
          ),

          title: Text(
            'Hotels you stayed at',
            style: TextStyle(
              color: Color(0xffff9114),
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body:
        SingleChildScrollView(
          child:
          Column(
              children: [
                SizedBox(height: 30,),
                ListView.separated(
                  physics:NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index) => buildHotelItem(),
                  itemCount: 7,
                  separatorBuilder:(context,index)=> SizedBox(height: 20,),
                ),
              ]
          ),
        )

    );
  }
  Widget buildHotelItem()=>Column(
    children: [

      ListTile(
        leading: Container(
          //width: 170,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset('assets/images/four-seasons-resort-orlando.jpg'
            ,fit: BoxFit.cover,

          ),
        ),
        title: Text('Four Seasons Hotel',
            style:TextStyle(
                fontSize: 15,
                fontFamily: 'Comfortaa',
                color: Colors.black,
                fontWeight: FontWeight.bold

            )),
        subtitle: Row(
          children: [
            Text('12/1/2022',
              style: TextStyle(
                  fontSize: 15
              ),),
            SizedBox(width: 40,),
            Text('3 Days',style: TextStyle(
                fontSize: 15
            ),)
          ],
        ) ,


      ),
      SizedBox(height: 10,
      ),

      Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Container(
          height: 1,

          color: Colors.grey[300],

        ),
      )

    ],
  );
}
