// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (value) {
                  print('削除');
                },
                spacing: 10,
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: '削除',
              ),
            ],
          ),
          child: Material(
            elevation: 2,
            child: SizedBox(
              height: 70,
              child: ListTile(
                leading: null,
                title: const Text(
                  "どうぞよろしくお",
                  style: TextStyle(fontSize: 25),
                ),
                trailing: CupertinoSwitch(
                  value: false,
                  onChanged: (val) {},
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
