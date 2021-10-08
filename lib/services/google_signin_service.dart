import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

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

      // print('============== ID TOKEN ================');
      // print(account);
      // print(googleKey.idToken);

      //TODO: Llamar un servicio REST a nustro Backend con el ID TOKEN
      final signInWithGoogleEndpoint = Uri(
        scheme: 'https',
        host: 'google-sig-in.herokuapp.com',
        path: '/google',
      );

      final session = await http.post(
        signInWithGoogleEndpoint,
        body: {
          'token': googleKey.idToken,
        },
      );

      print('============ BACKEND =========');
      print(session.body);

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
