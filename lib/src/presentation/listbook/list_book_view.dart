
import 'package:cofresenha/src/data/model/book.dart';
import 'package:cofresenha/src/ui/screens/listbook/list_book_screen.dart';

abstract class ListBookView{
  ListBookScreen screen;

  void navigationListPassword();
  void setListBook(List<Book> books);
  void loadingVisibility(bool enable);
  Function(String) infoError;
}
