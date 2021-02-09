import 'package:check_it_fixed_version/models/task_data.dart';
import 'package:check_it_fixed_version/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:check_it_fixed_version/constants.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  static String newTaskTitle;
  static String newTaskDetails;
  List<TextField> textFields = [
    TextField(
      cursorColor: kAccent,
      style: TextStyle(fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintStyle: TextStyle(fontWeight: FontWeight.normal, color: kTextGrey),
        hintText: 'New Task',
      ),
      textAlign: TextAlign.left,
      autofocus: true,
      onChanged: (newText) {
        newTaskTitle = newText;
      },
    ),
  ];

  static FocusNode detailsFocusNode;

  @override
  void initState() {
    detailsFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    detailsFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(kRadius),
            topLeft: const Radius.circular(kRadius),
          ),
          color: kThemeColor,
        ),
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 5, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: textFields,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DetailsButton(
                  onPressed: () {
                    setState(() {
                      if (textFields.length == 1) {
                        textFields.add(
                          TextField(
                            cursorColor: kAccent,
                            style: TextStyle(
                                color: kThemeColorInverted, fontSize: 12),
                            focusNode: detailsFocusNode,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Details',
//                              labelStyle: TextStyle(color: kThemeColorInverted),
                            ),
                            textAlign: TextAlign.left,
                            onChanged: (newDetails) {
                              newTaskDetails = newDetails;
                            },
                          ),
                        );
                      }
                    });
                    detailsFocusNode.requestFocus();
                  },
                ),
                AddButton(
                  onPressed: () {
                    setState(() {
                      if (newTaskTitle != null && newTaskTitle != '') {
                        if (newTaskDetails == '') {
                          newTaskDetails = null;
                        }

//                        var newTask = Task(
//                          position: number,
//                          name: newTaskTitle,
//                          details: newTaskDetails,
//                        );
                        Provider.of<Data>(context, listen: false).newTask(
                            name: newTaskTitle, details: newTaskDetails);
                        newTaskDetails = null;
                        newTaskTitle = null;
                        Navigator.pop(context);
                      } else {
                        Navigator.pop(context);
                      }
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
