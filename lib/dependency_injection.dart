import 'package:get_it/get_it.dart';
import 'package:time_co_shoots_price/provider/bottom_bar_provider.dart';
import 'package:time_co_shoots_price/service/price_service.dart';

GetIt getIt = GetIt.instance;

typedef ServiceDeclaration = void Function();

// ignore: prefer_function_declarations_over_variables
ServiceDeclaration declareDependencyInjection = () {
  declareService();
  declareProvider();
};

void declareProvider() {
  GetIt.I.registerSingleton(BottomBarProvider());
}
void declareService() {
  GetIt.I.registerSingleton(PriceService());
}
