import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  // ignore: non_constant_identifier_names
  FirebaseAuth final_auth = FirebaseAuth.instance;
  GoogleSignIn final_googleSignIn = GoogleSignIn();

  var _googleSignIn;
  signInWithGoogle() async {
    // TODO: implement signInWithGoogle
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      // {
//    final Future<GoogleSignInAccount?> result =
      //      _addMethodCall(GoogleSignInPlatform.instance.signIn, canSkipCall: true);
      //bool isCanceled(dynamic error) =>
      //  error is PlatformException && error.code == kSignInCanceledError;
      //return result.catchError((dynamic _) => null, test: isCanceled);
      //}
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        var _auth;
        await _auth.signInWihCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }
}
