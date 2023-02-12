import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/route/routes.dart';
import 'package:cmms/common/widget/button/elevated_cpn.dart';
import 'package:cmms/common/widget/image.dart';
import 'package:cmms/common/widget/text_field/text_field_domain.dart';
import 'package:cmms/feature/domain/bloc/domain.dart';
import 'package:cmms/translations/export_lang.dart';

class DomainPage extends StatefulWidget {
  const DomainPage({Key? key}) : super(key: key);

  @override
  State<DomainPage> createState() => _DomainPageState();
}

class _DomainPageState extends State<DomainPage> {
  TextEditingController domainCtl = TextEditingController();
  FocusNode domainFn = FocusNode();
  late DomainBloc domainBloc;
  Timer? _debounce;
  @override
  void dispose() {
    domainCtl.dispose();
    domainFn.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    domainBloc = BlocProvider.of<DomainBloc>(context);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Padding(
            padding:
                const EdgeInsets.only(top: 76, left: 24, right: 24, bottom: 24),
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
                BlocBuilder<DomainBloc, DomainState>(
                    buildWhen: (previous, current) => previous != current,
                    builder: (context, state) {
                      return SizedBox(
                        height: 300,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: TextFieldDomain(
                                  onChanged: ((value) {
                                    if (_debounce?.isActive ?? false) {
                                      _debounce!.cancel();
                                    }
                                    _debounce = Timer(
                                        const Duration(milliseconds: 500), () {
                                      domainBloc
                                          .add(CheckDomainEvent(domain: value));
                                    });
                                  }),
                                  isError: state is DomainFailure,
                                  controller: domainCtl,
                                  focusNode: domainFn,
                                  labelText: LocaleKeys.domain.tr(),
                                  showSuffixIcon: true,
                                  suffixIcon: iconWidget(state)),
                            ),
                            button(state),
                          ],
                        ),
                      );
                    }),
                const Expanded(flex: 3, child: SizedBox()),
              ],
            ),
          ),
        ));
  }

  Widget iconWidget(state) {
    if (state is DomainInitial || domainCtl.text.isEmpty) {
      return const Icon(
        Icons.refresh_outlined,
        color: goGreen,
      );
    } else if (state is DomainLoading) {
      return const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: goGreen,
            strokeWidth: 3,
          ));
    } else if (state is DomainSuccess) {
      return const Icon(
        Icons.check_circle,
        color: CupertinoColors.activeGreen,
      );
    } else if (state is DomainFailure) {
      return const Icon(
        Icons.cancel_outlined,
        color: neonFuchsia,
      );
    } else {
      return const Icon(
        Icons.refresh_outlined,
        color: goGreen,
      );
    }
  }

  Widget button(state) {
    if (state is DomainSuccess) {
      return ElevatedCpn(
        function: () {
          Navigator.of(context).pushNamed(Routes.login);
        },
        gradient: linear,
        textButton: LocaleKeys.toContinue.tr(),
        textStyle: h5(color: Theme.of(context).color12, fontWeight: '700'),
      );
    } else if (state is DomainFailure) {
      return Container();
    } else {
      return Container();
    }
  }
}
