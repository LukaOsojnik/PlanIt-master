
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';



// class ApplicationState extends ChangeNotifier {

//   Future<DocumentReference> addMessageToGuestBook(String message) {
//     return FirebaseFirestore.instance
//         .collection('guestbook')
//         .add(<String, dynamic>{
//       'text': message,
//       'timestamp': DateTime.now().millisecondsSinceEpoch,
//       'name': FirebaseAuth.instance.currentUser!.displayName,
//       'userId': FirebaseAuth.instance.currentUser!.uid,
//     });
//   }
//   // ...to here.
// }