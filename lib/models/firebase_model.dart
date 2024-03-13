// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class UserModel {
//   final String uid;
//   final String userName;
//   final String userAbout;
//   final String userAddress;
//   final String userGender;
//   final String userPhone;
//   final String userAge;
//   final String userWeight;
//   final String userHeight;
//   final String userProfession;

//   UserModel(
//       {required this.uid,
//       required this.userName,
//       required this.userAbout,
//       required this.userAddress,
//       required this.userGender,
//       required this.userPhone,
//       required this.userAge,
//       required this.userWeight,
//       required this.userHeight,
//       required this.userProfession});

//   factory UserModel.fromFirestore(User user) {
//     Future<DocumentSnapshot<Map<String, dynamic>>> user =
//         FirebaseFirestore.instance.collection('user').doc().get();
//     return UserModel(
//       uid: FirebaseAuth.instance.currentUser!.uid,
//       userName: user['userName'] ?? "",
//       userAbout: userAbout,
//       userAddress: userAddress,
//       userGender: userGender,
//       userPhone: userPhone,
//       userAge: userAge,
//       userWeight: userWeight,
//       userHeight: userHeight,
//       userProfession: userProfession,
//     );
//   }
// }

// // class UserModel {
// //   final String docId;
// //   final bool hasRequest;
// //   final String rideCollectionId;
// //   final String vehicleTypeId;
// //   final double corporationRate;
// //   final double driverRate;
// //   final double driverInsurance;
// //   final double passengerInsurance;
// //   final List startUpCharge;
// //   final double waitingCharge;
// //   final double normalCharge;

// //   UserModel({required this.docId, this.hasRequest, this.rideCollectionId,this.vehicleTypeId, this.corporationRate, this.driverRate, this.driverInsurance, this.passengerInsurance, this.startUpCharge, this.waitingCharge, this.normalCharge});

//   // factory UserModel.fromFirestore(DocumentSnapshot doc) {
//   //   var data = doc.data;

// //     return UserModel(
// //         docId: data['docId'],
// //         hasRequest: data['hasRequest'],
// //         rideCollectionId: data['rideCollectionId'],
// //         vehicleTypeId: data['tripDetails']['vehicleType']['vehicleTypeId'],
// //         corporationRate: data['tripDetails']['vehicleType']['corporation'].toDouble()??0.0,
// //         driverRate: data['tripDetails']['vehicleType']['driver'].toDouble()??0.0,
// //         driverInsurance: data['tripDetails']['vehicleType']['driverInsurance'].toDouble()??0.0,
// //         passengerInsurance: data['tripDetails']['vehicleType']['passengerInsurance'].toDouble()??0.0,
// //         normalCharge: data['tripDetails']['vehicleType']['normalCharge'].toDouble()??0.0,
// //         startUpCharge: data['tripDetails']['vehicleType']['startUpCharge']??[],
// //         waitingCharge: data['tripDetails']['vehicleType']['waitingCharge'].toDouble()??0.0);
// //   }
// // }