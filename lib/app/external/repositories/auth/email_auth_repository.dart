import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/dto/entities/user/user_credential_entity.dart';
import '../../../domain/dto/params/auth_param.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../handlers/firebase_auth_exception_handler.dart';

class EmailAuthRepository implements AuthRepository {
  EmailAuthRepository({required this.firebaseAuth});

  final FirebaseAuth firebaseAuth;

  @override
  Future<UserCredentialEntity> signIn(AuthParam param) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: param.email,
        password: param.password,
      );
      final token = await userCredential.user!.getIdToken();

      return UserCredentialEntity(
        token: token!,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e).message;
    }
  }

  @override
  Future<void> signOut() {
    return firebaseAuth.signOut();
  }

  @override
  Future<void> signUp(AuthParam param) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: param.email,
        password: param.password,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e).message;
    }
  }
}
