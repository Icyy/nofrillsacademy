import 'package:flutter/material.dart';
import 'progress_log_page.dart'; // Adjust import based on your folder structure
import '../pages/models/progress_entry.dart';
import '../pages/models/goal.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
    final List<Goal> goals = [
      Goal('Exercise 30 minutes daily'),
      Goal('Read 20 pages of a book'),
      Goal('Meditate for 10 minutes')
    ];

    final List<ProgressEntry> progressLog = [
      ProgressEntry('Exercise 30 minutes daily', 'Completed', DateTime.now()),
      ProgressEntry('Read 20 pages of a book', 'Completed',
          DateTime.now().subtract(Duration(days: 1))),
      ProgressEntry('Meditate for 10 minutes', 'Incomplete',
          DateTime.now().subtract(Duration(days: 2))),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'No Frills Academy',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: goals.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(goals[index].title),
                    trailing: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        _showAddProgressDialog(context, goals[index].title);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to a page where users can see their progress log
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        ProgressLogPage(progressLog: progressLog),
                  ),
                );
              },
              child: Text('View Progress Log'),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddProgressDialog(BuildContext context, String goal) {
    showDialog(
      context: context,
      builder: (context) {
        String progress = '';
        return AlertDialog(
          title: Text('Add Progress for $goal'),
          content: TextField(
            decoration: InputDecoration(hintText: 'Enter progress'),
            onChanged: (value) {
              progress = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (progress.isNotEmpty) {
                  // Handle progress submission
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
