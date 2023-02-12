import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/firebase_provider/collection_firebase.dart';
import 'package:cmms/common/model/notification/NotificationModel.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';

class NotificationRepository {
  //Dio client;
//  NotificationRepository({required this.client});
  List<NotificationModel> listNotificationModel = [];

  Future<List<NotificationModel>> getNotification() async {
    var respList = await Future.wait([
      getValueString(SharedPrefKey.idUser),
      getValueString(SharedPrefKey.domain)
    ]);
    String idUser = respList[0].toString();
    String domain = respList[1].toString();

    var raw = (await FirebaseFirestore.instance
        .collection(CollectionFirebase.notification)
        .where('domain', isEqualTo: domain)
        .where('user_id_receive', isEqualTo: idUser)
        .orderBy('send_time_index', descending: true)
        //  .limit(offset)
        .get());

    listNotificationModel =
        raw.docs.map((e) => NotificationModel.fromJson(e.data())).toList();
    return listNotificationModel;
  }

  Future<void> readNotification(int status, String idNoti) async {
    (await FirebaseFirestore.instance
        .collection(CollectionFirebase.notification)
        .doc(idNoti)
        .update({'status': status}));
  }
}
