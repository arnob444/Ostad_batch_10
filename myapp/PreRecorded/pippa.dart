class LibraryItem {
  String title;
  String author;
  bool _isBorrowed = false;
  // bool get isGet => _isBorrowed;

  LibraryItem(this.title, this.author);

  borrowItem() {
    if (!_isBorrowed) {
      _isBorrowed = true;
      print("$title is borrowed");
    } else {
      print('$title is already borrowed');
    }
  }

  returnedItem() {
    if (_isBorrowed) {
      _isBorrowed = false;
      print('$title has been returned');
    } else {
      print('$title was not borrowed');
    }
  }

  getDetails() {
    print("Title: $title");
    print('Author: $author');
    print("Status: ${_isBorrowed ? "Yes" : "No"}");
  }
}

class Book extends LibraryItem {
  int pageCount;
  Book(String title, String Author, this.pageCount) : super(title, Author);

  @override
  getDetails() {
    super.getDetails();
    print("Page Count: $pageCount");
  }
}

class Magazine extends LibraryItem {
  int issueNumber;
  Magazine(String title, String Author, this.issueNumber)
      : super(title, Author);

  @override
  getDetails() {
    super.getDetails();
    print('Issue Number: $issueNumber');
  }
}

main() {
  Book book1 = Book("Coti book", "Kobir", 30);
  Magazine meg1 = Magazine("Baro vatari", "Lila", 69);

  print("------------Book------------");
  book1.getDetails();
  book1.borrowItem();
  print('\n');
  book1.getDetails();
  book1.borrowItem();
  print('\n');

  print('----------Megazine----------');
  meg1.getDetails();
  meg1.borrowItem();
  print('\n');
  meg1.getDetails();

  meg1.borrowItem();
}
