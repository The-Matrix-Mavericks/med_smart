import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _aboutController;
  late TextEditingController _addressController;
  late TextEditingController _ageController;
  late TextEditingController _emailController;
  late TextEditingController _genderController;
  late TextEditingController _heightController;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _professionController;
  late TextEditingController _weightController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _aboutController = TextEditingController();
    _addressController = TextEditingController();
    _ageController = TextEditingController();
    _emailController = TextEditingController();
    _genderController = TextEditingController();
    _heightController = TextEditingController();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _professionController = TextEditingController();
    _weightController = TextEditingController();
    _isLoading = true;
    getUserData();
  }

  @override
  void dispose() {
    _aboutController.dispose();
    _addressController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _genderController.dispose();
    _heightController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _professionController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  Future<void> getUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('user')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .get();
        setState(() {
          _aboutController.text = userDoc['userAbout'];
          _addressController.text = userDoc['userAddress'];
          _ageController.text = userDoc['userAge'];
          _emailController.text = userDoc['userEmail'];
          _genderController.text = userDoc['userGender'];
          _heightController.text = userDoc['userHeight'];
          _nameController.text = userDoc['userName'];
          _phoneController.text = userDoc['userPhone'];
          _professionController.text = userDoc['userProfession'];
          _weightController.text = userDoc['userWeight'];
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> updateUserProfile() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser?.uid).update({
          'userAbout': _aboutController.text,
          'userAddress': _addressController.text,
          'userAge': _ageController.text,
          'userEmail': _emailController.text,
          'userGender': _genderController.text,
          'userHeight': _heightController.text,
          'userName': _nameController.text,
          'userPhone': _phoneController.text,
          'userProfession': _professionController.text,
          'userWeight': _weightController.text,
        });
        // Show success message or navigate to another page
      }
    } catch (e) {
      print('Error updating user profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  TextField(
                    
                    controller: _aboutController,
                    decoration: InputDecoration(labelText: 'About'),
                    
                  ),
                  TextField(
                    controller: _addressController,
                    decoration: InputDecoration(labelText: 'Address'),
                  ),
                  TextField(
                    controller: _ageController,
                    decoration: InputDecoration(labelText: 'Age'),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: _genderController,
                    decoration: InputDecoration(labelText: 'Gender'),
                  ),
                  TextField(
                    controller: _heightController,
                    decoration: InputDecoration(labelText: 'Height'),
                  ),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: 'Phone'),
                  ),
                  TextField(
                    controller: _professionController,
                    decoration: InputDecoration(labelText: 'Profession'),
                  ),
                  TextField(
                    controller: _weightController,
                    decoration: InputDecoration(labelText: 'Weight'),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      updateUserProfile();
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
    );
  }
}
