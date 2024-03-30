import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/constants/color.dart';
import 'package:flutter_samples/screens/chat_page/Logics/functions.dart';
import 'package:flutter_samples/screens/chat_page/chatpage.dart';
import 'package:flutter_samples/screens/user_health_metrics/utils/data_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: const Text(
            'Chat with Doc',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontFamily: 'Poppins'),
          ),
        ),
        elevation: 0,
        centerTitle: true,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 10.0),
        //     child: IconButton(
        //       onPressed: () {
        //         setState(() {
        //           open == true ? open = false : open = true;
        //         });
        //       },
        //       icon: Icon(
        //         open == true ? Icons.close_rounded : Icons.search_rounded,
        //         size: 30,
        //       ),
        //     ),
        //   )
        // ],
      ),
      // drawer: ChatWidgets.drawer(context),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, right: 20, left: 18, bottom: 15),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, top: 0),
                    decoration: BoxDecoration(
                        color:
                            Color.fromARGB(255, 171, 171, 171).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(25)),
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: double.infinity,
                    child: TextField(
                      onTap: () {
                        setState(() {
                          // open == true ? open = false : open = true;
                          open = !open;
                        });
                      },
                      decoration: InputDecoration(
                          icon: Icon(
                            FontAwesomeIcons.search,
                            color: Colors.grey[600],
                          ),
                          border: InputBorder.none,
                          hintText: "Search Doctor...",
                          hintStyle: textStyle1.copyWith(
                              color: Colors.grey[600], fontSize: 16)),
                    ),
                  ),
                ),
                // SafeArea(
                //   child: Container(
                //     margin: const EdgeInsets.all(0),
                //     child: Container(
                //       // color: Colors.black,
                //       padding: const EdgeInsets.symmetric(horizontal: 12),
                //       height: 125,
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           // const Spacer(),
                //           Padding(
                //             padding: const EdgeInsets.symmetric(
                //                 horizontal: 8.0, vertical: 0),
                //             child: Text(
                //               'Recent Chats',
                //               style: Styles.h1()
                //                   .copyWith(fontSize: 18, color: Colors.black),
                //             ),
                //           ),
                //           Container(
                //             margin: const EdgeInsets.symmetric(vertical: 10),
                //             height: 80,
                //             child: StreamBuilder(
                //               stream: firestore.collection('Rooms').snapshots(),
                //               builder: (context,
                //                   AsyncSnapshot<QuerySnapshot> snapshot) {
                //                 if (!snapshot.hasData) {
                //                   return Container();
                //                 }

                //                 final data = snapshot.data!.docs
                //                     .where((element) => element['users']
                //                         .toString()
                //                         .contains(FirebaseAuth
                //                             .instance.currentUser!.uid))
                //                     .toList();
                //                 return ListView.builder(
                //                   scrollDirection: Axis.horizontal,
                //                   itemCount: data.length,
                //                   itemBuilder: (context, i) {
                //                     final users = data[i]['users'];
                //                     final friend = users.where((element) =>
                //                         element !=
                //                         FirebaseAuth.instance.currentUser!.uid);
                //                     final user = friend.isNotEmpty
                //                         ? friend.first
                //                         : users
                //                             .where((element) =>
                //                                 element ==
                //                                 FirebaseAuth
                //                                     .instance.currentUser!.uid)
                //                             .first;

                //                     return FutureBuilder(
                //                       future: firestore
                //                           .collection('doctor')
                //                           .doc(user)
                //                           .get(),
                //                       builder: (context, AsyncSnapshot snap) {
                //                         if (!snap.hasData ||
                //                             !snap.data!.exists) {
                //                           return Container(); // Return an empty container if data doesn't exist
                //                         }

                //                         final Map<String, dynamic>? doctorData =
                //                             snap.data!.data()
                //                                 as Map<String, dynamic>?;

                //                         if (doctorData == null ||
                //                             !doctorData
                //                                 .containsKey('docName')) {
                //                           return Container(); // Return an empty container if data doesn't contain 'docName'
                //                         }

                //                         return ChatWidgets.circleProfile(
                //                           onTap: () {
                //                             Navigator.of(context).push(
                //                               MaterialPageRoute(
                //                                 builder: (context) {
                //                                   return ChatPage(
                //                                     id: user,
                //                                     name: doctorData['docName'],
                //                                   );
                //                                 },
                //                               ),
                //                             );
                //                           },
                //                           name: doctorData['docName'],
                //                         );
                //                       },
                //                     );
                //                   },
                //                 );
                //               },
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 0),
                    decoration: Styles.friendsBox(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                          child: Text(
                            'Recent Chats',
                            style: Styles.h1().copyWith(
                                color: primaryColor, fontFamily: 'Poppins'),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: StreamBuilder(
                              stream: firestore.collection('Rooms').snapshots(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                  return Container();
                                }
                                final data = snapshot.data!.docs
                                    .where((element) => element['users']
                                        .toString()
                                        .contains(FirebaseAuth
                                            .instance.currentUser!.uid))
                                    .toList();
                                return (data.length == 0)
                                    ? Container(
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/chat.png',
                                                height: 400,
                                              ),
                                              Text(
                                                'No recent chats',
                                                style: Styles.h1().copyWith(
                                                    color: Colors.black54,
                                                    fontFamily: 'Inter',
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                'Search & Chat with doc',
                                                style: Styles.h1().copyWith(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontFamily: 'Poppins'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : ListView.builder(
                                        itemCount: data.length,
                                        itemBuilder: (context, i) {
                                          final users = data[i]['users'];
                                          final friend = users.where(
                                              (element) =>
                                                  element !=
                                                  FirebaseAuth.instance
                                                      .currentUser!.uid);
                                          final user = friend.isNotEmpty
                                              ? friend.first
                                              : users
                                                  .where((element) =>
                                                      element ==
                                                      FirebaseAuth.instance
                                                          .currentUser!.uid)
                                                  .first;

                                          return FutureBuilder(
                                            future: firestore
                                                .collection('doctor')
                                                .doc(user)
                                                .get(),
                                            builder:
                                                (context, AsyncSnapshot snap) {
                                              if (!snap.hasData ||
                                                  !snap.data!.exists) {
                                                return Container(); // Return an empty container if data doesn't exist
                                              }

                                              final Map<String, dynamic>?
                                                  doctorData = snap.data!.data()
                                                      as Map<String, dynamic>?;

                                              if (doctorData == null ||
                                                  !doctorData
                                                      .containsKey('docName')) {
                                                return Container(); // Return an empty container if data doesn't contain 'docName'
                                              }

                                              return ChatWidgets.card(
                                                title: doctorData['docName'],
                                                index: i,
                                                subtitle: data[i]
                                                    ['last_message'],
                                                time: DateFormat('hh:mm a')
                                                    .format(
                                                  data[i]['last_message_time']
                                                      .toDate(),
                                                ),
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return ChatPage(
                                                          id: user,
                                                          name: doctorData[
                                                              'docName'],
                                                          index:i
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
