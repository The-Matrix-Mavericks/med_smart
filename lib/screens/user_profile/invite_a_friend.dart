import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InviteAfriend extends StatefulWidget {
  @override
  _InviteAFriendState createState() => _InviteAFriendState();
}

class _InviteAFriendState extends State<InviteAfriend> {
  TextEditingController _emailController = TextEditingController();

  void _sendInvitation() async {
  String email = _emailController.text;
  final response = await http.post(
    Uri.parse('https://your-backend-api.com/api/send-invitation'),
    body: {'email': email},
  );
  if (response.statusCode == 200) {
    print('Invitation sent successfully');
    // Display a success message to the user
  } else {
    print('Failed to send invitation: ${response.body}');
    // Display an error message to the user
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invite a Friend'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter your friend\'s email address:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Friend\'s Email',
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendInvitation,
              child: Text(
                'Send Invitation',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'We\'ll send an invitation to your friend via email.',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}