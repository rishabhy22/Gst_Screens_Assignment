import 'dart:async';

enum Routes {
  HOME,
  GSTSCREEN,
}

class RoutesBloc {
  static final RoutesBloc _routesBloc = RoutesBloc._internal();
  RoutesBloc._internal();
  factory RoutesBloc() => _routesBloc;

  static final StreamController<Routes> routeController =
      StreamController<Routes>();

  Function(Routes) get toRoute => routeController.sink.add;
  Stream<Routes> get getRoute => routeController.stream;

  void dispose() {
    if (!routeController.isClosed) routeController.close();
  }
}
