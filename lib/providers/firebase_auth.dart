import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Stream<User> get authStateChange => _auth.authStateChanges();

  User getCurrentUser() {
    return _auth.currentUser;
  }

  Future<UserCredential> signUpWithEmail(String email, String password) async {
    final user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    // _auth.currentUser.getIdToken(true).whenComplete(() => () {});
    return user;
  }

  Future<UserCredential> signInWithEmail(String email, String password) async {
    final user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    // _auth.currentUser.getIdToken(true).whenComplete(() => () {});
    return user;
  }

  Future<bool> loginWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount account = await googleSignIn.signIn();
      if (account == null) return false;
      UserCredential res =
          await _auth.signInWithCredential(GoogleAuthProvider.getCredential(
        idToken: (await account.authentication).idToken,
        accessToken: (await account.authentication).accessToken,
      ));

      if (res.user == null) return false;
      return true;
    } catch (e) {
      print(e.message);
      print("Error logging with google");
      return false;
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // GoogleSignIn().signInSilently()
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<String> signInWithGoogle1() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = await _auth.currentUser;
    assert(user.uid == currentUser.uid);

    return 'signInWithGoogle succeeded: $user';
  }
}
