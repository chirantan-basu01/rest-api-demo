import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String username;
  final String phoneNumber;
  final String email;
  final String city;
  final String zipCode;

  const CustomCard({
    required this.name,
    required this.username,
    required this.phoneNumber,
    required this.email,
    required this.city,
    required this.zipCode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Username: $username', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Phone: $phoneNumber', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Email: $email', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('City: $city', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Zip Code: $zipCode', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
