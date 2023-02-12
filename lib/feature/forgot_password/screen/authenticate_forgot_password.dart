import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/model/checklist/check_list.dart';
import 'package:cmms/common/model/task/task_model.dart';
import 'package:cmms/common/util/config.dart';
import 'package:cmms/common/widget/app_bar.dart';
import 'package:cmms/common/widget/button/elevated_cpn.dart';
import 'package:cmms/common/widget/text_field/textfield.dart';
import 'package:cmms/feature/forgot_password/checkcode/bloc/check_code.dart';
import 'package:cmms/translations/export_lang.dart';

class AuthenticateCodeForgotPassword extends StatefulWidget {
  AuthenticateCodeForgotPassword(
      {Key? key,
      required this.context,
      required this.userName,
      required this.userEnteredCaptchaCode})
      : super(key: key);
  BuildContext context;
  String userName;
  String userEnteredCaptchaCode;
  @override
  State<AuthenticateCodeForgotPassword> createState() =>
      _AuthenticateCodeForgotPasswordState();
}

class _AuthenticateCodeForgotPasswordState
    extends State<AuthenticateCodeForgotPassword> {
  late TaskModel taskModel;
  DateFormat formatDate = DateFormat(formatDateString);
  DateFormat formatHour = DateFormat(formatHourMinuteString);
  DateFormat formatDateHour = DateFormat(formatDateHourString);
  TextEditingController emailCtl = TextEditingController();
  FocusNode capchaCodeFn = FocusNode();
  TextEditingController capchaCodeCtl = TextEditingController();
  FocusNode emailFn = FocusNode();
  late CheckCodeBloc checkCodeBloc;
  List<CheckListModel> checkListComplete = [];
  double totalCheckListComplete = 0;
  double totalCheck = 1;
  Random rnd = Random();
  @override
  void initState() {
    checkCodeBloc = BlocProvider.of<CheckCodeBloc>(context);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    emailCtl.dispose();
    capchaCodeCtl.dispose();
    capchaCodeFn.dispose();
    emailFn.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCpn(
        color: backgroundWhite,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.only(
                    left: 24, right: 24, bottom: 20, top: 20),
                decoration: const BoxDecoration(color: backgroundWhite),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.verificationCodes.tr(),
                        style: h1(context: context, fontWeight: '700'),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        LocaleKeys.fillInformationToGetVerificationCode.tr(),
                        style: h11(
                            context: context,
                            fontWeight: '400',
                            color: grey500),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 40, bottom: 16),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextFieldCpn(
                                controller: capchaCodeCtl,
                                focusNode: capchaCodeFn,
                                labelText: LocaleKeys.verificationCodes.tr(),
                                labelStyle:
                                    h7(context: context, fontWeight: 'w600'),
                              ),
                            ]),
                      ),
                      ElevatedCpn(
                        function: () {
                          checkCodeBloc.add(CheckCodeAuthenticateEvent(
                              code: capchaCodeCtl.text,
                              userName: widget.userName,
                              userEnteredCaptchaCode:
                                  widget.userEnteredCaptchaCode));
                        },
                        gradient: linear,
                        textButton: LocaleKeys.toContinue.tr(),
                        textStyle: h5(
                            color: Theme.of(context).color12,
                            fontWeight: '700'),
                      ),
                    ])),
          ],
        ),
      ),
    );
  }
}
