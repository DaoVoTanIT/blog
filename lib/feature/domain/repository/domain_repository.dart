import 'package:dio/dio.dart';
import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';

class DomainRepository {
  Dio client;
  DomainRepository({required this.client});
  Future<void> checkToken(String domain) async {
    try {
      await client.getUri(Uri.parse('https://${domain.trim()}'));
      await setValueString(SharedPrefKey.domain, domain.trim());
      // It's better to return a Model class instead but this is
      // only for example purposes only

    } catch (ex) {
      print(ex);
      // Assuming there will be an errorMessage property in the JSON object

      throw Error();
    }
  }
}
