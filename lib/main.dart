import 'dart:js_util';

import 'package:flutter/material.dart';

const headerImageRatio = 2;
const headerImageHeightS = 240.0;
const headerImageHeightM = 320.0;
const headerImageUrl = 'https://picsum.photos/900/600?image=0';
const seed = [
  'SLeep',
  'Eat',
  'Watch TV',
  'Live',
  'Laugh',
  'Love',
  'Implement Add function',
  'Implement Delete function',
  'Implement Check function',
  'Implement Shuffle function',
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('My mom')),
        body: SingleChildScrollView(
          child: Column(children: [
            _buildSectionHeader(context),
            _buildButtonSection(context),
            _buildListItemColumn(context),
            _buildHeaderImage(headerImageHeightS)
          ]),
        ),
      ),
    );
  }

  Widget _buildHeaderImage(double? height) {
    final imageHeight = height ?? 0.0;
    final imageWidth = height != null ? (imageHeight * headerImageRatio) : null;
    return Image.network(
      headerImageUrl,
      width: imageWidth,
      height: height,
      fit: BoxFit.cover,
    );
  }

  Widget _buildSectionHeader(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Here is my totdo list ',
        style: textTheme.headlineSmall!,
      ),
    );
  }

  Widget _buildButtonSection(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.add, 'ADD'),
        _buildButtonColumn(color, Icons.shuffle, 'SHUFFLE'),
        _buildButtonColumn(Colors.cyan, Icons.add_a_photo, 'HEHE')
      ],
    );
  }

  Widget _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: color),
          ),
        ),
      ],
    );
  }

  Widget _buildListItemColumn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(),
          for (int i = 0; i < seed.length; i++) ...[
            _buildListItem(context, seed[i]),
            const Divider(),
          ],
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String text) {
    final color = Theme.of(context).primaryColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: ListTile(
        leading: Checkbox(value: false, onChanged: (isChecked) {}),
        title: Text(text),
        trailing: Icon(Icons.delete, color: color),
      ),
    );
  }
}



//previous codes
// import 'package:english_words/english_words.dart';
//import 'package:provider/provider.dart';


//@override
  //Widget build(BuildContext context) {
    //return ChangeNotifierProvider(
      //create: (context) => MyAppState(),
      //child: MaterialApp(
        //title: 'Namer App',
        //theme: ThemeData(
          //useMaterial3: true,
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        //),
        //home: MyHomePage(),
      //),
    //);
  //}
//}


//class MyAppState extends ChangeNotifier {
  //var current = WordPair.random();

  //void getNext() {
    //current = WordPair.random();
    //notifyListeners();
  //}
//}

//class MyHomePage extends StatelessWidget {
  //@override
  //Widget build(BuildContext context) {
    //var appState = context.watch<MyAppState>();
    //var pair = appState.current;

    //return Scaffold(
      //body: Center(
        //child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //children: [
            //BigCard(pair: pair),
            //SizedBox(height: 20),
            //ElevatedButton(
              //onPressed: () {
                //appState.getNext();
              //},
              //child: Text('Next'),
            //),
          //],
        //),
      //),
    //);
  //}
//}

//class BigCard extends StatelessWidget {
  //const BigCard({
    //super.key,
    //required this.pair,
  //});

  //final WordPair pair;

  //@override
  //Widget build(BuildContext context) {
    //final theme = Theme.of(context);
    //final style = theme.textTheme.displayMedium!.copyWith(
      //color: theme.colorScheme.onPrimary,
    //);

    //return Card(
      //color: theme.colorScheme.primary,
      //child: Padding(
        //padding: const EdgeInsets.all(20),
        //child: Text(pair.asLowerCase,
            //style: style, semanticsLabel: "${pair.first}  ${pair.second}"),
      //),
    //);
  //}
//}

