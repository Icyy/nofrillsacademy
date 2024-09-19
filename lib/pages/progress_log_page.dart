import 'package:flutter/material.dart';
import '../pages/models/progress_entry.dart';
import 'package:intl/intl.dart'; // Import this if you want to format dates

class ProgressLogPage extends StatelessWidget {
  final List<ProgressEntry> progressLog;

  const ProgressLogPage({required this.progressLog, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Log'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: progressLog.length,
        itemBuilder: (context, index) {
          var log = progressLog[index];
          return ListTile(
            title: Text('${log.goal} - ${log.progress}'),
            subtitle:
                Text('Date: ${DateFormat('dd-MM-yyyy').format(log.date)}'),
          );
        },
      ),
    );
  }
}
