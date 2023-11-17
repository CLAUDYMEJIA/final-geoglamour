import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';




// Instancia del package
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();


// Este es el método que inicializa el objeto de notificaciones
Future<void> initNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('app_icon');

  const DarwinInitializationSettings initializationSettingsIOS =
  DarwinInitializationSettings();

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}


// Este es el método que muestra la notificación
Future<void> showNotificacion() async {
  const AndroidNotificationDetails androidNotificationDetails =
  AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    importance: Importance.max,
    priority: Priority.high,
  );

  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
  );

  await flutterLocalNotificationsPlugin.show(
      1,
      'Titulo de notificacion',
      'Esta es una notificación de prueba para mostrar en el canal. Los quiero mucho.',
      notificationDetails);
}



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Aquí inicializamos la instancia de notificaciones
  await initNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const PaginaPrincipal(),
      ),
    );
  }
}

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            // Aquí debemos mostrar la notificación
            showNotificacion();
          },
          child: const Text('Mostrar la notificación')),
    );
  }
}