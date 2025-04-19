import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
            _animatedTitle('Welcome to Your Company Name!'),
            const SizedBox(height: 12),
            _animatedText(
                'At Your Company Name, we are dedicated to delivering high-quality solutions that make a real impact.'),
            const SizedBox(height: 24),
            _sectionTitle('Our Mission:'),
            _animatedText(
                'Our mission is to innovate, inspire, and improve lives through our cutting-edge solutions.'),
            const SizedBox(height: 24),
            _sectionTitle('Our Values:'),
            const SizedBox(height: 12),
            _buildValueCard('Integrity',
                'We believe in honesty and transparency in all our dealings.'),
            _buildValueCard('Customer Satisfaction',
                'Ensuring our customers are happy and satisfied is our top priority.'),
            _buildValueCard('Innovation',
                'We are constantly seeking new ways to improve and innovate.'),
            const SizedBox(height: 24),
            _sectionTitle('Our Team:'),
            const SizedBox(height: 12),
            _buildTeamMember('John Doe', 'CEO'),
            _buildTeamMember('Jane Smith', 'CTO'),
            _buildTeamMember('Emily Johnson', 'Marketing Director'),
            _buildTeamMember('Michael Brown', 'Software Engineer'),
            const SizedBox(height: 24),
            _sectionTitle('Contact Us:'),
            const SizedBox(height: 12),
            _animatedText('📧 Email: your.email@example.com'),
            _animatedText('📞 Phone: +1234567890'),
            _animatedText('📍 Address: 123 Main Street, City, Country'),
          ],
        ),
      ),
    );
  }

  Widget _animatedTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
      ),
    ).animate().fade(duration: 500.ms).slideY(begin: 0.2);
  }

  Widget _animatedText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16.0, height: 1.5),
    ).animate().fade(duration: 400.ms);
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      ),
    ).animate().fade(duration: 500.ms).slideX(begin: -0.1);
  }

  Widget _buildValueCard(String title, String description) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.check_circle, color: Colors.green),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(description,
                      style: const TextStyle(fontSize: 14.0, height: 1.4)),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate().fade(duration: 400.ms).slideX(begin: 0.1);
  }

  Widget _buildTeamMember(String name, String position) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.person, color: Colors.white),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(position),
    ).animate().fade(duration: 400.ms).slideX(begin: -0.05);
  }
}
