import 'package:flutter/material.dart';
import 'package:labshared_pref/pages/another_page.dart';
import 'package:labshared_pref/pages/first_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Declare your variable for data
  String? myname;
  // Declare your function to load data
  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myname = prefs.getString("myname");
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
    title: const Text(
      "Home Page",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    backgroundColor: Colors.blueAccent, // สีพื้นหลังของ AppBar
    elevation: 4, // ความสูงของเงาใต้ AppBar
    centerTitle: true, // จัดตำแหน่ง Title ให้อยู่กลาง
  ),
  body: SingleChildScrollView(
    padding: const EdgeInsets.all(16.0), // เพิ่ม padding รอบๆ body
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch, // ทำให้ Column ขยายเต็มพื้นที่แนวนอน
      children: [
        // Show Your name
        Text(
          myname ?? "รอสักครู่",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
          textAlign: TextAlign.center, // จัดตำแหน่งข้อความให้อยู่กลาง
        ),
        const SizedBox(height: 30), // เพิ่มช่องว่างระหว่างข้อความและปุ่ม
        // Row to arrange buttons horizontally
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // จัดเรียงปุ่มให้ซ้ายขวา
          children: [
            // Button go to Another Page (Left)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FirstPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // มุมมนของปุ่ม
                ), backgroundColor: Colors.blueAccent, // สีพื้นหลังของปุ่ม
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                elevation: 4, // ความสูงของเงาใต้ปุ่ม
              ),
              child: const Text(
                'Back',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            // Button go to Another Page (Right)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnotherPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // มุมมนของปุ่ม
                ), backgroundColor: Colors.blueAccent, // สีพื้นหลังของปุ่ม
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                elevation: 4, // ความสูงของเงาใต้ปุ่ม
              ),
              child: const Text(
                'Another',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    ),
  ),
);

  }
}
