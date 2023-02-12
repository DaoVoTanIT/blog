import 'package:cmms/app/animation_click.dart';
import 'package:cmms/common/model/assets/assets_model.dart';
import 'package:cmms/common/route/routes.dart';
import 'package:cmms/common/util/config.dart';
import 'package:cmms/feature/assets_maintenance/widget/information_assets.dart';
import 'package:cmms/feature/detail_assets/widget/information_assets.dart';
import 'package:cmms/feature/home_dashboard/widget/to_to_list.dart';
import 'package:cmms/translations/export_lang.dart';
import 'package:flutter/material.dart';
import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';

class WorkOrdersDetailAssets extends StatefulWidget {
  const WorkOrdersDetailAssets({Key? key, required this.assetsDb})
      : super(key: key);
  final AssetsDb assetsDb;

  @override
  State<WorkOrdersDetailAssets> createState() => _WorkOrdersDetailAssetsState();
}

class _WorkOrdersDetailAssetsState extends State<WorkOrdersDetailAssets> {
  bool darkMode = false;
  DateFormat formatDate = DateFormat(formatDateTimeString);
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
                          Navigator.of(context).pushNamed(
                            Routes.detailWorkOrder,
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: ToDoList(
                            device:
                                'Máy cắt thuỷ lực 150 tấn - Kiểm tra đầu giờ',
                            code: '#WO1122/2022',
                            level: 'High',
                            requestedBy: 'Requested by Thanh Le',
                            time: DateTime.now(),
                            status: 'In Progress',
                          ),
                        ))
                  ]),
            )));
  }
}
