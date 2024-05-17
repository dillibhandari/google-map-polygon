import 'package:create_polygon/feature/permission/presentation/bloc/permission_bloc/permission_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> initialize() async {
  sl.registerFactory(() => PermissionBloc());
}


// PermissionBloc


