import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:news_brief/di/di.dart';

void setUpDio() {
  //dio.options.baseUrl = 'https://motorcycles-by-api-ninjas.p.rapidapi.com/v1/'; // общая часть адресов запросов
  dio.options.baseUrl = 'https://marvel-heroic-api-unlock-the-mcu-legendary-characters.p.rapidapi.com/'; // общая часть адресов запросов

  dio.options.queryParameters.addAll({
    'rapidapi-key': '02b95ecb4bmsh7f31cfbbef4a610p10c7a5jsn30d2253d1fcf', // сюда нужно будет подставить ключ/токен, выданный при регистрации
  });

  dio.options.connectTimeout = const Duration(minutes: 1);
  dio.options.receiveTimeout = const Duration(minutes: 1);

  dio.interceptors.addAll([
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printRequestData: true,
        printRequestHeaders: true,
      ),
    ),
  ]);
}
