import 'package:car_system/AutoPartScreens/patition_screen.dart';
import 'package:flutter/material.dart';

import '../data/const_data.dart';

class AutoPartScreen extends StatelessWidget {
  AutoPartScreen({super.key});

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2 / 3,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if(index == 0){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PartitionScreen(valIndex: 0)),
                    );
                  }
                  else if(index == 1){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PartitionScreen(valIndex: 1)),
                    );
                  }
                  else if(index == 2){

                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PartitionScreen(valIndex: 2)),
                    );
                  }
                  else {

                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PartitionScreen(valIndex: 3)),
                    );

                  }
                },
                child: Card(
                  elevation: 5,
                  child: Stack(
                    children: [
                      Opacity(opacity: 0.5,
                      child: Image.asset(
                        categories[index]['image']!,
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              categories[index]['name']!,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
                            ),
                            Text(
                              categories[index]['description']!,
                              style: TextStyle(fontSize: 13, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
  }
}
