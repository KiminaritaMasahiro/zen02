import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//Firebase Auth　のインスタンス
final firebaseAuthProvider =
    StateProvider<FirebaseAuth>((ref) => FirebaseAuth.instance);

//FireBase Store のインスタンス
final firebaseFirestoreProvider =
    StateProvider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);
