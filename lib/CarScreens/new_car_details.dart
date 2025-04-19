import 'package:car_system/CarScreens/car_model.dart';
import 'package:flutter/material.dart';

class NewCarProfilePage extends StatelessWidget {
  final NewCar newcar;

  const NewCarProfilePage({super.key, required this.newcar,});

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
          newcar.name,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(tag: '${newcar.name}',child: Image.asset(newcar.image,fit: BoxFit.fill, height: 200,width: double.infinity,)),
            ..._generateCarDetails(newcar),
          ],
        ),
      ),
    );
  }

  List<Widget> _generateCarDetails(NewCar car) {
    final carDetails = {
      "Price": car.price,
      "Warranty": car.warranty,
      "Engine Capacity": car.engineCapacity,
      "Horse Power": car.horsePower,
      "Maximum Speed": car.maximumSpeed,
      "Acceleration": car.acceleration,
      "Speeds": car.speeds,
      "Transmission Type": car.transmissionType,
      "Year": car.year,
      "Fuel": car.fuel,
      "Fuel Consumption": car.fuelConsumption,
      "Origin Country": car.originCountry,
      "Assembly Country": car.assemblyCountry,
      "Length": car.length,
      "Width": car.width,
      "Height": car.height,
      "Ground Clearance": car.groundClearance,
      "Wheel Base": car.wheelBase,
      "Trunk Size": car.trunkSize,
      "Seats": car.seats,
      "Traction Type": car.tractionType,
      "Number of Cylinders": car.numberOfCylinders,
      "Fuel Tank Capacity": car.fuelTankCapacity,
      "Torque": car.torque,
      "Insurance Price": car.insurancePrice,
      "Register Price": car.registerPrice,
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

  IconData _getIconForKey(String key) {
    switch (key.toLowerCase().replaceAll(" ", "")) {
      case "price":
        return Icons.attach_money;
      case "warranty":
        return Icons.shield_outlined;
      case "enginecapacity":
        return Icons.engineering_outlined;
      case "horsepower":
        return Icons.speed_outlined;
      case "maximumspeed":
        return Icons.directions_car_outlined;
      case "acceleration":
        return Icons.flash_on_outlined;
      case "speeds":
        return Icons.settings_outlined;
      case "transmissiontype":
        return Icons.swap_horiz_outlined;
      case "year":
        return Icons.calendar_today_outlined;
      case "fuel":
        return Icons.local_gas_station_outlined;
      case "fuelconsumption":
        return Icons.eco_outlined;
      case "origincountry":
      case "assemblycountry":
        return Icons.public_outlined;
      case "length":
      case "width":
      case "height":
      case "groundclearance":
        return Icons.straighten_outlined;
      case "wheelbase":
        return Icons.track_changes_outlined;
      case "trunksize":
        return Icons.luggage_outlined;
      case "seats":
        return Icons.event_seat_outlined;
      case "tractiontype":
        return Icons.drive_eta_outlined;
      case "numberofcylinders":
        return Icons.circle_outlined;
      case "fueltankcapacity":
        return Icons.propane_tank_outlined;
      case "torque":
        return Icons.build_outlined;
      case "insuranceprice":
      case "registerprice":
        return Icons.attach_money_outlined;
      default:
        return Icons.info_outlined;
    }
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
