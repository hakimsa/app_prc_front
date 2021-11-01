import 'dart:convert';
import 'package:carde/Models/Player.dart';

import 'package:http/http.dart' as http;

List<Player> players = [];

Future<List<PlayerTeams>> _prosecarpeticiones(Uri url) async {
  final respuesta = await http.get(url);
  final descodeData = json.decode(respuesta.body);

  print(descodeData.toString());
  final players = new PlayerTeams.fromJson(descodeData);

  print(players.queryResults);
  List<PlayerTeams> milist = [];
  milist.add(players);
  for (PlayerTeams i in milist) print(i);
  print("dfghj" + milist.length.toString());
  return milist;
}

Future<List<PlayerTeams>> getPlayers() async {
  String _authority = "mlb-data.p.rapidapi.com";
  String _path = "https://mlb-data.p.rapidapi.com/json/named.player_teams.bam";
  final _params = {
    "useQueryString": true,
    "method": 'GET',
    'x-rapidapi-key': "bb9215ff97msh4b299ea0567e0e0p130242jsn2f92eaa88426",
    "qs": {"player_id": '\'493316\'', "season": '\'2014\''}
  };
  final _uri = Uri.https(_authority, _path, _params[0]);

  final resp = await _prosecarpeticiones(_uri);
  return resp;
}
