// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key, required this.title});

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int likeCount = 0;
  int dislikeCount = 0;

  void _launchYouTube() async {
    final Uri url = Uri.parse('https://youtu.be/f9_Uhxgb_Aw?si=mUo_6n41WT0IoK4Q'); // ใส่ลิงก์ YouTube

     if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      // ถ้าเปิดลิงก์ไม่ได้ ให้แสดงข้อความแจ้งเตือน
      throw 'ไม่สามารถเปิด URL ได้: $url';
    }
  }

  // ข้อมูลเมนู
  final Map<String, String> menuDetails = {
    'title': 'หมูคั่วพริกเกลือ',
    'image': 'pic/moosamchan.jpg',
    'description': 'หมูสามชั้นคั่วพริกเกลือ  \n\n หมูสามชั้นคั่วพริกเกลือเป็นอาหารไทยที่มีรสชาติเปรี้ยว เค็ม หวาน และเผ็ด คลุกเคล้าไปกับพริกและเกลืออย่างลงตัว\n หมูสามชั้น, พริก, กระเทียม, น้ำตาล, น้ำปลา หั่นหมูสามชั้น\n2. คั่วพริกเกลือ\n3. ผัดให้เข้ากัน',
    'price': '65 บาท',
  };

  void _incrementLike() {
    setState(() {
      likeCount++;
    });
  }

  void _incrementDislike() {
    setState(() {
      dislikeCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ใช้ MediaQuery เพื่อให้เหมาะสมกับขนาดหน้าจอ
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // ปุ่มไปยังหน้าอื่น
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/page2');  // ไปยังหน้า page2
                },
                child: const Text('ไปหน้าที่สอง'),
              ),
              const SizedBox(height: 20),

              // แสดงรายละเอียดเมนู
              Text(
                'รายละเอียดเมนู: ${menuDetails['title']}',
                style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Image.asset(
                menuDetails['image']!,
                width: screenWidth * 0.7,  // กำหนดความกว้างของภาพให้เหมาะสม
                height: screenWidth * 0.45,  // ความสูงของภาพ
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              Text(
                'คำอธิบาย: ${menuDetails['description']}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: screenWidth * 0.04),
              ),
              const SizedBox(height: 10),
              Text(
                'ราคา: ${menuDetails['price']}',
                style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.green),
              ),
              const SizedBox(height: 20),

              // การกดถูกใจและไม่ถูกใจ
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.thumb_up),
                        onPressed: _incrementLike,
                      ),
                      Text('ถูกใจ: $likeCount'),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.thumb_down),
                        onPressed: _incrementDislike,
                      ),
                      Text('ไม่ถูกใจ: $dislikeCount'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // ปุ่มเปิด YouTube
              ElevatedButton(
                onPressed: _launchYouTube,  // เมื่อกดปุ่มจะเปิด YouTube
                child: const Text('เปิด YouTube'),
              ),
              const SizedBox(height: 20),
               IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/');  // กลับไปหน้าหลัก
            },
          ),
            ],
          ),
        ),
      ),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page1(title: 'หน้าแรก'),
    );
  }
}