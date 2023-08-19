import '../models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthStateService {
  final AuthStatus authStatus;
  final firebase.User? firebaseUser;
  final User? user;

  const AuthStateService._({
    this.authStatus = AuthStatus.unknown,
    this.firebaseUser,
    this.user,
  });

  const AuthStateService.unknown() : this._();

  const AuthStateService.authenticated(firebase.User firebaseUser, User user)
      : this._(
          authStatus: AuthStatus.authenticated,
          firebaseUser: firebaseUser,
          user: user,
        );

  const AuthStateService.unauthenticated()
      : this._(authStatus: AuthStatus.unauthenticated);
}
