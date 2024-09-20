import 'package:flutter/material.dart';
import 'package:nofrillsacademy/pages/admin_control.dart';
import 'package:nofrillsacademy/pages/assgin_goals_page.dart';
import 'package:nofrillsacademy/pages/enroll_student_page.dart';
import 'package:nofrillsacademy/pages/login_page.dart';
import 'package:nofrillsacademy/pages/signup_page.dart';
import 'package:nofrillsacademy/pages/student_search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'No Frills Academy',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(184, 192, 21, 21)),
          useMaterial3: true,
          fontFamily: 'OpenSans'),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/admin': (context) => AdminDashboard(),
        '/enrollStudent': (context) => EnrollStudentPage(),
        '/assignGoals': (context) => AssignGoalsPage(),
        '/searchStudents': (context) => SearchStudentsPage(),
      },
    );
  }
}
