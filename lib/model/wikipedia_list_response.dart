// To parse this JSON data, do
//
//     final wikipediaListResponse = wikipediaListResponseFromMap(jsonString);

import 'dart:convert';

WikipediaListResponse wikipediaListResponseFromMap(String str) =>
    WikipediaListResponse.fromMap(json.decode(str));

String wikipediaListResponseToMap(WikipediaListResponse data) =>
    json.encode(data.toMap());

class WikipediaListResponse {
  WikipediaListResponse({
    this.batchcomplete,
    this.wikipediaListResponseContinue,
    this.query,
  });

  bool batchcomplete;
  Continue wikipediaListResponseContinue;
  Query query;

  factory WikipediaListResponse.fromMap(Map<String, dynamic> json) =>
      WikipediaListResponse(
        batchcomplete:
            json["batchcomplete"] == null ? null : json["batchcomplete"],
        wikipediaListResponseContinue: json["continue"] == null
            ? null
            : Continue.fromMap(json["continue"]),
        query: json["query"] == null ? null : Query.fromMap(json["query"]),
      );

  Map<String, dynamic> toMap() => {
        "batchcomplete": batchcomplete == null ? null : batchcomplete,
        "continue": wikipediaListResponseContinue == null
            ? null
            : wikipediaListResponseContinue.toMap(),
        "query": query == null ? null : query.toMap(),
      };
}

class Query {
  Query({
    this.pages,
  });

  List<Page> pages;

  factory Query.fromMap(Map<String, dynamic> json) => Query(
        pages: json["pages"] == null
            ? null
            : List<Page>.from(json["pages"].map((x) => Page.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "pages": pages == null
            ? null
            : List<dynamic>.from(pages.map((x) => x.toMap())),
      };
}

class Page {
  Page({
    this.pageid,
    this.ns,
    this.title,
    this.index,
    this.terms,
    this.thumbnail,
  });

  int pageid;
  int ns;
  String title;
  int index;
  Terms terms;
  Thumbnail thumbnail;

  factory Page.fromMap(Map<String, dynamic> json) => Page(
        pageid: json["pageid"] == null ? null : json["pageid"],
        ns: json["ns"] == null ? null : json["ns"],
        title: json["title"] == null ? null : json["title"],
        index: json["index"] == null ? null : json["index"],
        terms: json["terms"] == null ? null : Terms.fromMap(json["terms"]),
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromMap(json["thumbnail"]),
      );

  Map<String, dynamic> toMap() => {
        "pageid": pageid == null ? null : pageid,
        "ns": ns == null ? null : ns,
        "title": title == null ? null : title,
        "index": index == null ? null : index,
        "terms": terms == null ? null : terms.toMap(),
        "thumbnail": thumbnail == null ? null : thumbnail.toMap(),
      };
}

class Terms {
  Terms({
    this.description,
  });

  List<String> description;

  factory Terms.fromMap(Map<String, dynamic> json) => Terms(
        description: json["description"] == null
            ? null
            : List<String>.from(json["description"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "description": description == null
            ? null
            : List<dynamic>.from(description.map((x) => x)),
      };
}

class Thumbnail {
  Thumbnail({
    this.source,
    this.width,
    this.height,
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

class Continue {
  Continue({
    this.gpsoffset,
    this.continueContinue,
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
