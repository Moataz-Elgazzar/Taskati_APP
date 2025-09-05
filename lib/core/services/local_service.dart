import 'package:hive/hive.dart';

class LocalHelper {
  static late Box userBox;
  static String kName = 'name';
  static String kImage = 'image';
  static String kIsUploaded = 'isUploaded';

  static init() async {
    await Hive.openBox('user Box');
    userBox = Hive.box('user Box');
  }

  static putData(String key, dynamic value) {
    return userBox.put(key, value);
  }

  static getData(String key) {
    return userBox.get(key);
  }

  static putUserData(String name, String image) {
    putData(kName, name);
    putData(kImage, image);
    putData(kIsUploaded, true);
  }
}
