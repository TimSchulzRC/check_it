import 'package:flutter/material.dart';
import 'package:check_it_fixed_version/constants.dart';

class AddButton extends StatelessWidget {
  final Function onPressed;
  AddButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        onPressed();
      },
      backgroundColor: kAccent,
      icon: Icon(
        Icons.add,
        color: kThemeColor,
      ),
      label: Text(
        'Add',
        style: TextStyle(color: kThemeColor),
      ),
    );
  }
}

class DetailsButton extends StatelessWidget {
  final Function onPressed;
  DetailsButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.sort,
        color: kAccent,
      ),
      padding: EdgeInsets.all(0.0),
      alignment: Alignment.centerLeft,
      onPressed: () {
        print('IconButton pressed');
        onPressed();
      },
    );
  }
}

class RemoveButton extends StatelessWidget {
  final index;
  final data;
  final Function optionalAction;
  RemoveButton({
    @required this.index,
    @required this.data,
    this.optionalAction,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.delete_forever,
        color: kIconGrey,
      ),
      onPressed: () async {
        await optionalAction();
        data.removeItem(index);
        print('IconButton pressed');
      },
    );
  }
}

class NoTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 2 / 3,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage('resources/clip-list-is-empty.png')),
            Text(
              'Create a Task',
              style: TextStyle(
                color: kThemeColorInverted,
                fontFamily: 'Goldin',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
