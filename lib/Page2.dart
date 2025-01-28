import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page2 extends StatefulWidget {
  Page2({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int likeCount = 0;
  int dislikeCount = 0;

  // ฟังก์ชันสำหรับเปิด URL
  void _launchYouTube() async {
    final Uri url = Uri.parse('https://youtu.be/PupEj90q4Wk?si=o5oyiKhZvUdyqfWo'); // ใส่ลิงก์ YouTube

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      // ถ้าเปิดลิงก์ไม่ได้ ให้แสดงข้อความแจ้งเตือน
      throw 'ไม่สามารถเปิด URL ได้: $url';
    }
  }

  // ข้อมูลเมนู
  final Map<String, String> menuDetails = {
    'title': 'ก๋วยเตี๋ยว',
    'image': 'pic/noodle.jpg',
    'description': 'ก๋วยเตี๋ยว \n\n ก๋วยเตี๋ยวเป็นอาหารที่นิยมมากในไทย \nมีหลากหลายประเภทตามรสชาติและวิธีการปรุง\nเส้นก๋วยเตี๋ยว, เนื้อสัตว์, ผัก, เครื่องปรุงต่าง ๆ\n1.ต้มเส้นก๋วยเตี๋ยว\n2. ผัดหรือทำน้ำซุป\n3. ใส่เนื้อสัตว์และเส้น',
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
    // ใช้ MediaQuery เพื่อให้เหมาะสมกับขนาดหน้าจอ
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // ปุ่มไปยังหน้าอื่น
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/page3');  // ไปยังหน้า page3
                },
                child: Text('ไปหน้าที่สาม'),
              ),
              SizedBox(height: 20),

              // แสดงรายละเอียดเมนู
              Text(
                'รายละเอียดเมนู: ${menuDetails['title']}',
                style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Image.asset(
                menuDetails['image']!,
                width: screenWidth * 0.7,  // กำหนดความกว้างของภาพให้เหมาะสม
                height: screenWidth * 0.45,  // ความสูงของภาพ
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                'คำอธิบาย: ${menuDetails['description']}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: screenWidth * 0.04),
              ),
              SizedBox(height: 10),
              Text(
                'ราคา: ${menuDetails['price']}',
                style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.green),
              ),
              SizedBox(height: 20),

              // การกดถูกใจและไม่ถูกใจ
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.thumb_up),
                        onPressed: _incrementLike,
                      ),
                      Text('ถูกใจ: $likeCount'),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.thumb_down),
                        onPressed: _incrementDislike,
                      ),
                      Text('ไม่ถูกใจ: $dislikeCount'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              // ปุ่มเปิด YouTube
              ElevatedButton(
                onPressed: _launchYouTube,  // เมื่อกดปุ่มจะเปิด YouTube
                child: Text('เปิด YouTube'),
              ),
              SizedBox(height: 20),
               IconButton(
            icon: Icon(Icons.home),
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page2(title: 'หน้าที่2'),
    );
  }
}
