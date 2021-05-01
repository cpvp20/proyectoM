import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuthProvider {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>["email"]);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isAlreadyLogged() {
    var user = FirebaseAuth.instance.currentUser;
    //print("User: ${user.displayName}");
    return user != null;
  }

  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
  }

  Future<void> signOutFirebase() async {
    await _auth.signOut();
  }

  // anonimo
  Future<void> anonymousSignIn() async {
    final anonymousUser = (await _auth.signInAnonymously()).user;
    await anonymousUser.updateProfile(
      displayName: "${anonymousUser.uid.substring(0, 5)}_Invitado",
    );
    await anonymousUser.reload();
  }

  Future<void> signInWithGoogle() async {
    // Google sign in
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser.authentication;

    print("user: ${googleUser.displayName}");
    print("user: ${googleUser.email}");
    print("user: ${googleUser.photoUrl}");

    // credenciales para firebase
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // firebase sign in
    final authResult = await _auth.signInWithCredential(credential);
    final User user = authResult.user;
    final firebaseAuthToken = await user.getIdToken();
    assert(!user.isAnonymous);
    assert(firebaseAuthToken != null);
    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print("Firebase user auth token: $firebaseAuthToken");
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      final user = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      await user.updateProfile(
        displayName: "${user.uid.substring(0, 5)}_Invitado",
      );
      await user.reload();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      await user.updateProfile(
        displayName: "${user.uid.substring(0, 5)}_Invitado",
      );
      await user.reload();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
