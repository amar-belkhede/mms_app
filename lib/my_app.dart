import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/service/api_service.dart';
import 'features/authentication/bloc/auth_bloc.dart';
import 'features/common_import.dart';
import 'features/home/bloc/home_bloc.dart';
import 'go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        _configureApiService(),
      ],
      child: MultiBlocProvider(
        providers: [
          _configureAuthBloc(),
          _configureHomeBloc(),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          // routerConfig: mmsRouterConfig,
          routerDelegate: mmsRouterConfig.routerDelegate,
          routeInformationParser: mmsRouterConfig.routeInformationParser,

          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: AppColors.mms_color,
          ),
          // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }

  RepositoryProvider<ApiService> _configureApiService() {
    return RepositoryProvider(create: (context) => ApiService());
  }

  BlocProvider<AuthBloc> _configureAuthBloc() {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
    );
  }

  BlocProvider<HomeBloc> _configureHomeBloc() {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(RepositoryProvider.of<ApiService>(context)),
    );
  }
}
