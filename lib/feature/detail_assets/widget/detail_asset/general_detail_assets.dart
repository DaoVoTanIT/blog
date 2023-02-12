import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/model/assets/assets_model.dart';
import 'package:cmms/common/util/config.dart';
import 'package:cmms/common/widget/section_box.dart';
import 'package:cmms/feature/assets_maintenance/widget/information_assets.dart';
import 'package:cmms/feature/detail_assets/screen/detail_assets_sub.dart';
import 'package:cmms/translations/export_lang.dart';
import 'package:flutter/material.dart';
import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';

class GeneralDetailAssets extends StatefulWidget {
  const GeneralDetailAssets({Key? key, required this.assetsDb})
      : super(key: key);
  final AssetsDb assetsDb;

  @override
  State<GeneralDetailAssets> createState() => _GeneralDetailAssetsState();
}

class _GeneralDetailAssetsState extends State<GeneralDetailAssets> {
  bool darkMode = false;
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
          assetsDb.listSubAsset!.isEmpty
              ? Container()
              : SectionBox(
                  paddingHorizontal: 16,
                  icon: line,
                  title: 'Sub assets',
                  child: Column(
                    children: [
                      ...assetsDb.listSubAsset!.asMap().entries.map(
                            (e) => Column(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailAssetsSub(
                                                assetsDb: assetsDb
                                                    .listSubAsset![e.key],
                                              )),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Stack(children: [
                                        CachedNetworkImage(
                                          imageUrl:
                                              e.value.db.imageUrl.toString(),
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: const BoxDecoration(
                                              color: grey300,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            right: 0,
                                            top: 0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 2,
                                                    color: backgroundWhite),
                                                borderRadius:
                                                    BorderRadius.circular(90.0),
                                                color: greenDeep,
                                              ),
                                              child: Container(
                                                width: 13,
                                                height: 13,
                                                decoration: BoxDecoration(
                                                    color: malachite,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: malachite
                                                              .withOpacity(0.5),
                                                          blurRadius: 8)
                                                    ]),
                                              ),
                                            ))
                                      ]),
                                      const SizedBox(
                                        width: 28,
                                      ),
                                      Text(
                                        e.value.db.assetName.toString(),
                                        style: h5(
                                            context: context,
                                            fontWeight: '400',
                                            color: black),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ]),
                          )
                    ],
                  ),
                ),
          const SizedBox(
            height: 10,
          ),
          SectionBox(
              paddingHorizontal: 16,
              icon: line,
              title: LocaleKeys.general.tr(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Serial number',
                      style: h5(context: context, fontWeight: '700'),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      assetsDb.db.serialNumber,
                      style: h5(
                          context: context, color: Theme.of(context).color10),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Model',
                      style: h5(context: context, fontWeight: '700'),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      assetsDb.db.model,
                      style: h5(
                          context: context, color: Theme.of(context).color10),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Manufacturer',
                      style: h5(context: context, fontWeight: '700'),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      assetsDb.db.manufacturerCode,
                      style: h5(
                          context: context, color: Theme.of(context).color10),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Description',
                      style: h5(context: context, fontWeight: '700'),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      assetsDb.db.description,
                      style: h5(
                          context: context, color: Theme.of(context).color10),
                    ),
                  ])),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SectionBox(
                paddingHorizontal: 16,
                icon: line,
                title: 'Vendor',
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vendor',
                        style: h5(context: context, fontWeight: '700'),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        assetsDb.db.vendor.toString(),
                        style: h5(
                            context: context, color: Theme.of(context).color10),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Date Purchase',
                        style: h5(context: context, fontWeight: '700'),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        assetsDb.db.datePurchase == null
                            ? ''
                            : formatHour.format(assetsDb.db.datePurchase!),
                        style: h5(
                            context: context, color: Theme.of(context).color10),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Date Install',
                        style: h5(context: context, fontWeight: '700'),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        assetsDb.db.dateInstall == null
                            ? ''
                            : formatHour.format(assetsDb.db.dateInstall!),
                        style: h5(
                            context: context, color: Theme.of(context).color10),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Warranty Time',
                        style: h5(context: context, fontWeight: '700'),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        assetsDb.db.warrantyTime == 0
                            ? ''
                            : '${assetsDb.db.warrantyTime} tháng',
                        style: h5(
                            context: context, color: Theme.of(context).color10),
                      ),
                    ])),
          )
        ],
      ),
    ));
  }
}
