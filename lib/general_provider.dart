import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//FirebaseAthのインスタンスを生成
final firebaseAuthProvider =
    StateProvider<FirebaseAuth>((ref) => FirebaseAuth.instance);
