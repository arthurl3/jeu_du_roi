class GameCard {

  final int cardId; //L'id de la carte (non unique)
  final String title;
  String text;

  GameCard({required this.cardId, required this.title, required this.text});

  String toString() {
    return '$cardId \n $title \n $text';
  }

  //Return true if the card text has a %replace% statement
  bool hasReplacment() {
    return this.text.contains("%replace%");
  }

  //Replace the text which has to be replace
  void replaceText(String playerName) {
    List<String> splitter = this.text.split("%replace%");
    this.text = splitter[0] + playerName + splitter[1];
  }



}