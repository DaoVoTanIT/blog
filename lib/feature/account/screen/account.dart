import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmms/common/model/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/app/widget_support.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';
import 'package:cmms/common/route/routes.dart';
import 'package:cmms/common/widget/app_bar.dart';
import 'package:cmms/common/widget/button/elevated_cpn.dart';
import 'package:cmms/common/widget/button/outlined_cpn.dart';
import 'package:cmms/common/widget/dialog_custom.dart';
import 'package:cmms/common/widget/image.dart';
import 'package:cmms/common/widget/text_field/textfield.dart';
import 'package:cmms/feature/account/bloc/account/bloc/account.dart';
import 'package:cmms/feature/account/screen/change_password.dart';
import 'package:cmms/translations/export_lang.dart';
import 'package:shimmer/shimmer.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool darkMode = false;
  TextEditingController nameCtl = TextEditingController();
  FocusNode nameFn = FocusNode();
  TextEditingController phoneNumberCtl = TextEditingController();
  FocusNode phoneNumberFn = FocusNode();
  TextEditingController emailCtl = TextEditingController();
  FocusNode emailFn = FocusNode();
  late AccountBloc accountBloc;
  String domain = '';
  UserModel userModel = UserModel(data: UserData(user: User()));
  @override
  void dispose() {
    emailCtl.dispose();
    emailFn.dispose();
    nameCtl.dispose();
    nameFn.dispose();
    phoneNumberCtl.dispose();
    phoneNumberFn.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getDomain();
    accountBloc = BlocProvider.of<AccountBloc>(context);
    accountBloc.add(GetInformationUserEvent());
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
    return BlocProvider.value(
        value: accountBloc,
        child: Scaffold(
          appBar: AppBarCpn(
            left: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Text(
                LocaleKeys.account.tr(),
                style: h1(color: black, fontWeight: '700'),
              ),
            ),
            color: backgroundWhite,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: BlocBuilder<AccountBloc, AccountState>(
              builder: (context, state) {
                if (state is AccountLoaded) {
                  userModel = state.userdbModel;
                }
                return buildInfor(context, userModel);
              },
            ),
          ),
        ));
  }

  buildInfor(BuildContext context, UserModel model) {
    nameCtl.text = model.data.user.fullName;
    phoneNumberCtl.text = model.data.user.phoneNumber;
    emailCtl.text = model.data.user.email;

    return Column(children: [
      Container(
        margin: const EdgeInsets.only(top: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(16),
            //   child: ImageNetwork('https://$domain${model.avatarPath}',
            //       width: 100, height: 100),
            // ),
            CachedNetworkImage(
              imageUrl: '${model.data.user.imageUrl}',
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: grey100,
                highlightColor: isabelline,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: isabelline),
                ),
              ),
              //const CircularProgressIndicator(),
              imageBuilder: (context, imageProvider) => Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: grey400),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 24, bottom: 24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: grey100,
            boxShadow: [
              BoxShadow(
                  color: color4.withOpacity(0.04),
                  offset: const Offset(0, 5),
                  blurRadius: 10)
            ]),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    alignment: Alignment.center,
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: tiffanyBlue.withOpacity(0.16),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: tiffanyBlue,
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(LocaleKeys.basicInformation.tr(),
                      style: h5(context: context, fontWeight: '700')),
                ),
              ],
            ),
            AppWidget.divider2(),
            TextFieldCpn(
              readOnly: true,
              controller: nameCtl,
              focusNode: nameFn,
              focusNext: phoneNumberFn,
              labelText: LocaleKeys.fullName.tr(),
              labelStyle: h7(context: context, fontWeight: '600'),
            ),
            const SizedBox(height: 25),
            TextFieldCpn(
              readOnly: true,
              controller: phoneNumberCtl,
              focusNode: phoneNumberFn,
              focusNext: emailFn,
              labelText: LocaleKeys.phoneNumber.tr(),
              labelStyle: h7(context: context, fontWeight: '600'),
            ),
            const SizedBox(height: 25),
            TextFieldCpn(
              readOnly: true,
              controller: emailCtl,
              focusNode: emailFn,
              labelText: LocaleKeys.email.tr(),
              labelStyle: h7(context: context, fontWeight: '600'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePassword(),
                      ),
                    );
                  },
                  child: Text(
                    '${LocaleKeys.changePass.tr()} ?',
                    style: h7(
                        fontWeight: '600',
                        context: context,
                        color: tiffanyBlue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      DialogCustom(
        childInside: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ImageAsset(imgWarning, width: 72, height: 72),
            const SizedBox(height: 32),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: LocaleKeys.wantSignOut.tr(),
                style: h4(context: context),
                children: <TextSpan>[
                  TextSpan(
                    text: nameCtl.text,
                    style: h4(context: context, fontWeight: '700'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: OutlinedCpn(
                    function: () {
                      //  removeValueString(SharedPrefKey.domain);
                      removeValueString(SharedPrefKey.tokenUser);
                      Navigator.pushNamedAndRemoveUntil(context, Routes.login,
                          (Route<dynamic> route) => false);
                    },
                    textButton: LocaleKeys.yes.tr(),
                    textStyle: h5(color: grayBlue, fontWeight: '700'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedCpn(
                    function: () {
                      Navigator.of(context).pop();
                    },
                    gradient: linear,
                    textButton: LocaleKeys.no.tr(),
                    textStyle: h5(color: grey100, fontWeight: '700'),
                  ),
                ),
              ],
            )
          ],
        ),
        childShowDialog: OutlinedCpn(
          function: (() => {}),
          textButton: LocaleKeys.signOut.tr(),
          borderColor: neonFuchsia,
          textStyle: h5(color: neonFuchsia, fontWeight: '700'),
        ),
      ),
    ]);
  }
}
