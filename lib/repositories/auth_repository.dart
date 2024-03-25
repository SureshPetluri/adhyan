import 'package:get_storage/get_storage.dart';

import '../utils/constants.dart';

class AuthRepository {
  static final GetStorage _appStorage = GetStorage(Constants.Auth_Repo);

  static String? localLang() => _appStorage.read('locale');
  static  setLocalLang(String val) => _appStorage.write('locale',val);

  /// Setters
  setAccessToken(String value) => _appStorage.write('accessToken', value);
  /// Getters
  String? getAccessToken() => _appStorage.read('accessToken');
}
