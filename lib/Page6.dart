import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page6 extends StatefulWidget {
  Page6({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _Page6State createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  int likeCount = 0;
  int dislikeCount = 0;

  // ฟังก์ชันสำหรับเปิด URL
  void _launchYouTube() async {
    final Uri url = Uri.parse('https://youtu.be/gLQJ7pWnzts?si=J_2zN85QoPPxUVTK'); // ใส่ลิงก์ YouTube

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      // ถ้าเปิดลิงก์ไม่ได้ ให้แสดงข้อความแจ้งเตือน
      throw 'ไม่สามารถเปิด URL ได้: $url';
    }
  }

  // ข้อมูลเมนูแรก
  final Map<String, String> menuDetails = {
    'title': 'ไข่นกกระทา',
    'image': 'pic/kainook.jpg',
    'description': 'ไข่นกกระทาทอด\n\nวิธีทำ\nเตรียมแป้ง: บดมันเทศให้ละเอียด ผสมกับแป้งมัน, แป้งข้าวเจ้า, น้ำตาล, เกลือ, ผงฟู และกะทิ นวดจนเนียน.\nปั้น: ปั้นแป้งเป็นลูกกลมขนาดพอดีคำ.\nทอด: ตั้งน้ำมันไฟกลาง ทอดจนเหลืองกรอบ ตักพักให้สะเด็ดน้ำมัน',
    'price': '30 บาท',
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
    // ใช้ MediaQuery เพื่อให้ขนาดหน้าจอปรับตัว
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.04), // กำหนดระยะห่างตามหน้าจอ
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // ปุ่มไปยังหน้าอื่น
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/page7');
              },
              child: Text('ไปหน้าที่เจ็ด', style: TextStyle(fontSize: screenWidth * 0.04)),
            ),
            SizedBox(height: screenWidth * 0.04),

            // แสดงรายละเอียดของเมนู
            Text(
              'รายละเอียดเมนู: ${menuDetails['title']}',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenWidth * 0.02),
            Image.asset(
              menuDetails['image']!,
              width: screenWidth * 0.7,
              height: screenWidth * 0.45,
              fit: BoxFit.cover,
            ),
            SizedBox(height: screenWidth * 0.02),
            Text(
              'คำอธิบาย: ${menuDetails['description']}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            SizedBox(height: screenWidth * 0.02),
            Text(
              'ราคา: ${menuDetails['price']}',
              style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.green),
            ),
            SizedBox(height: screenWidth * 0.05),

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
            SizedBox(height: screenWidth * 0.05),

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
      )
    ;
  }
}
// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page6(title: 'หน้าที่6'),
    );
  }
}
