import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/auth/bloc/auth_bloc.dart';
import 'features/common_import.dart';
import 'go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        _configureAuthBloc(),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        // routerConfig: mmsRouterConfig,
        routerDelegate: mmsRouterConfig.routerDelegate,
        routeInformationParser: mmsRouterConfig.routeInformationParser,

        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }

  BlocProvider<AuthBloc> _configureAuthBloc() {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
    );
  }
}
