class Student {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? courseDuration;
  bool? assessmentDone;
  List<String> goals;

  Student({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.courseDuration,
    this.assessmentDone = false,
    this.goals = const [],
  });

  // You can also add from/to JSON methods here if you are using Firebase
  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNumber': phoneNumber,
        'courseDuration': courseDuration,
        'assessmentDone': assessmentDone,
        'goals': goals,
      };

  static Student fromJson(Map<String, dynamic> json) => Student(
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        courseDuration: json['courseDuration'],
        assessmentDone: json['assessmentDone'],
        goals: List<String>.from(json['goals']),
      );
}
