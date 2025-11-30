import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wdi/core/bloc/bloc_observer.dart';
import 'package:wdi/features/buyer/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:wdi/features/buyer/features/product_details/presentation/pages/product_details.dart';
import '../../features/buyer/features/main/presentation/cubit/main_cubit.dart';
import '../../features/buyer/features/main/presentation/pages/main_screen.dart';
import '../const/app_const.dart';
import '../routes/pages_keys.dart';

class PageRoutes {
  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  static GoRouter router = GoRouter(
    errorBuilder: (context, state) => const ErorPage(),
    initialLocation: kInitialRoute.isEmpty
        ? '/${PagesKeys.mainScreen}'
        : kInitialRoute,
    observers: [MyNavigatorObserver()],
    routes: [
      GoRoute(
        name: PagesKeys.mainScreen,
        path: '/${PagesKeys.mainScreen}',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => MainCubit(),
            child: const MainScreen(),
          );
        },
      ),
      
      GoRoute(
        name: PagesKeys.productDetailsScreen,
        path: '/${PagesKeys.productDetailsScreen}/:productId',
        builder: (context, state) {
          final productId = state.pathParameters['productId'] ?? '';
          return BlocProvider(
            create: (context) {
              return ProductDetailsCubit(
                productId: productId,
              );
            },
            child: const ProductDetailsScreen(),
          );
        },
      ),
    ],
  );
  static void clearAndNavigate(String path) {
    while (router.canPop() == true) {
      router.pop();
    }
    router.goNamed(path);
  }
}

class ErorPage extends StatelessWidget {
  const ErorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Error')));
  }
}

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    PrintHelper('did push route ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    PrintHelper('did pop route ${route.settings.name}');
  }
}
