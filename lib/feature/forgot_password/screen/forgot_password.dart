import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/model/checklist/check_list.dart';
import 'package:cmms/common/model/task/task_model.dart';
import 'package:cmms/common/util/config.dart';
import 'package:cmms/common/widget/app_bar.dart';
import 'package:cmms/common/widget/button/elevated_cpn.dart';
import 'package:cmms/common/widget/text_field/text_field_domain.dart';
import 'package:cmms/common/widget/text_field/textfield.dart';
import 'package:cmms/feature/detail_task/detail_task_bloc/checklist/bloc/checklist.dart';
import 'package:cmms/feature/detail_task/detail_task_bloc/file/bloc/file.dart';
import 'package:cmms/feature/detail_task/detail_task_bloc/message/bloc/message.dart';
import 'package:cmms/feature/forgot_password/forgot_password_bloc/forgot_password/bloc/forgot_password.dart';
import 'package:cmms/translations/export_lang.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({
    Key? key,
  }) : super(key: key);
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late TaskModel taskModel;
  DateFormat formatDate = DateFormat(formatDateString);
  DateFormat formatHour = DateFormat(formatHourMinuteString);
  DateFormat formatDateHour = DateFormat(formatDateHourString);
  TextEditingController emailCtl = TextEditingController();
  FocusNode capchaCodeFn = FocusNode();
  TextEditingController capchaCodeCtl = TextEditingController();
  FocusNode emailFn = FocusNode();
  ChecklistBloc checklistBloc = ChecklistBloc();
  MessageBloc messageBloc = MessageBloc();
  late FileBloc fileBloc;
  List<CheckListModel> checkListComplete = [];
  double totalCheckListComplete = 0;
  double totalCheck = 1;
  Random rnd = Random();
  String capchaCode = '';
  late ForgotPasswordBloc forgotPasswordBloc;
  @override
  void initState() {
    super.initState();
    forgotPasswordBloc = ForgotPasswordBloc(context);
    Future.delayed(Duration.zero, () async {
      setState(() {});
    });
    forgotPasswordBloc.add(GetImageCapchaEvent());
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
                        LocaleKeys.forgotPassword.tr(),
                        style: h1(context: context, fontWeight: '700'),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        LocaleKeys.enterFullInformation.tr(),
                        style: h11(
                            context: context,
                            fontWeight: '400',
                            color: grey500),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 34),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: TextFieldCpn(
                                  controller: emailCtl,
                                  focusNode: emailFn,
                                  focusNext: capchaCodeFn,
                                  labelText: LocaleKeys.account.tr(),
                                  labelStyle:
                                      h7(context: context, fontWeight: 'w600'),
                                ),
                              ),
                              TextFieldDomain(
                                onChanged: (value) {
                                  // if (_debounce?.isActive ?? false) {
                                  //   _debounce!.cancel();
                                  // }
                                  // _debounce = Timer(const Duration(seconds: 2),
                                  //     () async {
                                  //   forgotPasswordBloc.add(
                                  //       CheckCapchaEvent(emailCtl.text, value));
                                  // });
                                },
                                controller: capchaCodeCtl,
                                focusNode: capchaCodeFn,
                                labelText: LocaleKeys.capchaCode.tr(),
                                labelStyle:
                                    h7(context: context, fontWeight: 'w600'),
                              ),
                            ]),
                      ),
                      BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                          bloc: forgotPasswordBloc,
                          buildWhen: (previous, current) {
                            return current is GetCapChaSuccess;
                          },
                          builder: (BuildContext context, state) {
                            return state is GetCapChaSuccess
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    margin: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: backgroundWhite),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          //  padding: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                              color: neonFuchsia),
                                          // child: Text(
                                          //   capchaCode,
                                          //   style: h5(
                                          //       context: context, color: backgroundColor),
                                          // ),
                                          child: state.urlImage,
                                        ),
                                      ],
                                    ),
                                  )
                                : Container();
                          }),
                      ElevatedCpn(
                        function: () {
                          if (capchaCodeCtl.text.isEmpty) {
                            SmartDialog.showToast(
                              LocaleKeys.enterFullInformation.tr(),
                            );
                          } else if (capchaCodeCtl.text.isNotEmpty) {
                            forgotPasswordBloc.add(CheckCapchaEvent(
                                emailCtl.text, capchaCodeCtl.text));
                            //  capchaCodeCtl.clear();
                          }
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
