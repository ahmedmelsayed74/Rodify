import 'package:car_system/CarScreens/car_model.dart';
import 'package:flutter/material.dart';

class OldCarProfilePage extends StatelessWidget {
  final OldCar oldcar;

  const OldCarProfilePage({super.key, required this.oldcar,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: ()=>Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back_outlined,color: Colors.white,),),
        backgroundColor: Colors.black,
        title: Text(
          oldcar.name,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(tag: '${oldcar.name}',child: Image.asset(oldcar.image,fit: BoxFit.fill, height: 200,width: double.infinity,)),
            ..._generateCarDetails(oldcar),
          ],
        ),
      ),
    );
  }

}
IconData _getIconForKey(String key) {
  switch (key.toLowerCase().replaceAll(" ", "")) {
    case "price":
      return Icons.attach_money;
    case "color":
      return Icons.color_lens_outlined;
    case "class":
      return Icons.hotel_class;
    case "fuel":
      return Icons.local_gas_station_outlined;
    case "km":
      return Icons.speed_outlined;
    case "make":
      return Icons.star;
    case "city":
      return Icons.location_city;
    case "model":
      return Icons.directions_car_filled_outlined;
    case "transmission":
      return Icons.motion_photos_auto_outlined;
    case "usedsince":
      return Icons.calendar_today_outlined;
    default:
      return Icons.info_outline;
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

List<Widget> _generateCarDetails(OldCar car) {
  final carDetails = {
  "Price": car.price,
  "KM": car.km,
  "Used Since": car.usedSince,
  "Color": car.color,
  "Class": car.carClass,
  "City": car.city,
  "Fuel": car.fuel,
  "Make": car.make,
  "Model": car.model,
  "Transmission": car.transmission,
  };

  return carDetails.entries.map((entry) {
  if (entry.value == null || entry.value.toString().isEmpty) return SizedBox.shrink();
  return ListTile(
  leading: Icon(
    _getIconForKey(entry.key),
  color: Colors.white,
  ),
  title: Text(
  entry.key,
  style: const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 20,
  ),
  ),
  subtitle: Text(
  entry.value.toString(),
  style: const TextStyle(color: Colors.white),
  ),
  );
  }).toList();
}
