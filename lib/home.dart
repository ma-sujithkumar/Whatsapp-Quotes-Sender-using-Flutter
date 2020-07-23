import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:quotes_app/quote.dart';
import 'package:quotes_app/fetchQuotes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
int index=0;
class _HomeState extends State<Home> {
  @override
  List<Quotes> quoteSnippets = new List<Quotes>();
  bool _loading = true;

  void getQuote1() async {
    FetchQuotes QuoteObj = FetchQuotes();
    await QuoteObj.getData();
    quoteSnippets = QuoteObj.quotes;
    setState(() {
      _loading = false;
    });
  }

  Widget build(BuildContext context) {
    getQuote1();
    return QuotesTile(
      text:quoteSnippets[index].text,
      author:quoteSnippets[index].author

    );
  }
}
class QuotesTile extends StatefulWidget {
  final String text,author;
  QuotesTile({@required this.text, @required this.author});

  @override
  _QuotesTileState createState() => _QuotesTileState();
}

class _QuotesTileState extends State<QuotesTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Row(
          children:[
            Text("Quotes",
          style:TextStyle(
              color: Colors.black87,
          )),
            Text("Generator",
                style:TextStyle(
                  color: Colors.blue,
                )),
        ]
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 220,
          padding: EdgeInsets.all(20.0),
              child:Column(
                children:<Widget> [
                  SelectableText(
                      widget.text,
                      style:TextStyle(
                        fontSize:25,
                        color:Colors.black87,
                        fontWeight: FontWeight.w600,
                      )
                  ),
                  SizedBox(height: 20,),
                  SelectableText("- "+widget.author,
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 20,)
                ],
              )
          ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              index++;
            });
          },
          child:Icon(Icons.refresh)
      ),
    );
  }
}
