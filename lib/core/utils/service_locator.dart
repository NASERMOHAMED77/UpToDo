// ignore_for_file: non_constant_identifier_names

import 'package:firee/features/login_screen/data/repo/login_repo_imp.dart';
import 'package:get_it/get_it.dart';

 var  get_it = GetIt.instance;
void get_locator() {
  
  get_it.registerSingleton<X>(X());
}