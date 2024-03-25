import 'package:get_storage/get_storage.dart';

import 'constants.dart';

/// Initialize classes that handle data/ business logic
class DependencyInjection {
  /// Initialize app wide Repositories, Services, Utilities here
  static void init() async {
    /// Repositories
    await GetStorage.init(Constants.Auth_Repo);
  }
}
