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
        print('Student Enrolled: $firstName $lastName');
        Navigator.pop(context); // Go back to dashboard
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 124, 19, 19),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Enroll a New Student',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField('First Name', (value) => firstName = value),
                const SizedBox(height: 10),
                _buildTextField('Last Name', (value) => lastName = value),
                const SizedBox(height: 10),
                _buildTextField('Email', (value) => email = value,
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(height: 10),
                _buildTextField('Phone Number', (value) => phoneNumber = value,
                    keyboardType: TextInputType.phone),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Select Course Duration',
                    border: OutlineInputBorder(),
                  ),
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
                const SizedBox(height: 10),
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 124, 19, 19),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // No border radius
                    ),
                  ),
                  child: Text(
                    assessmentDone ? 'Next' : 'Finish',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, Function(String?) onSaved,
      {TextInputType? keyboardType}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      keyboardType: keyboardType,
      validator: (value) =>
          value == null || value.isEmpty ? 'Enter $label' : null,
      onSaved: onSaved,
    );
  }
}
