// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutterproject/screens/signup_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // Initialize Supabase client
  Supabase.initialize(
    url: 'https://mjqgepurgeexmhqzjrro.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1qcWdlcHVyZ2VleG1ocXpqcnJvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTI2MDEyNzQsImV4cCI6MjAyODE3NzI3NH0.4ZLdJDEZLjAyJPhM6aCwy7RtOyw8B93O0_KS3e_9Nv0',
    debug: true, // Set to false in production
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpScreen(),
      debugShowCheckedModeBanner: false
    );
  }
}

