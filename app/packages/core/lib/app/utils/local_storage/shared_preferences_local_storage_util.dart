// ignore_for_file: avoid_dynamic_calls, type_annotate_public_apis

import 'package:core/app/utils/local_storage/ilocal_storage_util.dart';
import 'package:dependencies/dependencies.dart';

class SharedPreferencesLocalStorageUtil implements ILocalStorageUtil {
  SharedPreferences? prefs;
  String prefix = dotenv.env['ENVIRONMENT'] ?? 'dev';

  Future<void> _initialize() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  Function _getMethodByTypeForGet(ValuesTypes type) {
    final typeForMethod = <ValuesTypes, Function>{
      ValuesTypes.string: prefs!.getString,
      ValuesTypes.boolean: prefs!.getBool,
      ValuesTypes.stringList: prefs!.getStringList,
      ValuesTypes.integer: prefs!.getInt,
    };

    final func = typeForMethod[type] ?? prefs!.getString;
    return func;
  }

  Function _getMethodByTypeForSet(ValuesTypes type) {
    final typeForMethod = <ValuesTypes, Function>{
      ValuesTypes.string: prefs!.setString,
      ValuesTypes.boolean: prefs!.setBool,
      ValuesTypes.stringList: prefs!.setStringList,
      ValuesTypes.integer: prefs!.setInt,
    };

    final func = typeForMethod[type] ?? prefs!.setString;
    return func;
  }

  @override
  Future<T> getValue<T>(ValuesTypes type, String key) async {
    await _initialize();
    final method = _getMethodByTypeForGet(type);
    return method('$prefix@$key') as T;
  }

  @override
  Future<void> remove(String key) async {
    await _initialize();
    await prefs!.remove('$prefix@$key');
  }

  @override
  Future<void> setValue<T>(ValuesTypes type, String key, T) async {
    await _initialize();
    await _getMethodByTypeForSet(type)('$prefix@$key', T);
  }

  @override
  Future<void> clear() async {
    await _initialize();
    await prefs!.clear();
  }
}
