import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterlearn/util/bloc/block.dart';
import 'package:flutterlearn/module/signup/view_model/signup_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupBloc extends Bloc<SignupModel> {
  @override
  SignupModel initDefaultValue() {
    return SignupModel(appState: AppState.initial);
  }

  Future<void> googleLogin() async {
    state.appState = AppState.loading;
    emit(state);
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleUser?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication!.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      if (googleUser == null) {
        state.appState = AppState.failure;
        state.responseModel = ResponseModel(
            statusCode: "500", statusMessage: "user has canceled");
      } else {
        state.appState = AppState.success;
        await FirebaseAuth.instance.signInWithCredential(credential);
        state.responseModel = ResponseModel(
          statusCode: "200",
          statusMessage: "success",
          data: {
            "profile": googleUser.photoUrl,
            "id": googleUser.id,
            "name": googleUser.displayName,
            "email": googleUser.email
          },
        );
      }
    } catch (e) {
      state.appState = AppState.failure;
      state.responseModel =
          ResponseModel(statusCode: "500", statusMessage: e.toString());
    }
    emit(state);
  }
}
