import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_map_002/screens/map_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MapScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<dynamic> datas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Streamが扱うデータをDocumentSnapshotに変更
            StreamBuilder<DocumentSnapshot>(
              stream: getStream(),
              builder: (
                BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot,
              ) {
                if (snapshot.data == null) {
                  return const Text('empty');
                }
                return Text(snapshot.data!.data().toString());
              },
            ),
            // ElevatedButton(
            //   onPressed: onPressed,
            //   child: const Text('push'),
            // ),
          ],
        ),
      ),
    );
  }

  Stream<DocumentSnapshot> getStream() {
    final db = FirebaseFirestore.instance;
    final docRef = db.collection('users').doc('hogehoge');
    // ドキュメントのストリームを返す
    return docRef.snapshots();
  }
}
