import 'package:flutter/material.dart';

class SearchDoctorPage extends StatefulWidget {
  const SearchDoctorPage({super.key});

  @override
  State<SearchDoctorPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<SearchDoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Search Doctor Page")),
    );
  }
}
