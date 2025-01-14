import 'package:flutter/material.dart';
import 'profile_page.dart'; // นำเข้า ProfilePage
import 'chat.dart';
import 'home_page.dart';

void main() {
  runApp(ListPage());
}

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DepositListPage(),
    );
  }
}

class DepositListPage extends StatefulWidget {
  @override
  _DepositListPageState createState() => _DepositListPageState();
}

class _DepositListPageState extends State<DepositListPage> {
  int _currentIndex = 0; // เก็บสถานะของ BottomNavigationBar

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // อัปเดตสถานะของแท็บ
    });

    // เพิ่มการนำทางตามแท็บที่เลือก
    if (index == 0) {
      // เพิ่มหน้าอื่นๆตามที่ต้องการ
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatApp()),
      );
      // เพิ่มการนำทางสำหรับหน้าแชท
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      // เพิ่มการนำทางสำหรับหน้าโฮม
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
      // เพิ่มการนำทางสำหรับหน้าที่ชอบ
      // เพิ่มการนำทางสำหรับหน้าโปรไฟล์
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deposit List'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // User Info Card
              Card(
                color: Colors.orange.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey.shade300,
                            child: Icon(Icons.person, size: 30),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jadsada',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Jad888@gmail.com'),
                              Text('Phone: 088 888 8888'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Deposit Cards
              DepositCard(
                name: 'Dog (Robot)',
                gender: 'Boy',
                age: '3 years',
                phone: '099 999 9999',
                pickupDate: '24 07 2568',
                disease: 'fever',
                backgroundColor: Colors.orange.shade100,
              ),
              DepositCard(
                name: 'Cat (cater)',
                gender: 'Girl',
                age: '3 years',
                phone: '099 999 9999',
                pickupDate: '24 07 2568',
                disease: 'fever',
                backgroundColor: Colors.grey.shade300,
              ),
              DepositCard(
                name: 'Cat (kitty)',
                gender: 'Girl',
                age: '3 years',
                phone: '099 999 9999',
                pickupDate: '24 07 2568',
                disease: 'fever',
                backgroundColor: Colors.blue.shade100,
              ),
              DepositCard(
                name: 'Cat (Marja)',
                gender: 'Girl',
                age: '3 years',
                phone: '099 999 9999',
                pickupDate: '24 07 2568',
                disease: 'fever',
                backgroundColor: Colors.purple.shade100,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // แสดงแท็บที่เลือก
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped, // เมื่อคลิกที่แต่ละไอคอน
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""), // ไอคอนโปรไฟล์
        ],
      ),
    );
  }
}

class DepositCard extends StatelessWidget {
  final String name;
  final String gender;
  final String age;
  final String phone;
  final String pickupDate;
  final String disease;
  final Color backgroundColor;

  const DepositCard({
    required this.name,
    required this.gender,
    required this.age,
    required this.phone,
    required this.pickupDate,
    required this.disease,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey.shade300,
                  child: Icon(Icons.pets, size: 60),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: $name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Gender: $gender'),
                    Text('Age: $age'),
                    Text('Phone: $phone'),
                    Text('Pick up date: $pickupDate'),
                    Text('Disease: $disease'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
