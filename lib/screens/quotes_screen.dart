import 'package:flutter/material.dart';
import '../service/get_quote.dart';
import '../models/quotes.dart';
// import '../models/wallpaper.dart';
// import '../service/get_wallpaper.dart';

class QuoteScreen extends StatefulWidget {
  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Quotes>>(
      future: getQuotes(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: ListTile(
                    title: Text("${snapshot.data[index].text}"),
                    subtitle: Text("${snapshot.data[index].author}"),
                  ),
                );
              });
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
}

// FutureBuilder<List<WallPaper>>(
//       future: getWallpaper(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return ListView.builder(
//             itemCount: snapshot.data.length,
//             itemBuilder: (context, index) {
//               return Image.network(
//                 "${snapshot.data[index].imageUrl}",
//                 fit: BoxFit.fill,
//               );
//             },
//           );
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Text("${snapshot.error}"),
//           );
//         } else {
//           return CircularProgressIndicator();
//         }
//       },
//     );
