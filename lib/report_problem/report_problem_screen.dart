import 'package:flutter/material.dart';
import 'session_header_section.dart';
import 'problem_type_section.dart';
import 'details_and_upload_section.dart';

class ReportProblemScreen extends StatelessWidget {
  const ReportProblemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Color(0xFF0E216C),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'الإبلاغ عن مشكلة',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SessionHeaderSection(),
            SizedBox(height: 20),
            ProblemTypeSection(),
            SizedBox(height: 20),
            DetailsAndUploadSection(),
          ],
        ),
      ),
    );
  }
}