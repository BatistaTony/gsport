import 'package:flutter/material.dart';
import 'package:gsport/models/soluttions.dart';
import 'package:gsport/models/sport.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowSolutionScreen extends StatefulWidget {
  final int? sportId;
  final int? questionId;
  const ShowSolutionScreen({Key? key, this.sportId, this.questionId})
      : super(key: key);

  @override
  _ShowSolutionScreenState createState() => _ShowSolutionScreenState();
}

class _ShowSolutionScreenState extends State<ShowSolutionScreen> {
  int _solutionId = 0;

  List<String> categories = [
    "Quero Aprender",
    "Quero Praticar",
    "Comprar equipamento",
    "Busco Parceiros",
  ];

  void initState() {
    super.initState();
    setState(() {
      _solutionId = widget.questionId ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var sport = sports[widget.sportId ?? 0];
    var type = questions[_solutionId];

    var filterdList = solutions.where((element) => element.type == type.title);

    return Scaffold(
        appBar: AppBar(
          title: Text("GSport App"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(bottom: 20, top: 20),
                  child: Text(
                    "Vamos praticar ${sport.name}",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                    child: SizedBox(
                        height: 35,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) =>
                                buildCategory(index)))),
                Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 8),
                        height: 2,
                        color: Color.fromRGBO(70, 108, 249, 0.15)),
                    Container(
                        margin: EdgeInsets.only(top: 24),
                        child: Column(
                            children: filterdList.map((sltion) {
                          var sliderIndex = solutions.indexOf(sltion);

                          return ItemList(
                              solution: solutions[sliderIndex],
                              press: () => showModal(sliderIndex));
                        }).toList())),
                    // SolutionInfo()
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Future<dynamic> showModal(int index) {
    return showModalBottomSheet(
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.all(new Radius.circular(100.0)),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: 350,
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        width: 68,
                        height: 24,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            color: Color(0xffE5E5E5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Image.asset("assets/icons/star.png")),
                            Text("${solutions[index].rate}"),
                            Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Image.asset("assets/icons/seta.png")),
                          ],
                        )),
                  ),
                  Container(
                    width: 134,
                    height: 134,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CircleAvatar(
                          backgroundImage:
                              AssetImage(solutions[index].logo ?? ""),
                          child: Text("")),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 1),
                          child: Text(
                            solutions[index].name ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.black, fontSize: 15),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          child: Text(solutions[index].address ?? "",
                              style: TextStyle(fontSize: 13)),
                        ),
                        ButtonContact(index: index),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  buildCategory(int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _solutionId = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            height: 32,
            padding: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                color: _solutionId == index
                    ? Color.fromRGBO(70, 108, 249, 0.15)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20)),
            child: Align(
              child: Text(
                categories[index],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: _solutionId == index
                        ? Color(0xff466CF9)
                        : Color(0xff757575)),
              ),
            ),
          ),
        ));
  }
}

class ItemList extends StatelessWidget {
  final Solution? solution;
  final VoidCallback? press;
  const ItemList({Key? key, this.solution, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: Container(
          margin: EdgeInsets.only(bottom: 8),
          padding: EdgeInsets.all(15),
          height: 80,
          decoration: BoxDecoration(
              color: Color.fromRGBO(246, 246, 246, 1),
              border: Border.all(
                  width: 2, color: Color.fromRGBO(70, 108, 249, 0.15)),
              borderRadius: BorderRadius.circular(7)),
          child: Row(
            children: [
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CircleAvatar(
                          backgroundImage: AssetImage(solution!.logo ?? ""),
                          child: Text("GS")))),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 38,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 1),
                      child: Text(
                        solution!.name ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.black, fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      child: Text(solution!.address ?? "",
                          style: TextStyle(fontSize: 13)),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class ButtonContact extends StatelessWidget {
  final int? index;
  const ButtonContact({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: TextButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xff466CF9)),
          ),
          onPressed: () => _launchWhatsapp(),
          label: Text(
            'Entrar em contacto',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          icon: Image.asset(
            'assets/icons/whatsapp.png',
            alignment: Alignment.centerRight,
          ),
        ),
      ),
    );
  }

  void _launchWhatsapp() async {
    if (await canLaunch(solutions[index ?? 0].whatsapp ?? "")) {
      launch(solutions[0].whatsapp ?? "");
    }
  }
}
