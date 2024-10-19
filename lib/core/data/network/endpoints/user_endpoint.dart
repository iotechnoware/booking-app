import 'package:gofly/core/data/network/network_config.dart';

class UserEndpoints
{
  static String login= NetworkConfig.getFullApiUrl('auth/login');
  static String register = NetworkConfig.getFullApiUrl('auth/register');
  static String getFlight = NetworkConfig.customGetFullApiUrl('aviasales/v3/prices_for_dates');
}