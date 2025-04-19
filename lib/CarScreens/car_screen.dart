import 'dart:ui';

import 'package:flutter/material.dart';

import '../data/const_data.dart';
import 'new_car_details.dart';
import 'car_model.dart';
import 'old_car_details.dart';

class CarScreen extends StatefulWidget {
  const CarScreen({super.key});

  @override
  State<CarScreen> createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {

  List<NewCar> newcars = NewCar.fromJsonList(newCars);
  List<OldCar> oldcars = OldCar.fromJsonList(oldCars);

  bool selectedList = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Stack(
            children: [
              Row(
                children: [
                  AnimatedContainer(
                    curve: Curves.easeInOutQuad,
                    duration: Duration(milliseconds: 600),
                    color: selectedList?Colors.black:Colors.white,
                    width: MediaQuery.of(context).size.width*0.5,
                    height: 50,
                  ),
                  AnimatedContainer(
                    curve: Curves.easeInOutQuad,
                    duration: Duration(milliseconds: 600),
                    color: selectedList?Colors.white:Colors.black,
                    width: MediaQuery.of(context).size.width*0.5,
                    height: 50,
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        selectedList = false;
                      });
                    },
                    child: Container(
                      child: Center(child: Text('New',style: TextStyle(color: Colors.white),)),
                      color: Colors.black,
                      width: MediaQuery.of(context).size.width*0.5,
                      height: 47,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        selectedList = true;
                      });
                    },
                    child: Container(
                      color: Colors.black,
                      width: MediaQuery.of(context).size.width*0.5,
                      height: 47,
                      child: Center(child: Text('Used',style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                ],
              ),

            ],
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of items per row
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: selectedList? 4 / 7 : 3 / 5, // Adjust card size ratio
              ),
              itemCount: selectedList?oldcars.length:newcars.length,
              itemBuilder: (context, index) {
                final item;
                if(selectedList){
                  item = oldcars[index];
                }
                else {
                  item = newcars[index];
                }
                return InkWell(
                  onTap: (){
                    if(selectedList){
                      Navigator.of(context).push(MaterialPageRoute(builder: (cxt)=>OldCarProfilePage(oldcar: oldcars[index]),));
                    }
                    else {
                      Navigator.of(context).push(MaterialPageRoute(builder: (cxt)=>NewCarProfilePage(newcar: newcars[index]),));
                    }
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Colors.white,
                    //color: Colors.transparent, // Transparent for blur to show through
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: Hero(
                            tag: item.name,
                            child: Image.asset(
                              item.image!,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            item.name!,
                            style:  const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        selectedList? Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            '${item.km!} KM',
                            style:  const TextStyle(color: Colors.red,fontSize: 16,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ):const SizedBox(),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                '${item.price!} EGP',
                                style:  const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0,left: 10,top: 3),
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: (){},
                                      child: Text('Reserve',style: TextStyle(color: Colors.white),),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined))
                                  ],
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
