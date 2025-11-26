import 'package:wdi/gen/assets.gen.dart';

class SiteProviderEntity {
  final String id;
  final String title;
  final String icon;
  final String description;

  SiteProviderEntity({
    required this.id,
    required this.title,
    required this.icon,
    required this.description,
  });
}

List<SiteProviderEntity> siteProviderList = [
  SiteProviderEntity(
    id: '1',
    title: 'Support 24/7',
    icon: Assets.icons.support,
    description: 'Top quialty 24/7 Support',
  ),
  SiteProviderEntity(
    id: '2',
    title: 'Free Shipping',
    icon: Assets.icons.freeShipping,
    description: 'Free shipping over 1000 AED',
  ),
  SiteProviderEntity(
    id: '3',
    title: 'Payment Secure',
    icon: Assets.icons.paymentSecurity,
    description: 'Got 100% Payment Safe',
  ),
  SiteProviderEntity(
    id: '4',
    title: '100% Money Back',
    icon: Assets.icons.cachBack,
    description: 'Cutomers Money Backs',
  ),
  SiteProviderEntity(
    id: '5',
    title: 'Quality Products',
    icon: Assets.icons.quality,
    description: 'We Insure Product Quailty',
  ),
];
