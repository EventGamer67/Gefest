import 'package:flutter/material.dart';
import 'package:gefest/presentation/screens/dashboard/dashboard.dart';
import 'package:gefest/presentation/screens/groups/groups.dart';
import 'package:gefest/presentation/screens/login/login.dart';
import 'package:gefest/presentation/screens/panel/panel_scaffold.dart';
import 'package:gefest/presentation/screens/schedule/schedule.dart';
import 'package:gefest/presentation/screens/teachers/teachers.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  redirect: (context, state) {
    if (GetIt.I.get<Supabase>().client.auth.currentUser == null) {
      return '/login';
    } else {
      return null;
    }
  },
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) {
        if (GetIt.I.get<Supabase>().client.auth.currentUser == null) {
          return const LoginScreen();
        } else {
          return const DashBoardScreen();
        }
      },
    ),
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => PanelScaffold(child: child),
        routes: [
          GoRoute(
            path: '/dashboard',
            pageBuilder: (context, state) {
              return transitionPage(state,DashBoardScreen());
            },
          ),
          GoRoute(
            path: '/schedule',
            pageBuilder: (context, state) {
              return transitionPage(state,ScheduleScreen());
            },
          ),
          GoRoute(
            path: '/teachers',
            pageBuilder: (context, state) {
              return transitionPage(state, TeachersScreen());
            },
          ),
          GoRoute(
            path: '/groups',
            pageBuilder: (context, state) {
              return transitionPage(state, GroupsScreen());
            },
          ),
        ]),
  ],
);


CustomTransitionPage transitionPage(state,page) {
  return CustomTransitionPage(
      key: state.pageKey,
      child: page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Change the opacity of the screen using a Curve based on the the animation's
        // value
        return FadeTransition(
          opacity:
              CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
}