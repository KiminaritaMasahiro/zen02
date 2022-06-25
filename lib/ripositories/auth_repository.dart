import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen02/general_provider.dart';

//抽象クラス
abstract class BaseAuthRepository {
  Stream<User?> get authStateChanges; //ログイン状況の確認用
  Future<void> signInAnonymously(); //匿名サインイン
  User? getCurrentUser(); //サインイン中のユーザを取得
  Future<void> signOut(); //匿名サインアウト
}

final authRepositoryProvider =
    StateProvider<AuthRepository>((ref) => AuthRepository(ref.read));

class AuthRepository implements BaseAuthRepository {

  final Reader _read;           //リーダーを使うことでほかのプロバイダーを読み取れる
  AuthRepository(this._read)

  //ログイン状況の確認用
  // ignore: empty_constructor_bodies
  @override
  Stream<User?> get authStateChanges => _read(firebaseAuthProvider).authStateChanges();
  
  //匿名サインイン
  @override
  Future<void> signInAnonymously() async {
    try{
      await _read(firebaseAuthProvider).signInAnonymously();
    }on FirebaseAuthException catch(e){
      // ignore: avoid_print
      print(e.message);
    }
  }

  //サインイン中のユーザを取得
  @override
  User? getCurrentUser(){
    try{
      return _read(firebaseAuthProvider).currentUser;
    }on FirebaseAuthException catch(e){
      // ignore: avoid_print
      print(e.message);
      return null;
    }
  }
  //匿名サインアウト
  @override
  Future<void> signOut()async{
    try{
      await _read(firebaseAuthProvider).signOut();
    }on FirebaseAuthException catch(e){
      // ignore: avoid_print
      print(e.message);
    }
  }
}
