import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen02/ripositories/auth_repository.dart';

final authControllerProvider = StateNotifierProvider<AuthController, User?>(
    (ref) => AuthController(ref.read));

class AuthController extends StateNotifier<User?> {
  final Reader _read;
  StreamSubscription<User?>? _autoStateChangeSubscription;

  AuthController(this._read) : super(null) {
    _autoStateChangeSubscription?.cancel();
    _autoStateChangeSubscription = _read(authRepositoryProvider)
        .authStateChanges
        .listen((user) => state = user);
  }

  @override
  void dispose() {
    _autoStateChangeSubscription?.cancel();
    super.dispose();
  }

  void appStarted() async {
    //final user = _read(authRepositoryProvider).getCurrentUser();

    await _read(authRepositoryProvider).signInAnonymously();
  }

  void singOut() async {
    await _read(authRepositoryProvider).signOut();
  }
}
