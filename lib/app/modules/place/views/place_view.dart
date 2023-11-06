import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../controllers/place_controller.dart';

class PlaceView extends GetView<PlaceController> {
  const PlaceView({Key? key}) : super(key: key);

  bool get isFavorite => false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: AppBar(
          centerTitle: true,

          leading: IconButton(
            icon: const Icon(Icons.arrow_back_sharp),
            color: Colors.black,
            onPressed: () => Get.back(),
          ),
          flexibleSpace: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/maldives.jpg'),
                      fit: BoxFit.fill)),
            ),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left:30.0),
              child: Row(

                children: [
                  Icon(Icons.visibility,color: Colors.grey[400],),

                  const SizedBox(width: 5,),
                  const Text('',style:
                  TextStyle(fontSize: 15.0, color: Colors.black)),
                  const SizedBox(width: 65,),
                  const Text(
                    'Maldives',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                

                ],
              ),
            ),
 const SizedBox(height: 20,),
            Container(
              width:1000,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(

                  children: [




                    Wrap(
                      runSpacing: 10,

                      children: const [
                        Text(
                          'Description: ',
                          style: TextStyle(

                            fontSize: 17,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.bold,
                          ),

                        ),
                        Text(
                          'The Maldives is a nation of islands , that spans across the equator.',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Comfortaa',

                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,

                        ),
                      ],
                    ),
                    const SizedBox(height: 17,),
                    Row(
                      children: [
                        const Text(
                          'Location: ',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.bold,
                          ),

                        ),
                        TextButton(onPressed: (){}, child:
                        const Text(
                          'view on map',
                          style:TextStyle(
                            fontFamily: 'Comfortaa',
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ))
                      ],

                    ),
                    const SizedBox(height: 15,),
                    Row(
                      children: const [
                        Text(
                          'Governorate: ',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.bold,
                          ),

                        ),
                        Text(
                          'Damascus ',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Comfortaa',

                          ),

                        ),

                      ],
                    ),
                    const SizedBox(height: 25,),
                    Row(
                      children: const [
                        Text(
                          'Type: ',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.bold,
                          ),

                        ),
                        Text(
                          'Coastal ',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Comfortaa',

                          ),

                        ),
                      ],
                    ),
                    const SizedBox(height: 25,),
                    Row(
                      children: const [
                        Text(
                          'Free: ',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.bold,
                          ),

                        ),
                        Icon( Icons.check,
                          color: Colors.green,
                        )

                      ],
                    ),
                    const SizedBox(height: 25,),
                    Row(
                      children: const [
                        Text(
                          'Open hours: ',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.bold,
                          ),

                        ),
                        Text(
                          '24/7 ',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Comfortaa',

                          ),

                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
