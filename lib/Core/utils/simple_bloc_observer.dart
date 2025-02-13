import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString());
    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase bloc) {
    log('${bloc.runtimeType} is created');
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    log('${bloc.runtimeType} is closed');
    super.onClose(bloc);
  }
}
