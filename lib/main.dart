import 'package:check_it_fixed_version/models/task_data.dart';
import 'package:check_it_fixed_version/utils/database.dart';
import 'package:flutter/material.dart';
import 'package:check_it_fixed_version/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'screens/tasks_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() =>
    runApp(ChangeNotifierProvider(create: (context) => Data(), child: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool haveData = false;
  SharedPreferences sharedPreferences;

  getData() async {
    await DBProvider.db.getTasks(Provider.of<Data>(context).tasks);
//    Navigator.pop(context);
    if (!haveData) {
      setState(() {});
    }
    haveData = true;
  }

  @override
  void initState() {
    initSharedPreferences();
    super.initState();
  }

  initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    Provider.of<Data>(context).getToDoNumber();
    return MaterialApp(
      title: 'CheckIT',
      theme: appTheme,
      home: Scaffold(
          body: ModalProgressHUD(
        child: TasksScreen(),
        inAsyncCall: !haveData,
        opacity: 1,
        color: Colors.white,
        progressIndicator: CircularProgressIndicator(
          backgroundColor: Colors.redAccent,
        ),
      )),
    );
  }
}
