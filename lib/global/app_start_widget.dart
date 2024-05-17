import 'package:create_polygon/feature/permission/presentation/bloc/permission_bloc/permission_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:create_polygon/global/dependency_injection.dart' as di;

class AppStartWidget extends StatelessWidget {
  final Widget child;
  const AppStartWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<PermissionBloc>(create: (_) => di.sl<PermissionBloc>()),
    ], child: child);
  }
}
