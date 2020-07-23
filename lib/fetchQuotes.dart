import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quotes_app/quote.dart';
import 'package:http/http.dart';

class FetchQuotes{
  List <Quotes> quotes = [];
  Future<Widget> getData() async{
    var response = await get("https://type.fit/api/quotes");
    var json = jsonDecode(response.body);
    json.forEach((quote){
      Quotes quoteInstance = Quotes (
        text: quote["text"],
        author: quote["author"]
      );
      quotes.add(quoteInstance);
    }

    );
}
}