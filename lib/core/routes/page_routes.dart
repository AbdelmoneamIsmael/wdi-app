import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wdi/core/bloc/bloc_observer.dart';
import 'package:wdi/features/auth/features/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:wdi/features/auth/features/sign_in/presentation/pages/sign_in_screen.dart';
import 'package:wdi/features/auth/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:wdi/features/auth/features/sign_up/presentation/pages/sign_up_screen.dart';
import 'package:wdi/features/buyer/features/account/presentation/cubit/account_cubit.dart';
import 'package:wdi/features/buyer/features/account/presentation/pages/account_screen.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:wdi/features/buyer/features/checkout/presentation/pages/check_out_screen.dart';
import 'package:wdi/features/buyer/features/help_support/presentation/cubit/help_support_cubit.dart';
import 'package:wdi/features/buyer/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:wdi/features/buyer/features/notification/presentation/pages/notification_screen.dart';
import 'package:wdi/features/buyer/features/product_details/presentation/cubit/product_details_cubit.dart';
import 'package:wdi/features/buyer/features/product_details/presentation/pages/product_details.dart';
import '../../features/buyer/features/main/presentation/cubit/main_cubit.dart';
import '../../features/buyer/features/main/presentation/pages/main_screen.dart';
import '../const/app_const.dart';
import '../routes/pages_keys.dart';
import '../../features/buyer/features/profile/presentation/cubit/profile_cubit.dart';
import '../../features/buyer/features/profile/presentation/pages/profile_screen.dart';
import '../../features/buyer/features/addresses/presentation/cubit/addresses_cubit.dart';
import '../../features/buyer/features/payment_methods/presentation/cubit/payment_methods_cubit.dart';
import '../../features/buyer/features/coupons/presentation/cubit/coupons_cubit.dart';
import '../../features/buyer/features/addresses/presentation/pages/addressess_screen.dart';
import '../../features/buyer/features/payment_methods/presentation/pages/payment_methods.dart';
import '../../features/buyer/features/coupons/presentation/pages/coupons_screen.dart';
import '../../features/buyer/features/wishlist/presentation/pages/wish_list_screen.dart';
import '../../features/buyer/features/loyalty_program/presentation/pages/loyalty_screen.dart';
import '../../features/buyer/features/notifications_and_preferances/presentation/pages/notification_and_preferances_screen.dart';
import '../../features/buyer/features/help_support/presentation/pages/help_and_support_screen.dart';

import '../../features/buyer/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import '../../features/buyer/features/loyalty_program/presentation/cubit/loyalty_program_cubit.dart';
import '../../features/buyer/features/notifications_and_preferances/presentation/cubit/notifications_cubit.dart';

class PageRoutes {
  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  static GoRouter router = GoRouter(
    redirect: (context, state) {
      PrintHelper('redirect: ${state.matchedLocation}');
      return null;
    },
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
              return ProductDetailsCubit(productId: productId);
            },
            child: const ProductDetailsScreen(),
          );
        },
      ),
      GoRoute(
        name: PagesKeys.checkOut,
        path: '/${PagesKeys.checkOut}',
        builder: (context, state) {
          return BlocProvider(
            create: (context) {
              return CheckoutCubit();
            },
            child: const CheckOutScreen(),
          );
        },
      ),

      GoRoute(
        name: PagesKeys.profile,
        path: '/${PagesKeys.profile}',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => ProfileCubit(),
            child: const ProfileScreen(),
          );
        },
      ),
      GoRoute(
        name: PagesKeys.addresses,
        path: '/${PagesKeys.addresses}',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => AddressesCubit(),
            child: const AddressesScreen(),
          );
        },
      ),
      GoRoute(
        name: PagesKeys.paymentMethods,
        path: '/${PagesKeys.paymentMethods}',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => PaymentMethodsCubit(),
            child: const PaymentMethodsScreen(),
          );
        },
      ),
      GoRoute(
        name: PagesKeys.coupons,
        path: '/${PagesKeys.coupons}',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => CouponsCubit(),
            child: const CouponsScreen(),
          );
        },
      ),
      GoRoute(
        name: PagesKeys.wishlist,
        path: '/${PagesKeys.wishlist}',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => WishlistCubit(),
            child: const WishListScreen(),
          );
        },
      ),
      GoRoute(
        name: PagesKeys.loyaltyProgram,
        path: '/${PagesKeys.loyaltyProgram}',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => LoyaltyProgramCubit(),
            child: const LoyaltyProgramScreen(),
          );
        },
      ),
      GoRoute(
        name: PagesKeys.notificationsAndPreferance,
        path: '/${PagesKeys.notificationsAndPreferance}',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => NotificationsAndPreferencesCubit(),
            child: const NotificationsAndPreferencesScreen(),
          );
        },
      ),
      GoRoute(
        name: PagesKeys.helpAndSupport,
        path: '/${PagesKeys.helpAndSupport}',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => HelpSupportCubit(),
            child: const HelpAndSupportScreen(),
          );
        },
      ),
      GoRoute(
        name: PagesKeys.personalInformation,
        path: '/${PagesKeys.personalInformation}',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => AccountCubit(),
            child: const AccountScreen(),
          );
        },
      ),
      GoRoute(
        name: PagesKeys.notification,
        path: '/${PagesKeys.notification}',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => NotificationCubit(),
            child: const NotificationScreen(),
          );
        },
      ),
      GoRoute(
        name: PagesKeys.signIn,
        path: '/${PagesKeys.signIn}',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SignInCubit(),
            child: const SignInScreen(),
          );
        },
      ),
      GoRoute(
        name: PagesKeys.signUp,
        path: '/${PagesKeys.signUp}',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SignUpCubit(),
            child: const SignUpScreen(),
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
