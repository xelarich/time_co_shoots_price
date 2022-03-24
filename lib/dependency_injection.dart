import 'package:get_it/get_it.dart';
import 'package:time_co_shoots_price/provider/bottom_bar_provider.dart';

GetIt getIt = GetIt.instance;

typedef ServiceDeclaration = void Function();

// ignore: prefer_function_declarations_over_variables
ServiceDeclaration declareServices = () {
  GetIt.I.registerSingleton(BottomBarProvider());
};
