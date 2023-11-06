import 'package:atoz/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../controllers/flights_list_controller.dart';

class FlightsListView extends GetView<FlightsListController> {

  const FlightsListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffFF9114),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () => Get.back(),
          ),
        ),

      ),
      body:
      SingleChildScrollView(
        child: Column(

          children: [

            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.topLeft,
              width: double.infinity,
              height: 120,
              decoration: const BoxDecoration(
                  color: Color(0xffff9114),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),

                  )
              ),
              child:
              const Text(
                'Flights',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.w800,
                ),
              ),


            ),

            const SizedBox(height: 20),
            Container(width: 350,
              child: ListView.separated(
                physics:const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index) => buildFlightItem(),
                itemCount: 6,
                separatorBuilder:(context,index)=> const SizedBox(height: 20,),
              ),
            ),





          ],
        ),
      ),
    );
  }
  Widget buildFlightItem() =>  Container(

      height: 190,

      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            blurRadius: 7.0,
            // spreadRadius: 0.1,
          ),],


      ),
      child:

      Column(
          children:[

            Padding(
              padding: const EdgeInsets.all(
                30.0,
              ),
              child: Row(
                children: [
                  const Text('06:00 am',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Comfortaa',
                      // decoration: TextDecoration.underline,
                      //fontWeight: FontWeight.bold,

                    ),
                  ),
                  const SizedBox(width: 50,),


                  Image.asset('assets/images/103733_plane_transportation_icon.png'
                    ,

                    width: 40,
                    height: 30,
                    fit: BoxFit.cover,
                  ),

                  const SizedBox(width: 50,),



                  const Text('12:00 am',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Comfortaa',
                      // decoration: TextDecoration.underline,
                      // fontWeight: FontWeight.bold,

                    ),
                  ),

                ],
              ),


            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children:[
                    const Text('Company name',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Comfortaa',

                        // fontWeight: FontWeight.bold,

                      ),
                    ),
                    const SizedBox(width: 95,),
                    const Text('20000sp ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Comfortaa',
                        //fontWeight: FontWeight.bold,
                      ),
                    ),


                  ]
              ),
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () =>Get.toNamed(Routes.FLIGHT_DETAILS),
                  child: const Text('view details',
                    style: TextStyle(
                      color: Color(0xffff9114),
                      fontSize: 15,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),


              ],
            ),
          ]
      ),


  );
}
