import 'package:flutter/material.dart';
import 'package:check_it_fixed_version/constants.dart';

class TaskTile extends StatefulWidget {
  final String taskTitle;
  final String taskDetails;
  final bool isChecked;
  final Function checkBoxCallback;

  TaskTile({
    this.taskTitle,
    this.taskDetails,
    this.isChecked,
    this.checkBoxCallback,
  });

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        activeColor: kAccent,
        value: widget.isChecked,
        onChanged: widget.checkBoxCallback,
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.taskDetails != null
            ? <Widget>[
                Text(
                  widget.taskTitle,
                  style: TextStyle(
                      decoration:
                          widget.isChecked ? TextDecoration.lineThrough : null),
                ),
                Text(widget.taskDetails,
                    style: TextStyle(fontSize: 13, color: kTextGrey)),
              ]
            : <Widget>[
                Text(
                  widget.taskTitle,
                  style: TextStyle(
                      decoration:
                          widget.isChecked ? TextDecoration.lineThrough : null),
                ),
              ],
      ),
    );
  }
}
