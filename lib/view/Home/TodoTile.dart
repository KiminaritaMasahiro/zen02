import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 3,
        ),
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
            color: const Color.fromARGB(255, 230, 244, 255),
            elevation: 100,
            child: SizedBox(
              child: ListTile(
                leading: null,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "どうぞ",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "2022/6/25 10:21",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
                trailing: CupertinoSwitch(
                  value: true,
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
