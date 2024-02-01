import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ChatService {
  //get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });


    // ignore: dead_code
    Future<void> sendMessage(String receiverID, message) async {
      final String currentUsrID = _auth.currentUser!.uid;
      final String currentUserEmail = _auth.currentUser!.email!;
      final Timestamp timestamp = Timestamp.now();
      //create a new message


      Message newMessage=Message(
      senderID: currentUserID,
      senderEmail: currentUserEmail,
      receiverID:receiverID,
      message:message,
      timestamp: timestamp,

      );

      List<String> ids=[currentUsrID,receiverID];
      ids.sort();
      String chatRoomID =ids.join('_');

      //add new message to the database


      await _firestore
      .collection("chatrooms")
      .doc(chatRoomID)
      .collection("messages")
      .add(newMessage.toMap());
  }

  //getmessage
    
    Stream<QuerySnapshot> getMessages(String  userID,otherUserID){
      //construct a ChatroomId for two users
      List<String >ids =[userID, otherUserID];
      ids.sort();
      String chatRoomID =ids.join('_');
      
      return _firestore.collection("chat_rooms").doc(chatRoomID).collection("messages").orderBy("timestamp", descending: false).snapshots();
    }
}






