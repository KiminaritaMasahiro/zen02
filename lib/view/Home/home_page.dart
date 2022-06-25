import 'package:flutter/material.dart';
import 'package:zen02/view/Home/TodoTile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textFieldController = TextEditingController();
    // ignore: unused_local_variable
    String? newText;

    void clearTextField() {
      textFieldController.clear();
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int x) {
                  return const TodoTile();
                },
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 130,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 189, 243, 255),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Text(
                            "すべて",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "完了",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "未完了",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: TextField(
                        style: const TextStyle(fontSize: 25),
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.clear,
                              color: Colors.black,
                            ),
                            onPressed: clearTextField,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
