import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page3 extends StatefulWidget {
  Page3({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  int likeCount = 0;
  int dislikeCount = 0;

  // ฟังก์ชันสำหรับเปิด URL
  void _launchYouTube() async {
    final Uri url = Uri.parse('https://youtu.be/fU4eQje2Gxo?si=FnNX_gX_DOjZx7f6'); // ใส่ลิงก์ YouTube

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      // ถ้าเปิดลิงก์ไม่ได้ ให้แสดงข้อความแจ้งเตือน
      throw 'ไม่สามารถเปิด URL ได้: $url';
    }
  }

  // ข้อมูลเมนู
  final Map<String, String> menuDetails = {
    'title': 'ส้มตำ',
    'image': 'pic/somtum.jpg',
    'description': 'ส้มตำ\nส้มตำเป็นอาหารไทยรสจัดที่ได้รับความนิยมอย่างสูงในภาคอีสาน เป็นเมนูที่ผสมผสานรสเปรี้ยว เผ็ด หวาน และเค็มอย่างลงตัว \nจากการโขลกมะละกอสดพร้อมกับพริก กระเทียม และเครื่องปรุงต่างๆ มะละกอสับ,\nน้ำปลา, น้ำตาลปี๊บ, ถั่วฝักยาว, มะเขือเทศ,\n น้ำมะนาว, กุ้งแห้ง (หรือปูเค็ม)',
    'price': '50 บาท',
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
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontSize: screenWidth * 0.045),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // ปุ่มไปยังหน้าอื่น
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/page4');  // ไปยังหน้า page4
                },
                child: Text(
                  'ไปหน้าที่สี่',
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // แสดงรายละเอียดของเมนู
              Text(
                'รายละเอียดเมนู: ${menuDetails['title']}',
                style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenHeight * 0.02),
              Image.asset(
                menuDetails['image']!,
                width: screenWidth * 0.7,  // กำหนดความกว้างของภาพให้เหมาะสม
                height: screenWidth * 0.45,  // ความสูงของภาพ
                fit: BoxFit.cover,
              ),
              SizedBox(height: screenHeight * 0.02),
              
              // Center the description text
              Center(
                child: Text(
                  'คำอธิบาย: ${menuDetails['description']}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'ราคา: ${menuDetails['price']}',
                style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.green),
              ),
              SizedBox(height: screenHeight * 0.03),

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
                  SizedBox(width: screenWidth * 0.1),
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
              SizedBox(height: screenHeight * 0.03),

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
      home: Page3(title: 'หน้าที่3'),
    );
  }
}
