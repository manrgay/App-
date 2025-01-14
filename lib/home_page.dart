import 'package:flutter/material.dart';
import 'profile_page.dart'; // นำเข้า ProfilePage
import 'custodian_details_page.dart';
import 'chat.dart';
import 'list.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2; // กำหนดค่า default ของ currentIndex
  String _selectedCategory = "All"; // กำหนดหมวดหมู่เริ่มต้นเป็น "All"

  // ฟังก์ชัน _onItemTapped จะเปลี่ยนหน้าเมื่อมีการคลิกที่ไอคอนใน BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatApp()),
      );
    } else if (index == 3) { // กรณีที่กดไอคอน Favorite
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListPage()), // นำทางไป ListPage
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hey, Tawan",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.notifications, color: Colors.black),
                      SizedBox(width: 16.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileScreen()),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          radius: 20.0,
                          child: Icon(Icons.person, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Banner Section

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange.shade500, Colors.red.shade700], // สีไล่ระดับ
                    begin: Alignment.topCenter, // เริ่มต้นจากด้านบน
                    end: Alignment.bottomCenter, // สิ้นสุดที่ด้านล่าง
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dogs And Cats",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Younger siblings and friends",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/5.png',
                      height: 80.0,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
// Search Section



            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search Name",
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Category Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All Dogs And Cats",
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                  Row(
                    children: [
                      _buildCategoryButton("All", _selectedCategory == "All"),
                      SizedBox(width: 8.0),
                      _buildCategoryButton("Dogs", _selectedCategory == "Dogs"),
                      SizedBox(width: 8.0),
                      _buildCategoryButton("Cats", _selectedCategory == "Cats"),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            // Custodian Cards
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: _buildFilteredCustodianCards(),
              ),
            ),
          ],
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

  // ฟังก์ชันสร้างปุ่มหมวดหมู่
  Widget _buildCategoryButton(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = label; // เปลี่ยนหมวดหมู่ที่เลือก
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.grey[300],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }

  // ฟังก์ชันกรองการ์ดตามหมวดหมู่ที่เลือก
  List<Widget> _buildFilteredCustodianCards() {
    List<Map<String, dynamic>> allCustodians = [
      {"name": "Jad Za", "age": "20", "adoptType": "Dog", "price": "300 - 500", "satisfaction": 3, "category": "Dogs"},
      {"name": "Tawan", "age": "20", "adoptType": "Cat", "price": "300 - 500", "satisfaction": 2, "category": "Cats"},
      {"name": "Kay", "age": "20", "adoptType": "Cat And Dog", "price": "300 - 500", "satisfaction": 5, "category": "Dogs"},
    ];

    // กรองข้อมูลตามหมวดหมู่
    List<Map<String, dynamic>> filteredCustodians = allCustodians.where((custodian) {
      if (_selectedCategory == "All") {
        return true;
      } else {
        return custodian["category"] == _selectedCategory;
      }
    }).toList();

    // สร้างการ์ดตามข้อมูลที่กรอง
    return filteredCustodians.map((custodian) {
      return _buildCustodianCard(
        custodian["name"],
        custodian["age"],
        custodian["adoptType"],
        custodian["price"],
        custodian["satisfaction"],
        Colors.orange[100],
      );
    }).toList();
  }

  // ฟังก์ชันสร้างการ์ดของ Custodian
  Widget _buildCustodianCard(
      String name,
      String age,
      String adoptType,
      String price,
      int satisfaction,
      Color? backgroundColor,
      ) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsb94pyWOlMOK29QIIX1NmEVcj7yOaB44aSg&s'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text("Age: $age"),
                Text("Adopt: $adoptType"),
                Text("Price: $price"),
                Row(
                  children: List.generate(
                    5,
                        (index) => Icon(
                      Icons.star,
                      color: index < satisfaction ? Colors.orange : Colors.grey,
                      size: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustodianDetailsPage(
                    name: name,
                    age: age,
                    adoptType: adoptType,
                    price: price,
                    satisfaction: satisfaction,
                    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsb94pyWOlMOK29QIIX1NmEVcj7yOaB44aSg&s', // ใช้ URL ของภาพที่ต้องการ
                  ),
                ),
              );
            },
            child: Text("More", style: TextStyle(color: Colors.orange)),
          ),
        ],
      ),
    );
  }
}
