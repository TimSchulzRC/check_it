import 'package:check_it_fixed_version/models/snack_bar.dart';
import 'package:check_it_fixed_version/models/task_data.dart';
import 'package:check_it_fixed_version/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:check_it_fixed_version/widgets/tasks_list.dart';
import 'package:provider/provider.dart';
import 'add_task_screen.dart';
import 'package:check_it_fixed_version/constants.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  String number() {
    if (Provider.of<Data>(context).toDoNumber == 0) {
      return 'No Tasks To Do';
    }
    if (Provider.of<Data>(context).toDoNumber == 1) {
      return 'One Task To Do';
    } else {
      return '${Provider.of<Data>(context).toDoNumber.toString()} tasks to do';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kAccent,
        floatingActionButton: FloatingActionButton(
          tooltip: 'Create a Task',
          backgroundColor: kAccent,
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTaskScreen())),
            );
          },
          child: Icon(
            Icons.add,
            size: 40,
            color: kThemeColor,
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: 30.0, left: 20.0, right: 30.0, bottom: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                      hoverElevation: 0.0,
                      highlightElevation: 0.0,
                      elevation: 0.0,
                      backgroundColor: kThemeColor,
                      onPressed: () {
                        setState(() {});
                      },
                      child: Icon(
                        Icons.list,
                        size: 35,
                        color: kAccent,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Check it',
                          style: TextStyle(
                            fontFamily: 'Goldin',
                            color: kThemeColor,
                            fontSize: 38.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 20,
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            number(),
                            style: TextStyle(
                                color: kThemeColor,
                                fontSize: 15,
                                fontFamily: 'Goldin'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                  decoration: BoxDecoration(
                      color: kThemeColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(kRadius),
                        topLeft: Radius.circular(kRadius),
                      )),
                  child: Provider.of<Data>(context).tasks.isNotEmpty
                      ? TasksList(
                          showSnackBar: () {
                            Scaffold.of(context).showSnackBar(
                              RemovedSnackBar,
                            );
                          },
                        )
                      : NoTask(),
                ),
              ),
            ],
          ),
        ));
  }
}
