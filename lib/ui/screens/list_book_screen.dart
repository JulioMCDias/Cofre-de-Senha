import 'package:cofresenha/ui/screens/list_password_screen.dart';
import 'package:cofresenha/ui/screens/open_repository_screen.dart';
import 'package:cofresenha/ui/widget/background_decoration.dart';
import 'package:flutter/material.dart';

class ListBookScreen extends StatefulWidget {
  @override
  _ListBookScreenState createState() => _ListBookScreenState();
}

class _ListBookScreenState extends State<ListBookScreen> {
  final List<String> _books = List();

  @override
  void initState() {
    super.initState();
    _books.add("Sites");
    _books.add("Emails");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Cadernos",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app, color: Theme.of(context).primaryColor,),
              onPressed: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => OpenRepositoryScreen())
                );
              },
            )
          ],
        ),
        body: Container(
            decoration: BackgroundDecoration(),
            height: double.infinity,
            child: Center(
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: _books.length,
                itemBuilder: (context, index){
                  return _bookCard(context, _books[index]);
                },
              )
            )
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.indigo,),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: (){},
      ),
    );
  }

  Widget _bookCard(context, String book){
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(book,
          style: TextStyle(color: Colors.indigo, fontSize: 28),
          ),
        ),
      ),
      onTap: (){
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => ListPasswordScreen())
        );
      },
    );
  }
}
