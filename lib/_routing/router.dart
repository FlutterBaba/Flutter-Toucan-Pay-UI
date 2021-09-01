import 'package:flutter/material.dart';
import 'package:flutter_toucanpay_ui/pages/home_page.dart';
import 'package:flutter_toucanpay_ui/pages/manage_page.dart';
import 'package:flutter_toucanpay_ui/pages/trade_page.dart';
import 'routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeViewRoute:
      return MaterialPageRoute(builder: (context) => HomePage());
    case tradeViewRoute:
      return MaterialPageRoute(builder: (context) => TradePage());
    case manageViewRoute:
      return MaterialPageRoute(builder: (context) => ManagePage());
    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}