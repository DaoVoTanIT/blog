import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/app/animation_click.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/constant/images.dart';
import 'package:cmms/common/constant/styles.dart';
import 'package:cmms/common/route/routes.dart';
import 'package:cmms/common/widget/button/elevated_cpn.dart';
import 'package:cmms/common/widget/image.dart';
import 'package:cmms/common/widget/text_field/textfield.dart';
import 'package:cmms/common/widget/text_field/textfield_pass.dart';
import 'package:cmms/feature/login_signup/login_signup_bloc/bloc/login/export.dart';
import 'package:cmms/translations/export_lang.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailCtl = TextEditingController();
  FocusNode emailFn = FocusNode();
  TextEditingController passwordCtl = TextEditingController();
  FocusNode passwordFn = FocusNode();
  late LoginBloc loginBloc;
  @override
  void dispose() {
    emailCtl.dispose();
    passwordCtl.dispose();
    passwordFn.dispose();
    emailFn.dispose();
    super.dispose();
  }

  @override
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: loginBloc,
      child: BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
        // if (state is LoginLoading) {
        //   Navigator.of(context).pop();
        // }
      }, builder: (BuildContext context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(
                  top: 76, left: 24, right: 24, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ImageAsset(
                    logoCmms,
                    width: 72,
                    height: 66,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      'Quản lý sản xuất',
                      style: h5(fontWeight: '700', context: context),
                    ),
                  ),
                  const Expanded(flex: 1, child: SizedBox()),
                  TextFieldCpn(
                    controller: emailCtl,
                    focusNode: emailFn,
                    focusNext: passwordFn,
                    labelText: LocaleKeys.account.tr(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: TextFieldPassCpn(
                      controller: passwordCtl,
                      focusNode: passwordFn,
                      labelText: LocaleKeys.password.tr(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: AnimationClick(
                          function: () {
                            Navigator.of(context)
                                .pushNamed(Routes.forgotPassword);
                          },
                          child: Text(
                            LocaleKeys.forgetPass.tr(),
                            style: h7(
                                fontWeight: '600',
                                context: context,
                                color: grayBlue),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: AnimationClick(
                          function: () {
                            Navigator.of(context).pushNamed(Routes.signUp);
                          },
                          child: Text(
                            LocaleKeys.signUp.tr(),
                            style: h7(
                                fontWeight: '700',
                                context: context,
                                color: dodgerBlue),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedCpn(
                    function: () {
                      // NavigationService navigationService = NavigationService();
                      // navigationService.navigateTo(Routes.home);
                      loginBloc.add(
                          AuthenticateEvent(emailCtl.text, passwordCtl.text));
                    },
                    gradient: linear,
                    textButton: LocaleKeys.logIn.tr(),
                    textStyle:
                        h5(color: Theme.of(context).color12, fontWeight: '700'),
                  ),
                  //const Expanded(flex: 1, child: SizedBox()),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.domainIncorrect.tr(),
                        style: h7(
                            fontWeight: '600',
                            context: context,
                            color: grayBlue),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              Routes.domain, (Route<dynamic> route) => false);
                        },
                        child: Text(
                          ' ${LocaleKeys.changeDomain.tr()}',
                          style: h7(
                              fontWeight: '600',
                              context: context,
                              color: dodgerBlue),
                        ),
                      ),
                    ],
                  ),
                  const Expanded(flex: 1, child: SizedBox()),
                  const Expanded(flex: 1, child: SizedBox()),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
