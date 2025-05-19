import 'package:flutter/material.dart';

class StatefullClass extends StatefulWidget {
  const StatefullClass({super.key});

  @override
  State<StatefullClass> createState() => _StatefullClassState();
}

class _StatefullClassState extends State<StatefullClass> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          'Statefull Class',
          style: TextStyle(
            color: const Color.fromARGB(177, 255, 255, 255),
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 4, 72, 77),
        elevation: 5,
        shadowColor: Colors.black38,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(count.toString(), style: TextStyle(fontSize: 50)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(),
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: Text('+1'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(),
                  onPressed: () {
                    setState(() {
                      count--;
                    });
                  },
                  child: Text('-1'),
                ),
              ],
            ),
            SizedBox(height: 50),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  NameCard(
                    image:
                        'https://ichef.bbci.co.uk/ace/standard/3840/cpsprodpb/7f5c/live/d265d420-de30-11ef-ac5a-93e8b29ec95c.jpg',
                    person: 'Neymar JR',
                  ),
                  SizedBox(width: 15),
                  NameCard(
                    image:
                        'https://assets.goal.com/images/v3/blt2aaca933046f8b00/Cristiano%20Ronaldo%20Portugal%202024%20(4).jpg',
                    person: 'CR7',
                  ),
                  SizedBox(width: 15),
                  NameCard(
                    image:
                        'https://static0.givemesportimages.com/wordpress/wp-content/uploads/2024/10/epl_every-record-that-lamine-yamal-holds.jpg',
                    person: 'Lamine Yamal',
                  ),
                  SizedBox(width: 15),
                  NameCard(
                    image:
                        'https://cdn.resfu.com/media/img_news/imagen-de-archivo-de-frenkie-de-jong--actual-futbolista-del-barcelona--efe.jpg',
                    person: 'De Jong',
                  ),
                  SizedBox(width: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NameCard extends StatelessWidget {
  final String image, person;
  const NameCard({super.key, required this.image, required this.person});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 300,
        // margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 4, 72, 77),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              offset: Offset(0, 2),
              blurRadius: 5,
              blurStyle: BlurStyle.solid,
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(image, height: 200, width: 300),
                Positioned(
                  top: 30,
                  right: 5,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '4.5',
                          style: TextStyle(
                            color: Color.fromARGB(255, 4, 72, 77),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Text(
              person,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
