import 'package:core/src/abstractions/navigation_manager.dart';
import 'package:flutter/material.dart';

class NavigationManagerImpl implements NavigationManager {
  @override
  Future<T?> navigateTo<T>(
    BuildContext context,
    String route,
  ) {
    return Navigator.of(context).pushNamed(route);
  }

  @override
  Future<T?> navigateToWithArgs<T, TArgs>(
    BuildContext context,
    String route,
    TArgs args,
  ) {
    return Navigator.of(context).pushNamed(
      route,
      arguments: args,
    );
  }

  @override
  Future<T?> pushNamedAndRemoveUntil<T, TArgs>(
    BuildContext context,
    String route,
    RoutePredicate predicate, {
    TArgs? args,
  }) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      route,
      predicate,
      arguments: args,
    );
  }
}
