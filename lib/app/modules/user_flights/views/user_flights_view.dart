import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_flights_controller.dart';

class UserFlightsView extends GetView<UserFlightsController> {
  const UserFlightsView({Key? key}) : super(key: key);
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
            'Your Flights',
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
                  itemBuilder: (context,index) => buildRestaurantItem(),
                  itemCount: 7,
                  separatorBuilder:(context,index)=> SizedBox(height: 20,),
                ),
              ]
          ),
        )

    );
  }
  Widget buildRestaurantItem()=>Column(
    children: [

      ListTile(
        leading: Container(
          width: 110,


          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset('assets/images/airplane-plane-flight-900.jpg'
            ,fit: BoxFit.cover,

          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Emirates Airlines',
                style:TextStyle(
                    fontSize: 15,
                    fontFamily: 'Comfortaa',
                    color: Colors.black,
                    fontWeight: FontWeight.bold

                )),
            SizedBox(height: 5,),
            Row(
              children: [
                Text('Syria',
                    style:TextStyle(
                      fontSize: 15,
                      fontFamily: 'Comfortaa',
                      color: Colors.black,

                    )),
                SizedBox(width: 40,),
                Text('America',
                    style:TextStyle(
                      fontSize: 15,
                      fontFamily: 'Comfortaa',
                      color: Colors.black,

                    )),
              ],
            ),

          ],
        ),
        subtitle: Row(
          children: [
            Text('12/1/2022',
              style: TextStyle(
                  fontSize: 15
              ),),

            SizedBox(width: 35,),
            Text('800\$',style: TextStyle(
                fontSize: 15
            ),)

          ],
        ) ,


      ),
      SizedBox(height: 20,
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
