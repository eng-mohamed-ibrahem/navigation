import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferenceProvider = FutureProvider<SharedPreferences>(
  (ref) async {
    return await SharedPreferences.getInstance();
  },
);
