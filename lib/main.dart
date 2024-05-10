// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Image Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ImageData> _imageData = [
    ImageData(
        imagePath: 'assets/messi.jpeg',
        name: 'Lionel Messi',
        description:
            'Lionel Messi adalah pemain sepak bola terbaik sepanjang masa. Dikenal dengan kecepatan, kelincahan, dan keterampilan dribblingnya yang luar biasa, Messi telah menginspirasi jutaan penggemar sepak bola di seluruh dunia.'),
    ImageData(
        imagePath: 'assets/ronaldo.jpg',
        name: 'Cristiano Ronaldo',
        description:
            'Cristiano Ronaldo adalah pesepakbola hebat yang telah meraih berbagai gelar dan penghargaan, termasuk penghargaan Ballon d\'Or. Dia dikenal karena kekuatan fisiknya, kelincahan, dan kemampuan mencetak gol yang luar biasa.'),
    ImageData(
        imagePath: 'assets/neymar.jpeg',
        name: 'Neymar',
        description:
            'Neymar adalah pemain sepak bola Brasil yang memiliki keterampilan dribbling yang brilian dan kecepatan yang mengesankan. Dia telah menjadi salah satu pemain terbaik di dunia dan sering menjadi inspirasi bagi pemain muda'),
    ImageData(
        imagePath: 'assets/benzema.jpg',
        name: 'Karim Benzema',
        description:
            'Karim Benzema adalah striker kelas dunia yang telah memberikan kontribusi besar bagi Real Madrid dan tim nasional Prancis. Dia dikenal karena kecerdasan permainannya, keterampilan mencetak gol, dan kemampuan untuk menciptakan peluang bagi rekan setimnya'),
    ImageData(
        imagePath: 'assets/mosalah.jpg',
        name: 'Mohamed Salah',
        description:
            'Mohamed Salah adalah winger berbakat yang telah menjadi salah satu pemain kunci Liverpool dan tim nasional Mesir. Dia dikenal karena kecepatan dan kelincahan serta kemampuannya dalam mencetak gol'),
    ImageData(
        imagePath: 'assets/mbape.jpg',
        name: 'Kylian Mbappe',
        description:
            'Kylian Mbappé adalah bintang muda sepak bola Prancis yang telah menarik perhatian dunia dengan keterampilan dan kecepatannya yang luar biasa. Dia dianggap sebagai salah satu talenta terbesar di generasinya.'),
    ImageData(
        imagePath: 'assets/debryune.jpg',
        name: 'Kevin De Bruyne',
        description:
            'Kevin De Bruyne adalah gelandang serba bisa yang telah menjadi tulang punggung Manchester City dan tim nasional Belgia. Dia dikenal karena visinya yang brilian, umpan silang akurat, dan kemampuannya dalam mencetak gol dari jarak jauh.'),
    ImageData(
        imagePath: 'assets/kane.jpg',
        name: 'Harry Kane',
        description:
            'Harry Kane adalah penyerang yang memimpin Tottenham Hotspur dan tim nasional Inggris. Dia dikenal karena ketepatan tembakannya, kreativitasnya dalam menciptakan peluang gol, dan kepemimpinannya di lapangan'),
    ImageData(
        imagePath: 'assets/bruno.jpg',
        name: 'Bruno Fernandes',
        description:
            'Bruno Fernandes adalah playmaker kreatif yang telah menjadi tulang punggung Manchester United dan tim nasional Portugal. Dia dikenal karena visinya yang luar biasa, umpan-umpan akuratnya, dan kemampuannya dalam mencetak gol.'),
    ImageData(
        imagePath: 'assets/halland.jpg',
        name: 'Erling Haaland',
        description:
            'Erling Haaland adalah striker muda yang sedang naik daun dari Norwegia. Dia dikenal karena kekuatan fisiknya, kecepatannya, dan kemampuan mencetak gol yang luar biasa.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top 10 Pemain Bola Terbaik di Dunia'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: _imageData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageDescriptionPage(
                    imageData: _imageData[index],
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Image.asset(
                  _imageData[index].imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity, // Set width to fill the column
                  height: 150, // Set a fixed height
                ),
                const SizedBox(height: 8), // Spacer
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _imageData[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ImageDescriptionPage extends StatefulWidget {
  final ImageData imageData;

  const ImageDescriptionPage({Key? key, required this.imageData})
      : super(key: key);

  @override
  _ImageDescriptionPageState createState() => _ImageDescriptionPageState();
}

class _ImageDescriptionPageState extends State<ImageDescriptionPage> {
  bool _isLoved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.imageData.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                widget.imageData.imagePath,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.imageData.description,
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
              const SizedBox(height: 16.0),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isLoved = !_isLoved;
                  });
                },
                icon: Icon(
                  _isLoved
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  color: _isLoved ? Colors.red : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageData {
  final String imagePath;
  final String name;
  final String description;

  ImageData({
    required this.imagePath,
    required this.name,
    required this.description,
  });
}
