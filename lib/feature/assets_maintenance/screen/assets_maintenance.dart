import 'package:cmms/common/model/assets/assets_model.dart';
import 'package:cmms/feature/assets_maintenance/assets_bloc/asset/bloc/assets.dart';
import 'package:cmms/feature/assets_maintenance/widget/information_assets.dart';
import 'package:cmms/feature/detail_assets/screen/detail_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';

class AssetsMaintenancePage extends StatefulWidget {
  const AssetsMaintenancePage({Key? key}) : super(key: key);

  @override
  State<AssetsMaintenancePage> createState() => _AssetsMaintenancePageState();
}

class _AssetsMaintenancePageState extends State<AssetsMaintenancePage> {
  bool darkMode = false;
  String domain = '';
  var isExpanded = false;
  AssetsModel assetsModel = AssetsModel(data: []);
  late AssetsBloc assetsBloc;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    getDomain();
    assetsBloc = BlocProvider.of<AssetsBloc>(context);
    assetsBloc.add(GetAllAssetsEvent());
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
        body: RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(milliseconds: 1000));
        assetsBloc.add(GetAllAssetsEvent());
      },
      child: BlocBuilder<AssetsBloc, AssetsState>(
        builder: (context, state) {
          if (state is AssetsSucsses) {
            assetsModel = state.assetsModel;
          }
          return ListView.builder(
              itemCount: assetsModel.data.length,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailAssets(
                                  assetsDb: assetsModel.data[index],
                                )),
                      );
                    },
                    child: informationAssets(
                      context,
                      assetsModel.data[index],
                    ),
                  ));
          // return informationAssets(
          //   context,
          //   assetsModel.data,
          // );
        },
      ),
    ));
  }
}
