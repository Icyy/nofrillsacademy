import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 124, 19, 19),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome, Admin!',
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 20),
            _buildAdminButton(
              context,
              label: 'Search Existing Students',
              route: '/searchStudents',
            ),
            const SizedBox(height: 20),
            _buildAdminButton(
              context,
              label: 'Enroll New Student',
              route: '/enrollStudent',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdminButton(BuildContext context,
      {required String label, required String route}) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 124, 19, 19),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // No border radius
        ),
        textStyle: const TextStyle(
          fontSize: 18,
          fontFamily: 'OpenSans',
          color: Colors.white,
        ),
      ),
      child: Text(label,
          style: const TextStyle(
            color: Colors.white,
          )),
    );
  }
}
