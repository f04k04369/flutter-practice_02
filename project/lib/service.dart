import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  
  Future<void> signIn() async {
    // あらかじめ登録しておいた私のクライアントID
    const clientId= 'xxxxxxxxx';
    // アプリが知りたい情報
    const scopes = [
      'openid',
      'profile',
      'email',
    ];

    // Googleでサインインの画面へ飛ばす
    final request = GoogleSignIn(clientId: clientId, scopes: scopes);
    final response = await request.signIn();

    // 受け取ったデータの中からアクセストークンを取り出す
    final authn = await response?.authentication;
    final accessToken = authn?.accessToken;

    if (accessToken == null) {
      return;
    }

    // firebaseへアクセストークンを送る
    final OAuthCredential = GoogleAuthProvider.credential(
      accessToken: accessToken,
    );
    await FirebaseAuth.instance.signInWithCredential(OAuthCredential,);

    // ここまで！サインイン

    /* Googleサインインを使わないときは これだけで十分 */

    // await FirebaseAuth.instance.signInWithEmailAndPassword(
    //   email: 'ここにメールアドレス',
    //   password: 'ここにパスワード',
    // );
  }

  // サインアウト
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}