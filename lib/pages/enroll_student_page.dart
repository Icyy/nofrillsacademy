import 'package:flutter/material.dart';

class EnrollStudentPage extends StatefulWidget {
  @override
  _EnrollStudentPageState createState() => _EnrollStudentPageState();
}

class _EnrollStudentPageState extends State<EnrollStudentPage> {
  final _formKey = GlobalKey<FormState>();

  String? firstName, lastName, email, phoneNumber;
  String? selectedCourseDuration;
  bool assessmentDone = false;

  // Method to handle form submission
  void handleNextOrFinish(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // If assessment is done, navigate to goal assignment page
      if (assessmentDone) {
        Navigator.pushNamed(context, '/assignGoals', arguments: {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'phoneNumber': phoneNumber,
          'courseDuration': selectedCourseDuration,
        });
      } else {
        // If assessment is NOT done, directly finish the enrollment
        // Store the data in the backend (Firebase)
        // Your Firebase logic to store student data here

        print('Student Enrolled: $firstName $lastName');
        Navigator.pop(context); // Go back to dashboard
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enroll New Student')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter first name' : null,
                onSaved: (value) => firstName = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Last Name'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter last name' : null,
                onSaved: (value) => lastName = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter email' : null,
                onSaved: (value) => email = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone Number'),
                validator: (value) => value == null || value.isEmpty
                    ? 'Enter phone number'
                    : null,
                onSaved: (value) => phoneNumber = value,
              ),
              DropdownButtonFormField<String>(
                decoration:
                    const InputDecoration(labelText: 'Select Course Duration'),
                value: selectedCourseDuration,
                items: ['Short Term', 'Medium Term', 'Long Term']
                    .map((String course) {
                  return DropdownMenuItem<String>(
                    value: course,
                    child: Text(course),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCourseDuration = newValue;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select course duration' : null,
              ),
              CheckboxListTile(
                title: const Text('Assessment Done?'),
                value: assessmentDone,
                onChanged: (bool? newValue) {
                  setState(() {
                    assessmentDone = newValue!;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => handleNextOrFinish(context),
                child: Text(assessmentDone ? 'Next' : 'Finish'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
