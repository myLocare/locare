import 'package:firebase_auth/firebase_auth.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential cred = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);
        res = "Signed in";
      }
      if (email.isEmpty) {
        res = "Email is empty";
      }
      if (password.isEmpty) {
        res = "Password is empty";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
