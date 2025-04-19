import 'package:flutter/material.dart';

import '../data/const_data.dart';

class PartitionScreen extends StatelessWidget {
  int valIndex;
  PartitionScreen({required this.valIndex});
  List<List <List<Map<String, String>>>> l1 = [
    engineRepairs,
    carCleaningServices,
    carSafetyServices,
    carElectronicsServices,
  ];
  List<String> appbarTitle = [
    'Engine Services',
    'Cleaning Services',
    'Safety Services',
    'Electronics Services',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.black,
        title: Text(appbarTitle[valIndex],style: TextStyle(color: Colors.white),),
      ),
      body: ListView.builder(
        itemCount: l1[valIndex].length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            margin: EdgeInsets.all(8.0),
            child: ExpansionTile(
              backgroundColor: Colors.white,
              title: Text(
                _getCategoryName(valIndex,index), // Get the category name
                style: TextStyle(color:Colors.black,fontSize: 18, fontWeight: FontWeight.bold),
              ),
              children: l1[valIndex][index].map((repair) {
                return ListTile(
                  tileColor: Colors.white,
                  onTap: (){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${repair['name']} was added')));
                  },
                  title: Text(repair['name']!,style: TextStyle(color: Colors.black,)), // Repair Name
                  subtitle: Text('Price: ${repair['price']}',style: TextStyle(color: Colors.black,)), // Price
                  leading: Icon(Icons.build,color: Colors.black,), // Optional: Add an icon to the left
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  // Helper method to get category name based on index
  String _getCategoryName(int l,int index) {
    switch (l) {
      case 0:
        return getCleaningCategoryName(index);
      case 1:
        return getCategoryName(index);
      case 2:
        return getSafetyCategoryName(index);
      default:
        return getElectronicsCategoryName(index);
    }
  }
}