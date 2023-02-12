import 'package:cmms/app/animation_click.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/widget/app_bar.dart';
import 'package:cmms/common/widget/bottom_custom.dart';
import 'package:cmms/common/widget/button/elevated_cpn.dart';
import 'package:cmms/common/widget/button/icon_button_cpn.dart';
import 'package:cmms/common/widget/button/outlined_cpn.dart';
import 'package:cmms/common/widget/text_field/search.dart';
import 'package:cmms/feature/assets_maintenance/assets_bloc/asset/bloc/assets.dart';
import 'package:cmms/feature/assets_maintenance/assets_bloc/assets_barcode/bloc/assets_barcode.dart';
import 'package:cmms/feature/assets_maintenance/screen/assets_maintenance.dart';
import 'package:cmms/feature/assets_maintenance/widget/information_assets.dart';
import 'package:cmms/feature/detail_assets/screen/detail_assets.dart';
import 'package:cmms/feature/detail_assets/screen/detail_assets_sub.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetsPage extends StatefulWidget {
  const AssetsPage({Key? key}) : super(key: key);

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> with TickerProviderStateMixin {
  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();
  TextEditingController searchCtr = TextEditingController();
  FocusNode seachFn = FocusNode();
  String deviceName = '';
  String deviceVersion = '';
  String devicetype = '';
  String idUser = '';
  String userName = '';
  String domain = '';
  late TabController tabCtl = TabController(length: 2, vsync: this);
  late AnimationController controller;
  double progress = 0.2;
  int total = 6;
  int current = 4;
  late AssetsBloc assetsBloc;
  late AssetsBarcodeBloc assetsBarcodeBloc;
  @override
  void initState() {
    assetsBloc = BlocProvider.of<AssetsBloc>(context);
    assetsBarcodeBloc = BlocProvider.of<AssetsBarcodeBloc>(context);
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
      length: 2,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBarCpn(
            left: Text(
              'Assets',
              style: h1(context: context, fontWeight: '700'),
            ),
            right: AnimationClick(
              function: () async {
                await scanQR().then((value) {
                  showModalBottomSheet<void>(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          child: BlocProvider.value(
                            value: assetsBarcodeBloc,
                            child: BlocBuilder<AssetsBarcodeBloc,
                                AssetsBarcodeState>(builder: (context, state) {
                              if (state is AssetsBarcodeSucsses) {
                                return Column(
                                  children: [
                                    informationAssets(context, state.assetsDb),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: ElevatedCpn(
                                              textButton: 'New Work Order',
                                              gradient: linear,
                                              textStyle: h5(
                                                  color: backgroundWhite,
                                                  fontWeight: '700'),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Expanded(
                                              child: OutlinedCpn(
                                            textButton: 'View Details',
                                            function: () {
                                              if (state.assetsDb.db.codeLevel ==
                                                  0) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailAssets(
                                                            assetsDb:
                                                                state.assetsDb,
                                                          )),
                                                );
                                              } else {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailAssetsSub(
                                                            assetsDb:
                                                                state.assetsDb,
                                                          )),
                                                );
                                              }
                                            },
                                            textStyle: h5(
                                                color: grey600,
                                                fontWeight: '700'),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              } else if (state is AssetsBarcodeError) {
                                Navigator.pop(context);
                                return Container();
                              } else {
                                return Container();
                              }
                            }),
                          ),
                        );
                      });
                });
              },
              child: Card(
                child: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                      color: grey100, borderRadius: BorderRadius.circular(8)),
                  child: const Icon(
                    Icons.qr_code_2,
                    color: blue,
                    size: 20,
                  ),
                ),
              ),
            ),
            bottom: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: SearchCpn(
                    controller: searchCtl,
                    focusNode: searchFn,
                    hintText: 'Search',
                    onChanged: (value) {
                      assetsBloc.add(FilterAssetsEvent(value));
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelStyle: h4(context: context, fontWeight: '700'),
                    unselectedLabelStyle:
                        h4(context: context, fontWeight: '600'),
                    labelColor: tiffanyBlue,
                    unselectedLabelColor: grayBlue,
                    indicatorColor: tiffanyBlue,
                    indicatorWeight: 0,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    controller: tabCtl,
                    indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(width: 2.0, color: tiffanyBlue),
                        insets: EdgeInsets.only(top: 20, bottom: 5, right: 25)),
                    tabs: [
                      const Tab(text: 'Assets'),
                      const Tab(text: 'Location'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: tabCtl,
            children: [
              const AssetsMaintenancePage(),
              Center(
                  child: Text(
                'Tính năng đang được phát triển',
                style: h2(context: context, fontWeight: '700'),
              ))
            ],
          )),
    );
  }

  Future scanQR() async {
    String barcode;
    try {
      barcode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      // var decrypt = await decryptString(barcode);
      if (barcode.isNotEmpty) {
        assetsBarcodeBloc.add(GetAssetsDetailByBarcodeEvent(barcode));
      }
    } on PlatformException {
      // ShowPopUp.showError(
      //     context,
      //     Translations.of(context)?.text('common.need_access_to_camera') ?? '',
      //     '');
    } catch (e) {
      print(e.toString());
    }
  }
}
