import 'package:app_auth/services/google_signin_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth Gogole Apple',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Auth Gogole Apple'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.doorOpen),
              onPressed: () {
                GoogleSigninService.signOut();
              },
            ),
          ],
        ),
        body: const _Contenido(),
      ),
    );
  }
}

class _Contenido extends StatelessWidget {
  const _Contenido({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              splashColor: Colors.transparent,
              minWidth: double.infinity,
              height: size.height * 0.05,
              color: Colors.red,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(FontAwesomeIcons.google, color: Colors.white),
                  SizedBox(width: size.width * 0.02),
                  Text(
                    'Iniciar sesion con Google',
                    style: TextStyle(color: Colors.white, fontSize: size.width * 0.035),
                  )
                ],
              ),
              onPressed: () {
                GoogleSigninService.signInWithGoogle();
              },
            )
          ],
        ),
      ),
    );
  }
}
