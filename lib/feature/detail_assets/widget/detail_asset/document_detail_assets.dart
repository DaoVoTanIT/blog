import 'package:cmms/app/animation_click.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/model/assets/assets_model.dart';
import 'package:cmms/common/util/config.dart';
import 'package:cmms/common/util/format_time.dart';
import 'package:cmms/feature/assets_maintenance/widget/information_assets.dart';
import 'package:cmms/translations/export_lang.dart';
import 'package:flutter/material.dart';
import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';

class DocumentDetailAssets extends StatefulWidget {
  const DocumentDetailAssets({Key? key, required this.assetsDb})
      : super(key: key);
  final AssetsDb assetsDb;

  @override
  State<DocumentDetailAssets> createState() => _DocumentDetailAssetsState();
}

class _DocumentDetailAssetsState extends State<DocumentDetailAssets> {
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
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      informationAssets(context, assetsDb),
                      AnimationClick(
                          function: () {
                            // Navigator.of(context).pushNamed(
                            //   Routes.detailAssets,
                            // );
                          },
                          child: assetsDb.db.cmmsAssetDocuments.isEmpty
                              ? Container()
                              : Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(24),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: color4.withOpacity(0.04),
                                            offset: const Offset(0, 5),
                                            blurRadius: 10)
                                      ],
                                      color: grey100,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Column(
                                    children: [
                                      ...assetsDb.db.cmmsAssetDocuments
                                          .map((e) => Row(children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 24, bottom: 8),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width: 50,
                                                          height: 70,
                                                          child: Stack(
                                                            children: [
                                                              const Positioned(
                                                                top: 0,
                                                                child: SizedBox(
                                                                  child: Icon(
                                                                    Icons
                                                                        .insert_drive_file,
                                                                    size: 50,
                                                                    color:
                                                                        grey400,
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                  top: 23,
                                                                  child:
                                                                      Container(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            5,
                                                                        vertical:
                                                                            3),
                                                                    decoration: BoxDecoration(
                                                                        color: e.fileType == 'image/jpeg'
                                                                            ? yellow500
                                                                            : e.fileType == 'image/png'
                                                                                ? yellow500
                                                                                : e.fileType == 'application/pdf'
                                                                                    ? Colors.red
                                                                                    : e.fileType == 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
                                                                                        ? Colors.green
                                                                                        : e.fileType == 'application/msword'
                                                                                            ? blueDocument.withOpacity(0.7)
                                                                                            : blueDocument.withOpacity(0.5),
                                                                        borderRadius: BorderRadius.circular(3)),
                                                                    child: Text(
                                                                      e.fileType ==
                                                                              'image/jpeg'
                                                                          ? 'JPEG'
                                                                          : e.fileType == 'image/png'
                                                                              ? 'PNG'
                                                                              : e.fileType == 'application/pdf'
                                                                                  ? 'PDF'
                                                                                  : e.fileType == 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
                                                                                      ? 'XLS'
                                                                                      : e.fileType == 'application/msword'
                                                                                          ? 'DOC'
                                                                                          : 'DOC',
                                                                      style: h10(
                                                                          context:
                                                                              context,
                                                                          fontWeight:
                                                                              '700',
                                                                          color:
                                                                              backgroundWhite),
                                                                    ),
                                                                  )),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Expanded(
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                      Text(
                                                        e.documentName
                                                            .toString(),
                                                        style: h5(
                                                            color: black,
                                                            fontWeight: '700'),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 8),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              FormatTime.timeAgo(
                                                                  e.createDate!),
                                                              style: h8(
                                                                  context:
                                                                      context,
                                                                  color:
                                                                      grey800),
                                                            ),
                                                            Text(
                                                              ' - ${e.commonCode?.codeName ?? ''}',
                                                              style: h8(
                                                                  context:
                                                                      context,
                                                                  color:
                                                                      greenDeep),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ])),
                                              ]))
                                    ],
                                  )))
                    ]))));
  }
}
