class GameCard {

  final int cardId; //L'id de la carte (non unique)
  final String title;
  final String text;

  GameCard({required this.cardId, required this.title, required this.text});

  String toString() {
    return '$cardId \n $title \n $text';
  }

}