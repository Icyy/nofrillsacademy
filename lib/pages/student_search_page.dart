// A basic search page for students
import 'package:flutter/material.dart';

class SearchStudentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Students')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Search by name'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform search logic here
              },
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
