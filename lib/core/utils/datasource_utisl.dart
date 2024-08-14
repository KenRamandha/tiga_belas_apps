
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tiga_belas_apps/core/errors/exceptions.dart';

class DataSourceUtils {
  const DataSourceUtils._();

  static Future<void> authorizeUser(FirebaseAuth auth) async {
    final user = auth.currentUser;
      if (user == null) {
        throw const ServerException(
          message: 'User is not authenticated',
          statusCode: '401',
        );
      }
  }
}
