class Solution {
  final int? id;
  final String? logo;
  final String? name;
  final String? address;
  final String? type;
  final String? whatsapp;
  final Object? rate;
  final String? sportType;

  Solution(
      {this.id,
      this.logo,
      this.name,
      this.address,
      this.type,
      this.whatsapp,
      this.rate,
      this.sportType});
}

//place
//school
//equipment
//company

List<Solution> solutions = [
  Solution(
      id: 0,
      name: "Academia Team Nogueira",
      address: "Rua da Consolaao, 890 Bela Vista SP",
      logo: "assets/images/nogueira.png",
      rate: 1,
      type: "place",
      sportType: "Artes Marcias",
      whatsapp: "https://api.whatsapp.com/%C2%ADsend?phone=2449375310%C2%AD65"),
  Solution(
      id: 0,
      name: "Academia Bracie de Barra",
      address: "Rua da Consolaao, 890 Bela Vista SP",
      logo: "assets/images/gracie.png",
      rate: 5,
      type: "place",
      sportType: "Artes Marcias",
      whatsapp: "https://api.whatsapp.com/%C2%ADsend?phone=2449375310%C2%AD65"),
  Solution(
      id: 0,
      name: "Academia Brazilian Nogueira",
      address: "Rua da Consolaao, 890 Bela Vista SP",
      logo: "assets/images/brazilhian.png",
      rate: 5,
      type: "Não ter onde aprender?",
      sportType: "Artes Marcias",
      whatsapp: "https://api.whatsapp.com/%C2%ADsend?phone=2449375310%C2%AD65"),
  Solution(
      id: 0,
      name: "Academia Alliance Jiu Jitsu",
      address: "Rua da Consolaao, 890 Bela Vista SP",
      logo: "assets/images/alliance.png",
      rate: 1.5,
      type: "Não ter onde aprender?",
      sportType: "Artes Marcias",
      whatsapp: "https://api.whatsapp.com/%C2%ADsend?phone=2449375310%C2%AD65"),
  Solution(
      id: 0,
      name: "Academia Team Cyborg",
      address: "Rua da Consolaao, 890 Bela Vista SP",
      logo: "assets/images/cyborg.png",
      rate: 4,
      sportType: "Artes Marcias",
      type: "Não ter onde aprender?",
      whatsapp: "https://api.whatsapp.com/%C2%ADsend?phone=2449375310%C2%AD65"),
  Solution(
      id: 0,
      name: "Academia Barrick Brazilian",
      address: "Rua da Consolaao, 890 Bela Vista SP",
      logo: "assets/images/barrick.png",
      rate: 3,
      type: "Não ter onde praticar?",
      sportType: "Artes Marcias",
      whatsapp: "https://api.whatsapp.com/%C2%ADsend?phone=2449375310%C2%AD65"),
  Solution(
      id: 0,
      name: "Academia Team Nogueira",
      address: "Rua da Consolaao, 890 Bela Vista SP",
      logo: "assets/images/nogueira.png",
      rate: 5,
      sportType: "Artes Marcias",
      type: "Não ter onde praticar?",
      whatsapp: "https://api.whatsapp.com/%C2%ADsend?phone=2449375310%C2%AD65"),
  Solution(
      id: 0,
      name: "Academia Infinite Jiu Jitsu",
      address: "Rua da Consolaao, 890 Bela Vista SP",
      logo: "assets/images/infinite.png",
      rate: 3,
      type: "Não ter onde praticar?",
      sportType: "Artes Marcias",
      whatsapp: "https://api.whatsapp.com/%C2%ADsend?phone=2449375310%C2%AD65"),
  Solution(
      id: 0,
      name: "GYM Store",
      address: "Rua da Consolaao, 890 Bela Vista SP",
      logo: "assets/images/infinite.png",
      rate: 4.5,
      type: "Precisar de equipamentos específicos?",
      sportType: "Artes Marcias",
      whatsapp: "https://api.whatsapp.com/%C2%ADsend?phone=2449375310%C2%AD65"),
  Solution(
      id: 0,
      name: "Quadra 11",
      address: "Rua da Consolaao, 890 Bela Vista SP",
      logo: "assets/images/infinite.png",
      rate: 5,
      type: "Ter companhia para praticar?",
      sportType: "Artes Marcias",
      whatsapp: "https://api.whatsapp.com/%C2%ADsend?phone=2449375310%C2%AD65"),
  Solution(
      id: 0,
      name: "Quadra Bairro Azul",
      address: "Rua da Consolaao, 890 Bela Vista SP",
      logo: "assets/images/infinite.png",
      rate: 2.5,
      type: "Ter companhia para praticar?",
      sportType: "Artes Marcias",
      whatsapp: "https://api.whatsapp.com/%C2%ADsend?phone=2449375310%C2%AD65")
];

class Question {
  final int? id;
  final String? title;

  Question({this.id, this.title});
}

List<Question> questions = [
  Question(id: 0, title: "Não ter onde aprender?"),
  Question(id: 1, title: "Não ter onde praticar?"),
  Question(id: 2, title: "Precisar de equipamentos específicos?"),
  Question(id: 3, title: "Ter companhia para praticar?"),
];
