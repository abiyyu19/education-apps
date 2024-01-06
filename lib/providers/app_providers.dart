import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppProvider with ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  void changePageIndex(int value) {
    _pageIndex = value;
    log('$_pageIndex');
    notifyListeners();
  }

  bool _isChecked = false;

  bool get isChecked => _isChecked;

  void changeIsChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  User? _user;

  User? get currentUser => _user;

  void changeUser(User? value) {
    log('$value');
    _user = value;
  }

  final _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>['email', 'profile'],
  );

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await _googleSignIn.signIn();
      if (gUser == null) return null;

      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      _user = _auth.currentUser;
      notifyListeners();

      return await _auth.signInWithCredential(credential);
      // log('Test');
      // GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();

      // await _auth.sign

      // await _auth.signInWithPopup(googleAuthProvider);
      // notifyListeners();
      // return true;
    } catch (e) {
      log('ini errornya $e');
      notifyListeners();
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    notifyListeners();
    return;
  }

  Position? _userPosition;

  Position? get userPosition => _userPosition;

  void ChangeUserPosition(Position value) {
    _userPosition = value;
    notifyListeners();
  }

  Future<Position> getUserCurrentPosition() async {
    // Check Permission
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // Get user current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    ChangeUserPosition(position);

    return position;
  }
}
