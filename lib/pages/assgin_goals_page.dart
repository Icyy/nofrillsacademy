import 'package:flutter/material.dart';

class AssignGoalsPage extends StatefulWidget {
  @override
  _AssignGoalsPageState createState() => _AssignGoalsPageState();
}

class _AssignGoalsPageState extends State<AssignGoalsPage> {
  final _goalController = TextEditingController();
  String? selectedEndDate;
  List<Map<String, String>> goals = [];

  void addGoal() {
    if (_goalController.text.isNotEmpty && selectedEndDate != null) {
      setState(() {
        goals.add({
          'goal': _goalController.text,
          'endDate': selectedEndDate!,
        });
        _goalController.clear();
        selectedEndDate = null; // Reset the selected date
      });
    }
  }

  void finishEnrollment(BuildContext context) {
    // Store the goals in the backend (Firebase)
    print('Goals Assigned: $goals');
    Navigator.popUntil(context, ModalRoute.withName('/admin'));
  }

  Future<void> _showAddGoalDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Goal'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _goalController,
                decoration: const InputDecoration(labelText: 'Enter Goal'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );

                  if (pickedDate != null) {
                    setState(() {
                      selectedEndDate = "${pickedDate.toLocal()}"
                          .split(' ')[0]; // Store date in YYYY-MM-DD format
                    });
                  }
                },
                child: Text(selectedEndDate == null
                    ? 'Select End Date'
                    : 'End Date: $selectedEndDate'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                addGoal();
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Assigning goals for ${studentData['firstName']}',
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showAddGoalDialog,
              child: const Text(
                'Add Goal',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 124, 19, 19),
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: goals.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(goals[index]['goal']!),
                      subtitle: Text('End Date: ${goals[index]['endDate']}'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => finishEnrollment(context),
              child: const Text(
                'Finish',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 124, 19, 19),
                  shape:
                      BeveledRectangleBorder(borderRadius: BorderRadius.zero)),
            ),
          ],
        ),
      ),
    );
  }
}
