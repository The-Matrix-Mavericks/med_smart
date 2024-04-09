import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('General Settings'),
            _buildSwitchTile(
              title: 'Dark Mode',
              subtitle: 'Enable dark mode for a better viewing experience.',
              value: false, // Replace with actual value from preferences
              onChanged: (value) {
                // Add logic to toggle dark mode
              },
            ),
            _buildDivider(),
            _buildSectionTitle('Account Settings'),
            _buildListTile(
              title: 'Edit Profile',
              onTap: () {
                // Add navigation logic to edit profile page
              },
            ),
            _buildDivider(),
            _buildListTile(
              title: 'Change Password',
              onTap: () {
                // Add navigation logic to change password page
              },
            ),
            _buildDivider(),
            _buildSectionTitle('App Information'),
            _buildListTile(
              title: 'About',
              onTap: () {
                // Add navigation logic to about page
              },
            ),
            _buildDivider(),
            _buildListTile(
              title: 'Privacy Policy',
              onTap: () {
                // Add navigation logic to privacy policy page
              },
            ),
            _buildDivider(),
            _buildListTile(
              title: 'Terms of Service',
              onTap: () {
                // Add navigation logic to terms of service page
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildListTile({required String title, required Function onTap}) {
    return ListTile(
      title: Text(title),
      onTap: () => onTap(),
    );
  }

  Widget _buildDivider() {
    return Divider(
      thickness: 1.0,
      height: 20.0,
    );
  }
}