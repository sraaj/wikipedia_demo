// To parse this JSON data, do
//
//     final wikipediaListResponse = wikipediaListResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

WikipediaListResponse wikipediaListResponseFromMap(String str) => WikipediaListResponse.fromMap(json.decode(str));

String wikipediaListResponseToMap(WikipediaListResponse data) => json.encode(data.toMap());

class WikipediaListResponse {
  WikipediaListResponse({
    @required this.batchcomplete,
    @required this.wikipediaListResponseContinue,
    @required this.query,
  });

  bool batchcomplete;
  Continue wikipediaListResponseContinue;
  Query query;

  factory WikipediaListResponse.fromMap(Map<String, dynamic> json) => WikipediaListResponse(
    batchcomplete: json["batchcomplete"] == null ? null : json["batchcomplete"],
    wikipediaListResponseContinue: json["continue"] == null ? null : Continue.fromMap(json["continue"]),
    query: json["query"] == null ? null : Query.fromMap(json["query"]),
  );

  Map<String, dynamic> toMap() => {
    "batchcomplete": batchcomplete == null ? null : batchcomplete,
    "continue": wikipediaListResponseContinue == null ? null : wikipediaListResponseContinue.toMap(),
    "query": query == null ? null : query.toMap(),
  };
}

class Query {
  Query({
    @required this.redirects,
    @required this.pages,
  });

  List<Redirect> redirects;
  List<Page> pages;

  factory Query.fromMap(Map<String, dynamic> json) => Query(
    redirects: json["redirects"] == null ? null : List<Redirect>.from(json["redirects"].map((x) => Redirect.fromMap(x))),
    pages: json["pages"] == null ? null : List<Page>.from(json["pages"].map((x) => Page.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "redirects": redirects == null ? null : List<dynamic>.from(redirects.map((x) => x.toMap())),
    "pages": pages == null ? null : List<dynamic>.from(pages.map((x) => x.toMap())),
  };
}

class Page {
  Page({
    @required this.pageid,
    @required this.ns,
    @required this.title,
    @required this.index,
    @required this.thumbnail,
    @required this.terms,
  });

  int pageid;
  int ns;
  String title;
  int index;
  Thumbnail thumbnail;
  Terms terms;

  factory Page.fromMap(Map<String, dynamic> json) => Page(
    pageid: json["pageid"] == null ? null : json["pageid"],
    ns: json["ns"] == null ? null : json["ns"],
    title: json["title"] == null ? null : json["title"],
    index: json["index"] == null ? null : json["index"],
    thumbnail: json["thumbnail"] == null ? null : Thumbnail.fromMap(json["thumbnail"]),
    terms: json["terms"] == null ? null : Terms.fromMap(json["terms"]),
  );

  Map<String, dynamic> toMap() => {
    "pageid": pageid == null ? null : pageid,
    "ns": ns == null ? null : ns,
    "title": title == null ? null : title,
    "index": index == null ? null : index,
    "thumbnail": thumbnail == null ? null : thumbnail.toMap(),
    "terms": terms == null ? null : terms.toMap(),
  };
}

class Terms {
  Terms({
    @required this.description,
  });

  List<String> description;

  factory Terms.fromMap(Map<String, dynamic> json) => Terms(
    description: json["description"] == null ? null : List<String>.from(json["description"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "description": description == null ? null : List<dynamic>.from(description.map((x) => x)),
  };
}

class Thumbnail {
  Thumbnail({
    @required this.source,
    @required this.width,
    @required this.height,
  });

  String source;
  int width;
  int height;

  factory Thumbnail.fromMap(Map<String, dynamic> json) => Thumbnail(
    source: json["source"] == null ? null : json["source"],
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
  );

  Map<String, dynamic> toMap() => {
    "source": source == null ? null : source,
    "width": width == null ? null : width,
    "height": height == null ? null : height,
  };
}

class Redirect {
  Redirect({
    @required this.index,
    @required this.from,
    @required this.to,
  });

  int index;
  String from;
  String to;

  factory Redirect.fromMap(Map<String, dynamic> json) => Redirect(
    index: json["index"] == null ? null : json["index"],
    from: json["from"] == null ? null : json["from"],
    to: json["to"] == null ? null : json["to"],
  );

  Map<String, dynamic> toMap() => {
    "index": index == null ? null : index,
    "from": from == null ? null : from,
    "to": to == null ? null : to,
  };
}

class Continue {
  Continue({
    @required this.gpsoffset,
    @required this.continueContinue,
  });

  int gpsoffset;
  String continueContinue;

  factory Continue.fromMap(Map<String, dynamic> json) => Continue(
    gpsoffset: json["gpsoffset"] == null ? null : json["gpsoffset"],
    continueContinue: json["continue"] == null ? null : json["continue"],
  );

  Map<String, dynamic> toMap() => {
    "gpsoffset": gpsoffset == null ? null : gpsoffset,
    "continue": continueContinue == null ? null : continueContinue,
  };
}
