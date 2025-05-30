import 'package:flutter/material.dart';

class MaintenanceScreen extends StatefulWidget {
  @override
  _MaintenanceScreenState createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> categories = [
    "تنظيف",
    "إصلاح المحرك",
    "كهرباء",
    "الإطارات والعجلات",
    "خدمات أخرى"
  ];

  final List<List<Map<String, String>>> maintenanceServices = [
    [
      {'name': 'غسيل خارجي يدوي', 'price': '50 جنيه'},
      {'name': 'تنظيف داخلي بالمكنسة', 'price': '40 جنيه'},
      {'name': 'تلميع وتشقير', 'price': '150 جنيه'},
    ],
    [
      {'name': 'قراءة ماسح OBD-II', 'price': '30 جنيه'},
      {'name': 'تحليل أداء المحرك', 'price': '50 جنيه'},
      {'name': 'تغيير زيت', 'price': '40 جنيه'},
    ],
    [
      {'name': 'اختبار البطارية', 'price': '90 جنيه'},
      {'name': 'إصلاح بادئ التشغيل', 'price': '180 جنيه'},
      {'name': 'تغيير الدينامو', 'price': '150 جنيه'},
    ],
    [
      {'name': 'تدوير الإطارات', 'price': '70 جنيه'},
      {'name': 'تلميع الجنط', 'price': '60 جنيه'},
      {'name': 'وزن الزوايا', 'price': '100 جنيه'},
    ],
    [
      {'name': 'خدمة التكييف', 'price': '120 جنيه'},
      {'name': 'معالجة الحماية من الصدأ', 'price': '150 جنيه'},
      {'name': 'إزالة الروائح', 'price': '80 جنيه'},
    ],
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // لجعل الاتجاه من اليمين لليسار
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          toolbarHeight: 0,
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Colors.red,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
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
        subtitle: Text("السعر: ${service['price']}",
            style: TextStyle(color: Colors.black54)),
        trailing: Icon(Icons.arrow_back_ios, color: Colors.black54),
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
              Text("السعر: ${service['price']}",
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
                label: Text("تأكيد الخدمة", style: TextStyle(fontSize: 16)),
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${service['name']} تمت إضافتها إلى طلبك!'),
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
