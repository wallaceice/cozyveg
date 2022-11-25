import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth_bloc.dart';
import 'screens/general_info_screen.dart';
import 'screens/list_cart.dart';
import 'screens/products_screen.dart';

import 'bloc/manage_bloc.dart';
import 'bloc/monitor_bloc.dart';
import 'screens/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAZwEuWIbbTRhod9Vm7ZE5t9djhd4v4NPM",
          appId: "1:379357137939:web:a166812788ec3f39ec83e6",
          messagingSenderId: "379357137939",
          projectId: "ecozyveg-de2e4",
          authDomain: "ecozyveg-de2e4.firebaseapp.com",
          storageBucket: "ecozyveg-de2e4.appspot.com"));
  runApp(const MyApp());
}

///*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecozy Veg',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Ecozy Veg'),
    );
  }
}
//*/
/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ecozy Veg',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: MultiBlocProvider(providers: [
          BlocProvider(create: (context) => AuthBloc()),
        ], child: const Wrapper()));
  }
}
*/

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(tabs: [
                Tab(icon: Icon(Icons.person_outline_outlined)),
                Tab(icon: Icon(Icons.person_outline_outlined)),
                Tab(icon: Icon(Icons.food_bank_sharp)),
                Tab(icon: Icon(IconData(0xe59c, fontFamily: 'MaterialIcons'))),
              ]),
              title: Row(
                children: [
                  ClipRRect(
                      child: Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                  )),
                  const Text("Ecozy Veg",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Color.fromARGB(255, 250, 225, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                ],
              ),
              shadowColor: Colors.blue,
            ),
            body: MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => ManageBloc()),
                BlocProvider(create: (_) => MonitorBloc()),
              ],
              child: TabBarView(
                children: [
                  const StudentScreen(),
                  //CadastroCliente(),
                  MultiBlocProvider(providers: [
                    BlocProvider(create: (context) => AuthBloc()),
                  ], child: const Wrapper()),
                  const CompleteForm(),
                  ListCart(),
                ],
              ),
            )));
  }
}


/*
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(tabs: [
                Tab(icon: Icon(Icons.person_outline_outlined)),
                Tab(icon: Icon(Icons.person_outline_outlined)),
                Tab(icon: Icon(Icons.food_bank_sharp)),
                Tab(icon: Icon(IconData(0xe59c, fontFamily: 'MaterialIcons'))),
              ]),
              title: Row(
                children: [
                  ClipRRect(
                      child: Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                  )),
                  const Text("Ecozy Veg",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Color.fromARGB(255, 250, 225, 3),
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                ],
              ),
              shadowColor: Colors.blue,
            ),
            body: MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => ManageBloc()),
                BlocProvider(create: (_) => MonitorBloc()),
              ],
              child: TabBarView(
                children: [
                  const StudentScreen(),
                  CadastroCliente(),
                  //RegisterScreen(),
                  const CompleteForm(),
                  ListCart(),
                ],
              ),
            )));
  }
}
*/
