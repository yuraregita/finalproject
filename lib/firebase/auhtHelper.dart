import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthHelper {
  static final auth = FirebaseAuth.instance;
  final firestoreApi = FirebaseFirestore.instance;

  final _usersStore = FirebaseFirestore.instance.collection("users");

  Future<bool> checkUserType(String uid) async {
    bool isCustomer = false;

    try {
      isCustomer = await firestoreApi
          .collection('users')
          .where('source_UID', isEqualTo: uid)
          .where('type', isEqualTo: 0)
          .get()
          .then((QuerySnapshot querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          return true;
        }
      }).catchError((onError) {
        throw onError;
      });
    } catch (e) {
      print(e);
    }

    return isCustomer;
  }

  Future<bool> signUp(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _usersStore.add({
        "source_UID": auth.currentUser.uid,
        "type": 0,
      });
    } catch (e) {
      print(e);
    }

    return true;
  }
}
