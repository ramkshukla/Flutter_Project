// Create a Form widget.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterlearn/util/bloc/block_builder.dart';
import 'package:flutterlearn/module/route/route.dart';
import 'package:flutterlearn/module/signup/controller/signup_bloc.dart';
import 'package:flutterlearn/module/signup/view_model/signup_model.dart';
import 'package:flutterlearn/util/custom_widget/snackbar.dart';
import 'package:flutterlearn/util/helper/app_color.dart';
import 'package:flutterlearn/util/helper/sign_up_validation_string.dart';

import '../../../util/helper/app_string.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  SignupState createState() {
    return SignupState();
  }
}

class SignupState extends State<SignupForm> {
  bool _isObscure = true;

  final SignupBloc _signupBloc = SignupBloc();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.appTitle),
      ),
      body: Container(
        color: const Color.fromARGB(255, 229, 217, 217),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(30.0),
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 40),
              ),
              const Text(
                "Please fill in this form to create an account",
                style: TextStyle(fontSize: 16),
              ),
              _editNameTextField(),
              _editEmailTextField(),
              _editPhoneTextField(),
              _editPasswordTextField(),
              _submitButton(),
              const Center(
                child: Text(
                  "or sign up with",
                  style: TextStyle(fontSize: 22),
                ),
              ),
              // _googleSignUpButton(),
              _buildBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _googleSignUpButton() {
    return ElevatedButton(
      onPressed: () async {
        await _signupBloc.googleLogin();
        if (_signupBloc.state.appState == AppState.success) {
          // Navigator.pushNamed(context, RouteClass.makemytrip);
          debugPrint(_signupBloc.state.responseModel?.statusCode);
          debugPrint(_signupBloc.state.responseModel?.statusMessage);
        } else {
          AppSnackbar.showSnackbar(
              context: context,
              message: _signupBloc.state.responseModel?.statusMessage ?? "");
        }
      },
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
      ),
      child: _signupBloc.state.appState == AppState.loading
          ? const CircularProgressIndicator()
          : const Text("Google"),
    );
  }

  Widget _buildBuilder() {
    return BlocBuilder(
      builder: _googleSignUpButton,
      bloc: _signupBloc,
    );
  }

  Future<void> signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    final formState = _formKey.currentState;
    if (formState!.validate()) {
      formState.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        _pushPage();
        debugPrint(user.user!.email);
        debugPrint(user.user!.displayName);
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  void _pushPage() {
    Navigator.pushNamed(
      context,
      RouteClass.makemytrip,
    );
  }

  Widget _submitButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: ElevatedButton(
          onPressed:
              // if (_formKey.currentState!.validate()) {
              signIn,
          child: const Text(SignupValidationString.submit),
        ),
      ),
    );
  }

  Widget _editNameTextField() {
    return TextFormField(
      autofocus: true,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
      ],
      controller: _nameController,
      focusNode: _nameFocusNode,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        icon: Icon(Icons.account_circle_sharp),
        labelStyle: TextStyle(
          color: AppColor.labelColor,
        ),
        labelText: SignupValidationString.nameLabelText,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.labelColor),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return SignupValidationString.nameValidationText;
        }
        return null;
      },
    );
  }

  Widget _editEmailTextField() {
    return TextFormField(
      controller: _emailController,
      autofocus: true,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9@.]')),
      ],
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        icon: Icon(Icons.email_outlined),
        labelText: SignupValidationString.emailLabelText,
        labelStyle: TextStyle(
          color: AppColor.labelColor,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.labelColor),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return SignupValidationString.nameValidationText;
        }
        return null;
      },
    );
  }

  Widget _editPhoneTextField() {
    return TextFormField(
      autofocus: true,
      controller: _phoneController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        icon: Icon(Icons.phone),
        labelText: SignupValidationString.phoneLabelText,
        labelStyle: TextStyle(
          color: AppColor.labelColor,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.labelColor),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return SignupValidationString.phoneNumberValidaionText;
        }
        return null;
      },
    );
  }

  Widget _editPasswordTextField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _isObscure,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        icon: const Icon(Icons.password),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
        ),
        labelText: SignupValidationString.passwordLabelText,
        labelStyle: const TextStyle(
          color: AppColor.labelColor,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.labelColor),
        ),
      ),
      validator: _validatePassword,
    );
  }

  String? _validatePassword(String? value) {
    String text = value ?? "";
    RegExp regex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (text.isEmpty) {
      return SignupValidationString.passwordValidationText;
    } else if (!regex.hasMatch(text)) {
      return SignupValidationString.validPasswordText;
    }
    return null;
  }
}
