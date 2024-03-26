import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/screens/chat_page/Logics/functions.dart';
import 'package:flutter_samples/screens/chat_page/char_page.dart';
import 'package:flutter_samples/screens/chat_page/chatpage.dart';
import 'package:intl/intl.dart';
import 'comps/styles.dart';
import 'comps/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Functions.updateAvailability();
    super.initState();
  }

  final firestore = FirebaseFirestore.instance;
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade400,
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade400,
        title: const Text('Flash Chat'),
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                setState(() {
                  open == true ? open = false : open = true;
                });
              },
              icon: Icon(
                open == true ? Icons.close_rounded : Icons.search_rounded,
                size: 30,
              ),
            ),
          )
        ],
      ),
      drawer: ChatWidgets.drawer(context),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Container(
                    margin: const EdgeInsets.all(0),
                    child: Container(
                      color: Colors.indigo.shade400,
                      padding: const EdgeInsets.all(8),
                      height: 160,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 10),
                            child: Text(
                              'Recent Users',
                              style: Styles.h1(),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 80,
                            child: StreamBuilder(
                              stream: firestore.collection('Rooms').snapshots(),
                              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                  return Container();
                                }
                  
                                final data = snapshot.data!.docs.where((element) => element['users'].toString().contains(FirebaseAuth.instance.currentUser!.uid)).toList();
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: data.length,
                                  itemBuilder: (context, i) {
                                    final users = data[i]['users'];
                                    final friend = users.where((element) => element != FirebaseAuth.instance.currentUser!.uid);
                                    final user = friend.isNotEmpty ? friend.first : users.where((element) => element == FirebaseAuth.instance.currentUser!.uid).first;
                  
                                    return FutureBuilder(
                                      future: firestore.collection('doctor').doc(user).get(),
                                      builder: (context, AsyncSnapshot snap) {
                                        if (!snap.hasData || !snap.data!.exists) {
                                          return Container(); // Return an empty container if data doesn't exist
                                        }
                  
                                        final Map<String, dynamic>? doctorData = snap.data!.data() as Map<String, dynamic>?;
                  
                                        if (doctorData == null || !doctorData.containsKey('docName')) {
                                          return Container(); // Return an empty container if data doesn't contain 'docName'
                                        }
                  
                                        return ChatWidgets.circleProfile(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return ChatPage(
                                                    id: user,
                                                    name: doctorData['docName'],
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                          name: doctorData['docName'],
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: Styles.friendsBox(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Text(
                            'Contacts',
                            style: Styles.h1().copyWith(color: Colors.indigo),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: StreamBuilder(
                              stream: firestore.collection('Rooms').snapshots(),
                              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                  return Container();
                                }

                                final data = snapshot.data!.docs.where((element) => element['users'].toString().contains(FirebaseAuth.instance.currentUser!.uid)).toList();
                                return ListView.builder(
                                  itemCount: data.length,
                                  itemBuilder: (context, i) {
                                    final users = data[i]['users'];
                                    final friend = users.where((element) => element != FirebaseAuth.instance.currentUser!.uid);
                                    final user = friend.isNotEmpty ? friend.first : users.where((element) => element == FirebaseAuth.instance.currentUser!.uid).first;

                                    return FutureBuilder(
                                      future: firestore.collection('doctor').doc(user).get(),
                                      builder: (context, AsyncSnapshot snap) {
                                        if (!snap.hasData || !snap.data!.exists) {
                                          return Container(); // Return an empty container if data doesn't exist
                                        }

                                        final Map<String, dynamic>? doctorData = snap.data!.data() as Map<String, dynamic>?;

                                        if (doctorData == null || !doctorData.containsKey('docName')) {
                                          return Container(); // Return an empty container if data doesn't contain 'docName'
                                        }

                                        return ChatWidgets.card(
                                          title: doctorData['docName'],
                                          subtitle: data[i]['last_message'],
                                          time: DateFormat('hh:mm a').format(data[i]['last_message_time'].toDate()),
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return ChatPage(
                                                    id: user,
                                                    name: doctorData['docName'],
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ChatWidgets.searchBar(open),
          ],
        ),
      ),
    );
  }
}
