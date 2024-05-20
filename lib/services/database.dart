import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future<void> addPersonRecord(Map<String, dynamic> PersonMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Person")
        .doc(id)
        .set(PersonMap);
  }

  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("Person")
        .where("Email", isEqualTo: email)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.first.data() as Map<String, dynamic>;
    }
    return null;
  }
}
