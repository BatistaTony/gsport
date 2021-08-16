class Sport {
  final String? name;
  final int? id;
  final String? image;
  final int? idDecision;

  Sport({this.id, this.name, this.image, this.idDecision});
}

List<Sport> sports = [
  Sport(
      id: 0,
      name: "Vôlei",
      image: "assets/images/illustration2.png",
      idDecision: 1),
  Sport(
      id: 1,
      name: "Artes Marciais",
      image: "assets/images/illustration4.png",
      idDecision: 2),
  Sport(
      id: 2,
      name: "Tênis",
      image: "assets/images/illustration3.png",
      idDecision: 3)
];
