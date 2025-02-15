import 'package:flutter/material.dart';
import 'Page1.dart';
import 'Page2.dart';
import 'Page3.dart';
import 'Page4.dart';
import 'Page5.dart';
import 'Page6.dart';
import 'Page7.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'แนะนำอาหารและของว่าง',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/page1': (context) => const Page1(title: 'หมูสามชั้นคั่วพริกเกลือ'),
        '/page2': (context) => const Page2(title: 'ก๋วยเตี๋ยว'),
        '/page3': (context) => const Page3(title: 'ส้มตำ'),
        '/page4': (context) => const Page4(title: 'ผัดเผ็ดหน่อไม้'),
        '/page5': (context) => const Page5(title: 'บัวลอย'),
        '/page6': (context) => const Page6(title: 'ไข่นกกระทา'),
        '/page7': (context) => const Page7(title: 'ลูกตาลลอยแก้ว'),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> foodItems = [
    {'image': 'pic/moosamchan.jpg', 'title': 'หมูคั่วพริกเกลือ', 'description': 'หมูสามชั้นฉ่ำ'},
    {'image': 'pic/noodle.jpg', 'title': 'ก๋วยเตี๋ยว', 'description': 'ก๋วยเตี๋ยวหอมๆ'},
    {'image': 'pic/somtum.jpg', 'title': 'ส้มตำ', 'description': 'ส้มตำแซ่บ'},
    {'image': 'pic/padped.jpg', 'title': 'ผัดเผ็ดหน่อไม้', 'description': 'ผัดเผ็ดหน่อไม้สุดจัดจ้าน'},
  ];

  final List<Map<String, String>> snackItems = [
    {'image': 'pic/boaloy.jpg', 'title': 'บัวลอย', 'description': 'บัวลอยสุดอร่อย'},
    {'image': 'pic/kainook.jpg', 'title': 'ไข่นกกระทา', 'description': 'ไข่นกกระทาทอดกรอบ'},
    {'image': 'pic/looktal.jpg', 'title': 'ลูกตาลลอยแก้ว', 'description': 'ลูกตาลลอยแก้วสดชื่น'},
  ];

   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.4; // กำหนดขนาดการ์ดให้กว้าง 40% ของหน้าจอ
    final imageSize = cardWidth * 0.8; // รูปภาพปรับตามขนาดการ์ด

    return Scaffold(
      appBar: AppBar(
        title: const Text('เมนูอาหารและของว่าง'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'อาหารแนะนำ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 230,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  final item = foodItems[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/page${index + 1}');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: SizedBox(
                          width: cardWidth,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                item['image']!,
                                width: imageSize,
                                height: imageSize,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                item['title']!,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['description']!,
                                style: const TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.favorite, color: Colors.red, size: 20),
                                    onPressed: () {
                                      // บันทึกในรายการโปรด
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.share, color: Colors.blue, size: 20),
                                    onPressed: () {
                                      // แชร์เมนูนี้
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'ของว่างแนะนำ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 230,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snackItems.length,
                itemBuilder: (context, index) {
                  final item = snackItems[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/page${index + 5}');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: SizedBox(
                          width: cardWidth,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                item['image']!,
                                width: imageSize,
                                height: imageSize,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                item['title']!,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['description']!,
                                style: const TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.favorite, color: Colors.red, size: 20),
                                    onPressed: () {
                                      // บันทึกในรายการโปรด
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.share, color: Colors.blue, size: 20),
                                    onPressed: () {
                                      // แชร์เมนูนี้
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
