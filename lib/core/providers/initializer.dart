// coverage:ignore-file

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'initializer.config.dart';

///
final GetIt injector = GetIt.instance;

///
/// Setup injector
///
@InjectableInit()
Future<GetIt> initializeInjections() async => GetIt.I.init();
