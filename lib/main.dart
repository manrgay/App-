import 'package:flutter/material.dart';
import 'login.dart'; // อย่าลืม import หน้า Login

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(), // ใช้ home แทน login เพื่อกำหนดหน้าแรกของแอป
    );
  }
}
