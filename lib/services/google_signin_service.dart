import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  static Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      final googleKey = await account!.authentication;

      print('============== ID TOKEN ================');
      print(account);
      print(googleKey.idToken);

      //TODO: Llamar un servicio REST a nustro Backend con el ID TOKEN

      return account;
    } catch (e) {
      print('Error en Google');
      print(e);
      return;
    }
  }

  static Future signOut() async {
    await _googleSignIn.signOut();
  }
}
