import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:pls/login.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: ProfileScreen(),
    );
  }
}
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // นำไปสู่หน้าแก้ไขโปรไฟล์
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfileScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // นำไปสู่หน้าตั้งค่า
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // ส่วนข้อมูลส่วนตัว
            Container(
              padding: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange.shade500, Colors.orange.shade50],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // รูปภาพโปรไฟล์
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://example.com/avatar.jpg',
                    ), // เปลี่ยน URL รูปภาพตามต้องการ
                  ),
                  SizedBox(width: 20), // เว้นระยะห่างระหว่างรูปภาพและข้อมูล
                  // ชื่อ และอีเมล
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tawan',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Tawan888@gmail.com',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // เมนูโปรไฟล์
            ProfileMenuItem(
              icon: Icons.location_on,
              title: 'My Address',
              onTap: () {
                // นำไปสู่หน้าที่อยู่
              },
            ),
            ProfileMenuItem(
              icon: Icons.person,
              title: 'Account',
              onTap: () {
                // นำไปสู่หน้าบัญชี
              },
            ),
            ProfileMenuItem(
              icon: Icons.notifications,
              title: 'Notifications',
              onTap: () {
                // นำไปสู่หน้าการแจ้งเตือน
              },
            ),
            ProfileMenuItem(
              icon: Icons.devices,
              title: 'Devices',
              onTap: () {
                // นำไปสู่หน้าจัดการอุปกรณ์
              },
            ),
            ProfileMenuItem(
              icon: Icons.lock,
              title: 'Change Password',
              onTap: () {
                // นำไปสู่หน้าการเปลี่ยนรหัสผ่าน
              },
            ),
            ProfileMenuItem(
              icon: Icons.language,
              title: 'Language',
              onTap: () {
                // นำไปสู่หน้าการตั้งค่าภาษา
              },
            ),
            SizedBox(height: 10),
            // ปุ่มออกจากระบบ
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                icon: Icon(Icons.logout),
                label: Text('Log Out'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 17),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 50), // กำหนดความยาวให้เต็มหน้าจอ
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

// หน้าจอแก้ไขโปรไฟล์ (placeholder)
class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: Center(child: Text('Edit Profile Screen')),
    );
  }
}

// หน้าจอตั้งค่า (placeholder)
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(child: Text('Settings Screen')),
    );
  }
}
