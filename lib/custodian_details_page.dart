import 'package:flutter/material.dart';

class CustodianDetailsPage extends StatelessWidget {
  final String name;
  final String age;
  final String adoptType;
  final String price;
  final int satisfaction;
  final String imageUrl;

  CustodianDetailsPage({
    required this.name,
    required this.age,
    required this.adoptType,
    required this.price,
    required this.satisfaction,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Image Section
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Details Section
            Text(
              "Name: $name",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text("Age: $age"),
            Text("Adopt: $adoptType"),
            Text("Price: $price"),
            SizedBox(height: 8.0),
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
            SizedBox(height: 16.0),
            // Additional Information
            Text(
              "Additional Information: This is a detailed description of the custodian.",
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}