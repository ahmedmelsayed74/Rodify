import 'package:flutter/material.dart';

class MaintenanceScreen extends StatefulWidget {
  @override
  _MaintenanceScreenState createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> categories = [
    "Cleaning",
    "Engine Repair",
    "Electrical",
    "Tires & Wheels",
    "Other Services"
  ];

  final List<List<Map<String, String>>> maintenanceServices = [
    [
      {'name': 'Exterior Hand Wash', 'price': '50EGP'},
      {'name': 'Interior Vacuuming', 'price': '40EGP'},
      {'name': 'Waxing & Polishing', 'price': '150EGP'},
    ],
    [
      {'name': 'OBD-II Scanner Reading', 'price': '30EGP'},
      {'name': 'Engine Performance Analysis', 'price': '50EGP'},
      {'name': 'Oil Change', 'price': '40EGP'},
    ],
    [
      {'name': 'Battery Testing', 'price': '90EGP'},
      {'name': 'Starter Motor Repair', 'price': '180EGP'},
      {'name': 'Alternator Replacement', 'price': '150EGP'},
    ],
    [
      {'name': 'Tire Rotation', 'price': '70EGP'},
      {'name': 'Rim Polishing', 'price': '60EGP'},
      {'name': 'Wheel Alignment', 'price': '100EGP'},
    ],
    [
      {'name': 'Air Conditioning Service', 'price': '120EGP'},
      {'name': 'Rust Protection Treatment', 'price': '150EGP'},
      {'name': 'Odor Removal', 'price': '80EGP'},
    ],
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 0,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.red,
          labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
          tabs: categories
              .map((category) => Tab(text: category))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(categories.length, (index) {
          return _buildServiceList(maintenanceServices[index]);
        }),
      ),
    );
  }

  Widget _buildServiceList(List<Map<String, String>> services) {
    return ListView.builder(
      padding: EdgeInsets.all(12),
      itemCount: services.length,
      itemBuilder: (context, index) {
        return _buildServiceCard(services[index]);
      },
    );
  }

  Widget _buildServiceCard(Map<String, String> service) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(Icons.car_repair, color: Colors.black),
        title: Text(service['name']!,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        subtitle: Text("Price: ${service['price']}",
            style: TextStyle(color: Colors.black54)),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.black54),
        onTap: () {
          _showServiceDetails(service);
        },
      ),
    );
  }

  void _showServiceDetails(Map<String, String> service) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(service['name']!,
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Price: ${service['price']}",
                  style: TextStyle(color: Colors.red, fontSize: 18)),
              SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                ),
                icon: Icon(Icons.check_circle, color: Colors.white),
                label: Text("Confirm Service", style: TextStyle(fontSize: 16)),
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                      Text('${service['name']} added to your order!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
