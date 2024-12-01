import 'package:flutter/material.dart';
import 'package:khurapati_ideas/pages/entry_point_page.dart';

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
        theme: ThemeData(
          chipTheme: ChipThemeData(
            backgroundColor: Colors.deepPurple.shade100,
            // Set the background color for the chips
            padding: EdgeInsets.all(8),
            // Set padding inside the chip

            // Text color
            shape: StadiumBorder(side: BorderSide(color: Colors.transparent)),
            // Capsule shape
            elevation: 4,
            // Set elevation
            // shadowColor: Colors.black.withOpacity(0.2), // Shadow color
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: EntryPointPage());
  }
}
