import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authControllerProvider = StateNotifierProvider<AuthController , User?>((ref) => AuthController(ref.notifier))

class AuthController extends StateNotifier<User?> {
  
}