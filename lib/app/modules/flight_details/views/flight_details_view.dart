import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/flight_details_controller.dart';

class FlightDetailsView extends GetView<FlightDetailsController> {
  const FlightDetailsView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffFF9114),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () => Get.back(),
            ),
          ),

        ),
        body:
        Stack(
            children:[
              Container(
                height: double.infinity,
                width: 500,
                color: Colors.white70,
              ),

              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    color: Color(0xffff9114),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),

                    )
                ),
                child:
                Text(
                  'Book Your Flight',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w800,
                  ),
                ),

              ),
              Positioned(
                  top:110,
                  right: 35,
                  child: Container(

                    width: 330,
                    height: 360,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Emirates Airlines',
                                  style:TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Comfortaa',
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),

                            ],
                          ),
                          SizedBox(height: 30,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Column(

                                children: [
                                  Text(
                                    'Take off',
                                    style:TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Comfortaa',
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(height: 7,),
                                  Text(
                                    '6:00 am',
                                    style:TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(height: 25,),

                                  Text(
                                    'Period',
                                    style:TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Comfortaa',
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(height: 7,),
                                  Text(
                                    '8 hours',
                                    style:TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 120,),
                              Column(

                                children: [
                                  Text(
                                    'Landing',
                                    style:TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Comfortaa',
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(height: 7,),
                                  Text(
                                    '3:00 pm',
                                    style:TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Comfortaa',
                                      fontSize: 17,
                                    ),
                                  ),

                                ],
                              ),

                            ],
                          ),
                          SizedBox(height: 40,),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width:260,
                                height: 60,
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(


                                  ),
                                  value: controller.dropdownValue.value,
                                  icon: const Icon(Icons.keyboard_arrow_down),


                                  items: controller.items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items,
                                      style: TextStyle(
                                        fontSize: 15
                                      ),),
                                    );
                                  }).toList(),

                                  onChanged: (value) {
                                    controller.dropdownValue.value=value as String;
                                  }

                                ),
                              ),
                            ],
                          ),




                        ],
                      ),
                    ),
                  )
              ),

              Positioned(
                  top: 530,
                  right: 35,
                  child: Container(

                    width: 330,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xffff9114),
                      borderRadius: BorderRadius.all(Radius.circular(30)),

                    ),
                    child: MaterialButton(
                      onPressed: (){},
                      child: Text('BOOK NOW',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
              ),
            ]
        )
    );
  }
}
