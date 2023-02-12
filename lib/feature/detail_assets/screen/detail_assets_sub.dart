import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/widget/app_bar.dart';
import 'package:cmms/feature/detail_assets/widget/detail_asset_sub/document_detail_assets_sub.dart';
import 'package:cmms/feature/detail_assets/widget/detail_asset_sub/part_detail_assets_sub.dart';
import 'package:cmms/feature/detail_assets/widget/detail_asset_sub/work_orders_detail_assets_sub.dart';
import 'package:cmms/feature/detail_assets/widget/detail_asset_sub/general_detail_assets_sub..dart';
import 'package:flutter/material.dart';
import 'package:cmms/common/model/token_noti_user/TokenNotiUserModel.dart';
import 'package:cmms/common/model/user/userdbModel.dart';
import 'package:cmms/translations/export_lang.dart';
import 'package:cmms/common/model/assets/assets_model.dart';

class DetailAssetsSub extends StatefulWidget {
  const DetailAssetsSub({Key? key, required this.assetsDb}) : super(key: key);
  final AssetsDb assetsDb;

  @override
  State<DetailAssetsSub> createState() => _DetailAssetsSubState();
}

class _DetailAssetsSubState extends State<DetailAssetsSub>
    with TickerProviderStateMixin {
  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();
  late TokenNotiUserModel tokenUser;
  UserdbModel? userdb;
  final FirebaseFirestore instance = FirebaseFirestore.instance;
  TextEditingController searchCtr = TextEditingController();
  FocusNode seachFn = FocusNode();
  String deviceName = '';
  String deviceVersion = '';
  String devicetype = '';
  String idUser = '';
  String userName = '';
  String domain = '';
  late TabController tabCtl = TabController(length: 4, vsync: this);
  late AnimationController controller;
  double progress = 0.2;
  int total = 6;
  int current = 4;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      upperBound: progress,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    searchCtl.dispose();
    searchFn.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: backgroundWhite,
          appBar: AppBarCpn(
            center: Text(
              'Details',
              style: h1(context: context, fontWeight: '700'),
            ),
            bottom: Row(
              children: [
                TabBar(
                  onTap: (value) {
                    setState(() {});
                  },
                  automaticIndicatorColorAdjustment: true,
                  labelStyle: h4(context: context, fontWeight: '700'),
                  unselectedLabelStyle: h4(context: context, fontWeight: '600'),
                  labelColor: black,
                  unselectedLabelColor: grayBlue,
                  indicatorWeight: 0,
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  controller: tabCtl,
                  indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 2.0,
                      ),
                      insets: EdgeInsets.only(top: 20, bottom: 5, right: 25)),
                  tabs: [
                    Tab(text: LocaleKeys.general.tr()),
                    Tab(text: LocaleKeys.parts.tr()),
                    Tab(text: LocaleKeys.documents.tr()),
                    const Tab(text: 'Work order'),
                  ],
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: tabCtl,
            children: [
              GeneralDetailAssetsSub(
                assetsDb: widget.assetsDb,
              ),
              PartsDetailAssetsSub(
                assetsDb: widget.assetsDb,
              ),
              DocumentDetailAssetsSub(
                assetsDb: widget.assetsDb,
              ),
              WorkOrdersDetailAssetsSub(
                assetsDb: widget.assetsDb,
              ),
            ],
          )),
    );
  }
}
