import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteData {
  
  //delete material
   Future<void> removeMaterial(
    sortsubname,
    type,
    branch,
    filename,
    BuildContext context,
  ) async {
    try {
      FirebaseFirestore.instance
          .collection('Material')
          .doc(sortsubname)
          .collection('Type')
          .doc(type)
          .collection(branch)
          .doc(filename)
          .delete();
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message.toString(),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}