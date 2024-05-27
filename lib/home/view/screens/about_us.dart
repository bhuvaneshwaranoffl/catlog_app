import 'package:flutter/material.dart';


class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to Your Company Name!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'At Your Company Name, we are dedicated to...',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Our Mission:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Our mission is to...',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Our Values:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildValue('Integrity',
                    'We believe in honesty and transparency in all our dealings.'),
                _buildValue('Customer Satisfaction',
                    'Ensuring our customers are happy and satisfied is our top priority.'),
                _buildValue('Innovation',
                    'We are constantly seeking new ways to improve and innovate.'),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Our Team:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTeamMember('John Doe', 'CEO'),
                _buildTeamMember('Jane Smith', 'CTO'),
                _buildTeamMember('Emily Johnson', 'Marketing Director'),
                _buildTeamMember('Michael Brown', 'Software Engineer'),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Contact Us:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Email: your.email@example.com',
              style: TextStyle(fontSize: 16.0),
            ),
            const Text(
              'Phone: +1234567890',
              style: TextStyle(fontSize: 16.0),
            ),
            const Text(
              'Address: 123 Main Street, City, Country',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValue(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          description,
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }

  Widget _buildTeamMember(String name, String position) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          position,
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}

