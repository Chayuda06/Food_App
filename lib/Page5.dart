import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page5 extends StatefulWidget {
  Page5({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  int likeCount = 0;
  int dislikeCount = 0;

  // ฟังก์ชันสำหรับเปิด URL
  void _launchYouTube() async {
    final Uri url = Uri.parse('https://youtu.be/Y174QmkQlKI?si=HYOqOsSw57iESfBc'); // ใส่ลิงก์ YouTube

   if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      // ถ้าเปิดลิงก์ไม่ได้ ให้แสดงข้อความแจ้งเตือน
      throw 'ไม่สามารถเปิด URL ได้: $url';
    }
  }

  // ข้อมูลเมนู
  final Map<String, String> menuDetails = {
    'title': 'บัวลอย',
    'image': 'pic/boaloy.jpg',
    'description': 'บัวลอย\n\n ทำแป้ง: ผสมแป้งข้าวเหนียวกับน้ำ (เติมสีจากธรรมชาติได้) ปั้นเป็นลูกกลมเล็ก \n ต้ม: ต้มในน้ำเดือดจนลอยขึ้น ตักใส่น้ำเย็น. \nทำน้ำกะทิ: ต้มกะทิใส่น้ำตาล เกลือ และใบเตย.จัดเสิร์ฟ: ใส่บัวลอยในน้ำกะทิ ',
    'price': '45 บาท',
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
          padding: EdgeInsets.all(12.0), // ลดระยะห่างทั้งหมดให้เหมาะสม
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // ปุ่มไปยังหน้าอื่น
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/page6');  // ไปยังหน้า page6
                },
                child: Text('ไปหน้าที่หก', style: TextStyle(fontSize: screenWidth * 0.04)),
              ),
              SizedBox(height: 10),

              // แสดงรายละเอียดเมนู
              Text(
                'รายละเอียดเมนู: ${menuDetails['title']}',
                style: TextStyle(
                  fontSize: screenWidth * 0.05, 
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis, // ป้องกันการตัดคำ
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Image.asset(
                menuDetails['image']!,
                width: screenWidth * 0.7,  // ปรับขนาดรูปภาพให้พอดีกับหน้าจอ
                height: screenWidth * 0.45,  // ความสูงของรูปภาพ
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
                        icon: Icon(Icons.thumb_up, size: screenWidth * 0.07),
                        onPressed: _incrementLike,
                      ),
                      Text('ถูกใจ: $likeCount', style: TextStyle(fontSize: screenWidth * 0.04)),
                    ],
                  ),
                  SizedBox(width: 20),
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
      home: Page5(title: 'หน้าที่5'),
    );
  }
}
