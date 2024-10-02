import 'package:flutter/material.dart';
import 'package:news_brief/di/di.dart';
import 'package:news_brief/news_brief.dart';
//import 'package:permission_handler/permission_handler.dart';

void main() async {
  // Проверка разрешения
// if (await Permission.camera.isGranted) {
//   // Доступ к камере разрешен
// } else {
//   // Запрос разрешения
//   var status = await Permission.camera.request();
//   if (status.isGranted) {
//     // Доступ к камере разрешен
//   } else {
//     // Доступ к камере отклонен
//   }
// }

  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  FlutterError.onError = (details) => talker.handle(
        details.exception,
        details.stack,
      );
  runApp(const MyApk());
}
