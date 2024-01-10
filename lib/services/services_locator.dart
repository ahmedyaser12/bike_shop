import 'package:get_it/get_it.dart';

import '../screens/home_screen/view_model/home_screen_view_model.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerFactory(() => HomeScreenViewModel());
}
