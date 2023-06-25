enum ValuesTypes { string, boolean, integer, stringList }

abstract class ILocalStorageUtil {
  Future<void>? setValue<T>(ValuesTypes type, String key, T value);
  Future<T> getValue<T>(ValuesTypes type, String key);
  Future<void> remove(String key);
  Future<void> clear();
}
