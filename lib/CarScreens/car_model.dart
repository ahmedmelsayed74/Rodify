import 'dart:convert';

class NewCar {
  String price;
  String name;
  String image;
  String warranty;
  String engineCapacity;
  String horsePower;
  String maximumSpeed;
  String acceleration;
  String speeds;
  String transmissionType;
  int year;
  String fuel;
  String fuelConsumption;
  String originCountry;
  String assemblyCountry;
  String length;
  String width;
  String height;
  String groundClearance;
  String wheelBase;
  String trunkSize;
  int seats;
  String tractionType;
  int numberOfCylinders;
  String fuelTankCapacity;
  String torque;
  String insurancePrice;
  String registerPrice;

  NewCar({
    required this.price,
    required this.name,
    required this.image,
    required this.warranty,
    required this.engineCapacity,
    required this.horsePower,
    required this.maximumSpeed,
    required this.acceleration,
    required this.speeds,
    required this.transmissionType,
    required this.year,
    required this.fuel,
    required this.fuelConsumption,
    required this.originCountry,
    required this.assemblyCountry,
    required this.length,
    required this.width,
    required this.height,
    required this.groundClearance,
    required this.wheelBase,
    required this.trunkSize,
    required this.seats,
    required this.tractionType,
    required this.numberOfCylinders,
    required this.fuelTankCapacity,
    required this.torque,
    required this.insurancePrice,
    required this.registerPrice,
  });

  // Factory constructor to create a Car object from JSON
  factory NewCar.fromJson(Map<String, dynamic> json) {
    return NewCar(
      price: json['price'],
      name: json['name'],
      image: json['image'],
      warranty: json['warranty'],
      engineCapacity: json['engineCapacity'],
      horsePower: json['horsePower'],
      maximumSpeed: json['maximumSpeed'],
      acceleration: json['acceleration'],
      speeds: json['speeds'],
      transmissionType: json['transmissionType'],
      year: json['year'],
      fuel: json['fuel'],
      fuelConsumption: json['fuelConsumption'],
      originCountry: json['originCountry'],
      assemblyCountry: json['assemblyCountry'],
      length: json['length'],
      width: json['width'],
      height: json['height'],
      groundClearance: json['groundClearance'],
      wheelBase: json['wheelBase'],
      trunkSize: json['trunkSize'],
      seats: json['seats'],
      tractionType: json['tractionType'],
      numberOfCylinders: json['numberOfCylinders'],
      fuelTankCapacity: json['fuelTankCapacity'],
      torque: json['torque'],
      insurancePrice: json['insurancePrice'],
      registerPrice: json['registerPrice'],
    );
  }

  // Method to convert a Car object to JSON
  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'name': name,
      'image': image,
      'warranty': warranty,
      'engineCapacity': engineCapacity,
      'horsePower': horsePower,
      'maximumSpeed': maximumSpeed,
      'acceleration': acceleration,
      'speeds': speeds,
      'transmissionType': transmissionType,
      'year': year,
      'fuel': fuel,
      'fuelConsumption': fuelConsumption,
      'originCountry': originCountry,
      'assemblyCountry': assemblyCountry,
      'length': length,
      'width': width,
      'height': height,
      'groundClearance': groundClearance,
      'wheelBase': wheelBase,
      'trunkSize': trunkSize,
      'seats': seats,
      'tractionType': tractionType,
      'numberOfCylinders': numberOfCylinders,
      'fuelTankCapacity': fuelTankCapacity,
      'torque': torque,
      'insurancePrice': insurancePrice,
      'registerPrice': registerPrice,
    };
  }

  // Static method to parse a list of Car objects from JSON
  static List<NewCar> fromJsonList(String jsonData) {
    final data = json.decode(jsonData) as List;
    return data.map((item) => NewCar.fromJson(item)).toList();
  }

  // Static method to convert a list of Car objects to JSON
  static String toJsonList(List<NewCar> cars) {
    final data = cars.map((car) => car.toJson()).toList();
    return json.encode(data);
  }
}


class OldCar {
  String price;
  String name;
  String image;
  String make;
  String model;
  String carClass;
  String usedSince;
  String km;
  String transmission;
  String city;
  String color;
  String fuel;

  OldCar({
    required this.price,
    required this.name,
    required this.image,
    required this.make,
    required this.model,
    required this.carClass,
    required this.usedSince,
    required this.km,
    required this.transmission,
    required this.city,
    required this.color,
    required this.fuel,
  });

  // Factory constructor to create an OldCar object from JSON
  factory OldCar.fromJson(Map<String, dynamic> json) {
    return OldCar(
      price: json['price'],
      name: json['name'],
      image: json['image'],
      make: json['make'],
      model: json['model'],
      carClass: json['class'],
      usedSince: json['usedSince'],
      km: json['km'],
      transmission: json['transmission'],
      city: json['city'],
      color: json['color'],
      fuel: json['fuel'],
    );
  }

  // Method to convert an OldCar object to JSON
  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'name': name,
      'image': image,
      'make': make,
      'model': model,
      'class': carClass,
      'usedSince': usedSince,
      'km': km,
      'transmission': transmission,
      'city': city,
      'color': color,
      'fuel': fuel,
    };
  }

  // Static method to parse a list of OldCar objects from JSON
  static List<OldCar> fromJsonList(String jsonData) {
    final data = json.decode(jsonData) as List;
    return data.map((item) => OldCar.fromJson(item)).toList();
  }

  // Static method to convert a list of OldCar objects to JSON
  static String toJsonList(List<OldCar> cars) {
    final data = cars.map((car) => car.toJson()).toList();
    return json.encode(data);
  }
}
