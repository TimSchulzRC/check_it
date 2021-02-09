import 'package:check_it_fixed_version/models/task_data.dart';
import 'package:check_it_fixed_version/models/tasks.dart';
import 'package:check_it_fixed_version/widgets/my_reorderable_list_view.dart';
import 'package:flutter/material.dart';
import 'package:check_it_fixed_version/constants.dart';
import 'package:provider/provider.dart';
import 'package:check_it_fixed_version/screens/task_dialog.dart';
import 'task_tile.dart';

class TasksList extends StatefulWidget {
  final showSnackBar;
  TasksList({this.showSnackBar});

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MyReorderableListView(
      onReorder: (oldIndex, newIndex) async {
        setState(() {
          Provider.of<Data>(context, listen: false)
              .reorderItems(oldIndex, newIndex);
        });
      },
      children: List.generate(Provider.of<Data>(context).tasks.length, (index) {
        return _buildItem(index);
      }),
    );
  }

  Widget _buildItem(index) {
    Task task = Provider.of<Data>(context).tasks[index];
    return Dismissible(
      onDismissed: (direction) {
        setState(() {
          Provider.of<Data>(context, listen: false).removeItem(index);
          widget.showSnackBar();
        });
      },
      key: UniqueKey(),
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadius)),
        child: InkWell(
            customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kRadius)),
            onTap: () async {
              await showDialog(
                  context: context,
                  builder: (context) {
                    return TaskDialog(
                      index: index,
                      data: Provider.of<Data>(context, listen: false),
                      showSnackBar: widget.showSnackBar,
                    );
                  });
              setState(() {});
            },
            child: TaskTile(
              taskTitle: task.name,
              taskDetails: task.details,
              isChecked: task.isDone,
              checkBoxCallback: (checkboxState) {
                setState(() {
                  Provider.of<Data>(context, listen: false).toggleDone(index);
                });
              },
            )),
      ),
    );
  }
}
