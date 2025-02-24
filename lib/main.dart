import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://nisqhfnnoajuyhsshzjc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5pc3FoZm5ub2FqdXloc3NoempjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDAzODMwMDQsImV4cCI6MjA1NTk1OTAwNH0.cEe5lfP1NwMo4qPu6BHeaWD4_0U1uqXChfH3MvChU1I',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Homepage(),
    );
  }
}
