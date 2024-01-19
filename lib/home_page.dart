import 'package:flutter/material.dart';
import 'package:flutter_sqlite_example/database/database_sqlite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _dataBase();
  }

  Future<void> _dataBase() async {
    final database = await DatabaseSqLite().openConnection();
    print('_dataBase()');

    database.rawInsert('insert into teste values(null, ?)', ['gmc!']);
    database.rawInsert('insert into teste values(null, ?)', ['Gabriel Christo']);
    database.rawUpdate('update teste set nome = ? where id = ?', ['GMC', 0]);
    database.rawDelete('delete from teste where id = ?', [0]);
    var result = await database.rawQuery('select * from teste');
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(),
    );
  }
}
