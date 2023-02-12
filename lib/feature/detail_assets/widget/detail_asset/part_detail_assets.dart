import 'package:cmms/app/animation_click.dart';
import 'package:cmms/app/widget_support.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/model/assets/assets_model.dart';
import 'package:cmms/common/util/config.dart';
import 'package:cmms/feature/assets_maintenance/widget/information_assets.dart';
import 'package:cmms/translations/export_lang.dart';
import 'package:flutter/material.dart';
import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';

class PartsDetailAssets extends StatefulWidget {
  const PartsDetailAssets({Key? key, required this.assetsDb}) : super(key: key);
  final AssetsDb assetsDb;

  @override
  State<PartsDetailAssets> createState() => _PartsDetailAssetsState();
}

class _PartsDetailAssetsState extends State<PartsDetailAssets> {
  DateFormat formatHour = DateFormat(formatDateTimeString);
  String domain = '';
  AssetsDb assetsDb = AssetsDb(
      listSubAsset: [],
      db: Db(
          cmmsAssetActivities: [], cmmsAssetDocuments: [], cmmsAssetItems: []),
      parentAsset: Db(
          cmmsAssetActivities: [], cmmsAssetDocuments: [], cmmsAssetItems: []));
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    getDomain();
    assetsDb = widget.assetsDb;

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
    return Scaffold(
        body: SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          informationAssets(context, assetsDb),
          assetsDb.db.cmmsAssetItems.isEmpty
              ? Container()
              : AnimationClick(
                  function: () {
                    // Navigator.of(context).pushNamed(
                    //   Routes.detailAssets,
                    // );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: color4.withOpacity(0.04),
                          offset: const Offset(0, 5),
                          blurRadius: 10)
                    ], color: grey100, borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        ...assetsDb.db.cmmsAssetItems.map(
                          (e) => Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    e.item.itemName.toString(),
                                    style: h5(
                                      context: context,
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      e.quantity.toString(),
                                      style: h7(context: context),
                                    ),
                                  ),
                                ],
                              ),
                              AppWidget.divider2(color: grey200),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ],
      ),
    ));
  }
}
