import 'package:cmms/common/widget/alert_dialog.dart';
import 'package:cmms/common/widget/app_bar.dart';
import 'package:cmms/feature/login_signup/login_signup_bloc/sign_up/bloc/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/constant/images.dart';
import 'package:cmms/common/constant/styles.dart';
import 'package:cmms/common/widget/button/elevated_cpn.dart';
import 'package:cmms/common/widget/image.dart';
import 'package:cmms/common/widget/text_field/textfield.dart';
import 'package:cmms/translations/export_lang.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController userNameCtl = TextEditingController();
  FocusNode userNameFn = FocusNode();
  TextEditingController passwordCtl = TextEditingController();
  FocusNode passwordFn = FocusNode();
  TextEditingController confirmPasswordCtl = TextEditingController();
  FocusNode confirmPasswordFn = FocusNode();
  late SignUpBloc signUpBloc;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameCtl.dispose();
    passwordCtl.dispose();
    passwordFn.dispose();
    userNameFn.dispose();
    confirmPasswordCtl.dispose();
    confirmPasswordFn.dispose();
    super.dispose();
  }

  @override
  void initState() {
    signUpBloc = BlocProvider.of<SignUpBloc>(context);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCpn(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ElevatedCpn(
          function: () {
            if (_formKey.currentState!.validate()) {
              if (confirmPasswordCtl.text != passwordCtl.text) {
                alearDialog(
                    context, LocaleKeys.passwordsNotMatch.tr(), () {}, true);
              } else {
                signUpBloc.add(
                    CreateAccountEvent(userNameCtl.text, passwordCtl.text));
              }
            }
          },
          gradient: linear,
          textButton: LocaleKeys.signUp.tr(),
          textStyle: h5(color: Theme.of(context).color12, fontWeight: '700'),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ImageAsset(
                    logoCmms,
                    width: 72,
                    height: 66,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 30),
                    child: Text(
                      'Quản lý sản xuất',
                      style: h5(fontWeight: '700', context: context),
                    ),
                  ),
                  TextFieldCpn(
                    controller: userNameCtl,
                    focusNode: userNameFn,
                    focusNext: passwordFn,
                    labelText: 'Tên tài khoản',
                    errText: 'Bắt buộc nhập',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldCpn(
                    controller: passwordCtl,
                    focusNode: passwordFn,
                    focusNext: confirmPasswordFn,
                    errText: 'Bắt buộc nhập',
                    labelText: LocaleKeys.password.tr(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFieldCpn(
                    controller: confirmPasswordCtl,
                    focusNode: confirmPasswordFn,
                    focusNext: confirmPasswordFn,
                    errText: 'Nhập lại mật khẩu',
                    labelText: LocaleKeys.password.tr(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
