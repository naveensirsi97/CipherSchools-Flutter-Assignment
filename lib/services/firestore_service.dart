import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  static User get user => FirebaseAuth.instance.currentUser!;

  Future<void> saveUserData() async {
    await _fireStore
        .collection('users')
        .doc(user.uid)
        .set({'email': user.email, 'name': user.displayName});
  }

  Future<Map<String, dynamic>?> getUserData() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _fireStore.collection('users').doc(user.uid).get();
    return snapshot.data();
  }
}
