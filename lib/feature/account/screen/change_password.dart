import 'package:cmms/common/widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';
import 'package:cmms/common/widget/button/elevated_cpn.dart';
import 'package:cmms/common/widget/text_field/textfield.dart';
import 'package:cmms/feature/account/bloc/change_password/bloc/change_passord.dart';
import 'package:cmms/translations/export_lang.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool darkMode = false;
  TextEditingController currentPasswordCtl = TextEditingController();
  FocusNode currentPasswordFn = FocusNode();
  TextEditingController newPasswordCtl = TextEditingController();
  FocusNode newPasswordFn = FocusNode();
  TextEditingController enterPasswordCtlCtl = TextEditingController();
  FocusNode enterPasswordCtlFn = FocusNode();
  late ChangePasswordBloc changePasswordBloc;
  String domain = '';
  @override
  void dispose() {
    enterPasswordCtlCtl.dispose();
    currentPasswordCtl.dispose();
    currentPasswordCtl.dispose();
    newPasswordCtl.dispose();
    newPasswordFn.dispose();
    enterPasswordCtlCtl.dispose();
    enterPasswordCtlFn.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getDomain();
    changePasswordBloc = BlocProvider.of<ChangePasswordBloc>(context);

    // accountBloc = BlocProvider.of<AccountBloc>(context);
    // accountBloc.add(GetInformationUserEvent());
    super.initState();
  }

  getDomain() async {
    var respList = await Future.wait([getValueString(SharedPrefKey.domain)]);
    domain = respList[0].toString();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // return BlocProvider.value(
    //     value: changePasswordBloc,
    //     child: Scaffold(
    //       appBar: const AppBarCpn(
    //         color: backgroundWhite,
    //       ),
    //       resizeToAvoidBottomInset: true,
    //       body: ListView(
    //         children: [buildInfor(context)],
    //       ),
    //     ));
    return Scaffold(
      appBar: AppBarCpn(
          color: backgroundWhite,
          center: Text(
            LocaleKeys.changePassword.tr(),
            style: h2(context: context, fontWeight: '700'),
          )),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: const BoxDecoration(color: backgroundWhite),
        child: ListView(
          children: [buildInfor(context)],
        ),
      ),
    );
  }

  buildInfor(
    BuildContext context,
  ) {
    return Column(children: [
      Column(
        children: [
          TextFieldCpn(
            controller: currentPasswordCtl,
            focusNode: currentPasswordFn,
            focusNext: newPasswordFn,
            labelText: LocaleKeys.currentPassword.tr(),
            labelStyle: h7(context: context, fontWeight: '600'),
          ),
          const SizedBox(height: 25),
          TextFieldCpn(
            controller: newPasswordCtl,
            focusNode: newPasswordFn,
            focusNext: enterPasswordCtlFn,
            labelText: LocaleKeys.newPassword.tr(),
            labelStyle: h7(context: context, fontWeight: '600'),
          ),
          const SizedBox(height: 25),
          TextFieldCpn(
            controller: enterPasswordCtlCtl,
            focusNode: enterPasswordCtlFn,
            labelText: LocaleKeys.enterNewPassword.tr(),
            labelStyle: h7(context: context, fontWeight: '600'),
          ),
          const SizedBox(height: 20),
        ],
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
        child: ElevatedCpn(
          function: () {
            if ((newPasswordCtl.text.isEmpty ||
                    currentPasswordCtl.text.isEmpty ||
                    enterPasswordCtlCtl.text.isEmpty) ||
                newPasswordCtl.text.length < 6 ||
                newPasswordCtl.text != enterPasswordCtlCtl.text) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Image.asset(
                        imgWarning,
                        height: 40,
                      ),
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      content: Text(
                        (newPasswordCtl.text.isEmpty ||
                                currentPasswordCtl.text.isEmpty ||
                                enterPasswordCtlCtl.text.isEmpty)
                            ? LocaleKeys.enterFullInformation.tr()
                            : newPasswordCtl.text.length < 6
                                ? LocaleKeys.passwordMoreThanCharacters.tr()
                                : LocaleKeys.passwordsNotMatch.tr(),
                        textAlign: TextAlign.center,
                        style: h4(context: context, fontWeight: '700'),
                      ),
                      actions: <Widget>[
                        // TextButton(
                        //   child: const Text(LocaleKeys.ok.tr()),
                        //   onPressed: () {
                        //     Navigator.of(context).pop();
                        //   },
                        // ),
                      ],
                    );
                  });
            } else {
              changePasswordBloc.add(ChangePassEvent(
                  currentPasswordCtl.text.trim(), newPasswordCtl.text.trim()));
            }
          },
          gradient: linear,
          textButton: LocaleKeys.update.tr(),
          textStyle: h5(color: grey100, fontWeight: '700'),
        ),
      ),
    ]);
  }
}
