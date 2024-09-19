import 'package:flutter/material.dart';

class AssignGoalsPage extends StatefulWidget {
  @override
  _AssignGoalsPageState createState() => _AssignGoalsPageState();
}

class _AssignGoalsPageState extends State<AssignGoalsPage> {
  final _goalController = TextEditingController();
  List<String> goals = [];

  void addGoal() {
    if (_goalController.text.isNotEmpty) {
      setState(() {
        goals.add(_goalController.text);
        _goalController.clear();
      });
    }
  }

  void finishEnrollment(BuildContext context) {
    // Store the goals in the backend (Firebase)
    print('Goals Assigned: $goals');
    Navigator.popUntil(context, ModalRoute.withName('/adminDashboard'));
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> studentData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: const Text('Assign Goals')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Assigning goals for ${studentData['firstName']}'),
            TextFormField(
              controller: _goalController,
              decoration: const InputDecoration(labelText: 'Enter Goal'),
            ),
            ElevatedButton(
              onPressed: addGoal,
              child: const Text('Add Goal'),
            ),
            const SizedBox(height: 20),
            ...goals.map((goal) => ListTile(title: Text(goal))).toList(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => finishEnrollment(context),
              child: const Text('Finish'),
            ),
          ],
        ),
      ),
    );
  }
}
