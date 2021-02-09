import 'package:check_it_fixed_version/constants.dart';
import 'package:check_it_fixed_version/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskDialog extends StatefulWidget {
  final index;
  final data;
  final Function showSnackBar;
  TaskDialog({@required this.index, @required this.data, this.showSnackBar});

  @override
  _TaskDialogState createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  @override
  @override
  Widget build(BuildContext context) {
    return widget.index < widget.data.tasks.length
        ? GestureDetector(
            onTap: () {
              setState(() {
                FocusScope.of(context).requestFocus(FocusNode());
              });
            },
            child: SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kRadius)),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(border: InputBorder.none),
                      style: Theme.of(context).textTheme.headline6,
                      controller: TextEditingController(
                          text: widget.data.tasks[widget.index].name),
                      onChanged: (title) {
                        widget.data
                            .changeTitle(index: widget.index, title: title);
                      },
                    ),
                  ),
                  RemoveButton(
                    optionalAction: () {
                      Navigator.of(context).pop();
                      widget.showSnackBar();
                    },
                    data: widget.data,
                    index: widget.index,
                  ),
                ],
              ),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.sort,
                            color: kIconGrey,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextField(
                              controller: TextEditingController(
                                  text:
                                      widget.data.tasks[widget.index].details),
                              decoration: InputDecoration(
                                hintText: 'Add Details',
                                border: InputBorder.none,
                              ),
                              onChanged: (details) {
                                print(details);
                                if (details == '') {
                                  details = null;
                                }
                                widget.data.changeDetails(
                                    index: widget.index, details: details);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : SizedBox(height: 0, width: 0);
  }
}
