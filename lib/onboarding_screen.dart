import 'package:flutter/material.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // بيانات المقدمة
  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/SSimage/s1.png",
      "title": "اكتشف السيارات",
      "description": "استكشف مجموعة متنوعة من السيارات المصممة لتناسب تفضيلاتك."
    },
    {
      "image": "assets/SSimage/s2.png",
      "title": "قارن المواصفات",
      "description": "قارن بين المواصفات وابحث عن السيارة المثالية لك."
    },
    {
      "image": "assets/SSimage/s3.png",
      "title": "احجز بسهولة",
      "description": "احجز السيارة التي تريدها ببضع نقرات فقط."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality( // لجعل المحتوى يعرض من اليمين إلى اليسار
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (cxt) => LoginScreen()));
              },
              child: Text('تخطي', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                final data = _onboardingData[index];
                return boardingScreen(context,
                  [
                    // صورة المقدمة
                    Image.asset(
                      width: MediaQuery.of(context).orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.width
                          : MediaQuery.of(context).size.width * 0.3,
                      data["image"]!,
                      height: MediaQuery.of(context).size.height * 0.55,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 40),
                    // عنوان المقدمة
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data["title"]!,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        // وصف المقدمة
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Text(
                            data["description"]!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            // مؤشر النقاط
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _onboardingData.length,
                      (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 10,
                    width: _currentIndex == index ? 20 : 10,
                    decoration: BoxDecoration(
                      color: _currentIndex == index ? Colors.cyanAccent : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            // زر "التالي" أو "هيا نبدأ"
            Positioned(
              bottom: 40,
              left: 20,
              child: ElevatedButton(
                onPressed: () {
                  if (_currentIndex == _onboardingData.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  } else {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text(
                  _currentIndex == _onboardingData.length - 1
                      ? "هيا نبدأ"
                      : "التالي",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget boardingScreen(BuildContext context, List<Widget> x) {
  return OrientationBuilder(
    builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        return Row(
          children: x,
        );
      } else {
        return Column(
          children: x,
        );
      }
    },
  );
}
