import 'package:flutter/material.dart';

class HelpAndSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            FAQItem(
              question: 'How do I reset my password?',
              answer:
                  'To reset your password, go to the login screen and click on the "Forgot Password" link. Follow the instructions sent to your email to reset your password.',
            ),
            FAQItem(
              question: 'How do I update my profile information?',
              answer:
                  'To update your profile information, go to the settings screen and click on the "Edit Profile" option. Make the desired changes and save.',
            ),
            FAQItem(
              question: 'How can I contact support?',
              answer:
                  'If you need further assistance or have any other questions, feel free to contact our support team by clicking the button below.',
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                
              },
              child: Text('Contact Support'),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ExpansionTile(
        title: Text(
          widget.question,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        childrenPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        expandedAlignment: Alignment.centerLeft,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.answer),
        ],
      ),
    );
  }
}
