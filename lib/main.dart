import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/di/app_bindings.dart';
import 'features/vocabulary/presentation/screens/vocabulary_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);

runApp(const LingoBreezeApp());
}

class LingoBreezeApp extends StatelessWidget {
const LingoBreezeApp({super.key});

@override
Widget build(BuildContext context) {
return GetMaterialApp(
debugShowCheckedModeBanner: false,
title: 'LingoBreeze Vocabulary',
initialBinding: AppBindings(),
theme: ThemeData(
useMaterial3: true,
),
home: const VocabularyScreen(),
);
}
}
