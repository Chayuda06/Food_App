// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page7 extends StatefulWidget {
  const Page7({super.key, required this.title});

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _Page7State createState() => _Page7State();
}

class _Page7State extends State<Page7> {
  int likeCount = 0;
  int dislikeCount = 0;

  // ฟังก์ชันสำหรับเปิด URL
  void _launchYouTube() async {
    final Uri url = Uri.parse('https://youtu.be/dqKpQhQhyFo?si=TjrKrY9O_v8tdVRF');

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'ไม่สามารถเปิด URL ได้: $url';
    }
  }
  
  
  // ข้อมูลเมนู
  final Map<String, String> menuDetails = {
    'title': 'ลูกตาลลอยแก้ว',
    'image': 'pic/looktal.jpg',
    'description': 'ลูกตาลลอยแก้ว \nทำน้ำเชื่อม: ต้มน้ำกับน้ำตาลทรายจนละลาย ใส่ใบเตยเพิ่มความหอม พักให้เย็น \nจัดเสิร์ฟ: ใส่เนื้อลูกตาลลงถ้วย เติมน้ำเชื่อม และน้ำแข็ง.',
    'price': '60 บาท',
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
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // ปุ่มไปยังหน้าอื่น
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text('ไปหน้าแรก', style: TextStyle(fontSize: screenWidth * 0.04)),
              ),
              const SizedBox(height: 20),

              // แสดงรายละเอียดเมนู
              Text(
                'รายละเอียดเมนู: ${menuDetails['title']}',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Image.asset(
                menuDetails['image']!,
                width: screenWidth * 0.7,
                height: screenWidth * 0.45,
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
                style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.green),
              ),
              const SizedBox(height: 20),

              // การกดถูกใจและไม่ถูกใจ
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.thumb_up, size: screenWidth * 0.07),
                        onPressed: _incrementLike,
                      ),
                      Text('ถูกใจ: $likeCount', style: TextStyle(fontSize: screenWidth * 0.04)),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.thumb_down, size: screenWidth * 0.07),
                        onPressed: _incrementDislike,
                      ),
                      Text('ไม่ถูกใจ: $dislikeCount', style: TextStyle(fontSize: screenWidth * 0.04)),
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
      home: Page7(title: 'หน้าที่7'),
    );
  }
}
