class Player {
  PlayerTeams playerTeams;

  Player({this.playerTeams});

  Player.fromJson(Map<String, dynamic> json) {
    playerTeams = json['player_teams'] != null ? new PlayerTeams.fromJson(json['player_teams']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.playerTeams != null) {
      data['player_teams'] = this.playerTeams.toJson();
    }
    return data;
  }
}

class PlayerTeams {
  String copyRight;
  QueryResults queryResults;

  PlayerTeams({this.copyRight, this.queryResults});

  PlayerTeams.fromJson(Map<String, dynamic> json) {
    copyRight = json['copyRight'];
    queryResults = json['queryResults'] != null ? new QueryResults.fromJson(json['queryResults']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['copyRight'] = this.copyRight;
    if (this.queryResults != null) {
      data['queryResults'] = this.queryResults.toJson();
    }
    return data;
  }
}

class QueryResults {
  String created;
  String totalSize;
  List<Row> row;

  QueryResults({this.created, this.totalSize, this.row});

  QueryResults.fromJson(Map<String, dynamic> json) {
    created = json['created'];
    totalSize = json['totalSize'];
    if (json['row'] != null) {
      row = [];
      json['row'].forEach((v) { row.add(new Row.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created'] = this.created;
    data['totalSize'] = this.totalSize;
    if (this.row != null) {
      data['row'] = this.row.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Row {
  String seasonState;
  String hittingSeason;
  String sportFull;
  String org;
  String sportCode;
  String orgShort;
  String jerseyNumber;
  String endDate;
  String teamBrief;
  String fortyManSw;
  String sportId;
  String leagueShort;
  String orgFull;
  String statusCode;
  String leagueFull;
  String primaryPosition;
  String teamAbbrev;
  String status;
  String orgAbbrev;
  String leagueId;
  String klass;
  String sport;
  String teamShort;
  String team;
  String league;
  String fieldingSeason;
  String orgId;
  String classId;
  String leagueSeason;
  String fortyManSwOld;
  String pitchingSeason;
  String sportShort;
  String statusDate;
  String playerId;
  String currentSw;
  String primaryStatType;
  String teamId;
  String startDate;
  String majorLeagueBaseball;

  Row({this.seasonState, this.hittingSeason, this.sportFull, this.org, this.sportCode, this.orgShort, this.jerseyNumber, this.endDate, this.teamBrief, this.fortyManSw, this.sportId, this.leagueShort, this.orgFull, this.statusCode, this.leagueFull, this.primaryPosition, this.teamAbbrev, this.status, this.orgAbbrev, this.leagueId, this.klass, this.sport, this.teamShort, this.team, this.league, this.fieldingSeason, this.orgId, this.classId, this.leagueSeason, this.fortyManSwOld, this.pitchingSeason, this.sportShort, this.statusDate, this.playerId, this.currentSw, this.primaryStatType, this.teamId, this.startDate, this.majorLeagueBaseball});

  Row.fromJson(Map<String, dynamic> json) {
  seasonState = json['season_state'];
  hittingSeason = json['hitting_season'];
  sportFull = json['sport_full'];
  org = json['org'];
  sportCode = json['sport_code'];
  orgShort = json['org_short'];
  jerseyNumber = json['jersey_number'];
  endDate = json['end_date'];
  teamBrief = json['team_brief'];
  fortyManSw = json['forty_man_sw'];
  sportId = json['sport_id'];
  leagueShort = json['league_short'];
  orgFull = json['org_full'];
  statusCode = json['status_code'];
  leagueFull = json['league_full'];
  primaryPosition = json['primary_position'];
  teamAbbrev = json['team_abbrev'];
  status = json['status'];
  orgAbbrev = json['org_abbrev'];
  leagueId = json['league_id'];
  klass = json['class'];
  sport = json['sport'];
  teamShort = json['team_short'];
  team = json['team'];
  league = json['league'];
  fieldingSeason = json['fielding_season'];
  orgId = json['org_id'];
  classId = json['class_id'];
  leagueSeason = json['league_season'];
  fortyManSwOld = json['forty_man_sw_old'];
  pitchingSeason = json['pitching_season'];
  sportShort = json['sport_short'];
  statusDate = json['status_date'];
  playerId = json['player_id'];
  currentSw = json['current_sw'];
  primaryStatType = json['primary_stat_type'];
  teamId = json['team_id'];
  startDate = json['start_date'];
  majorLeagueBaseball = json['Major League Baseball'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['season_state'] = this.seasonState;
  data['hitting_season'] = this.hittingSeason;
  data['sport_full'] = this.sportFull;
  data['org'] = this.org;
  data['sport_code'] = this.sportCode;
  data['org_short'] = this.orgShort;
  data['jersey_number'] = this.jerseyNumber;
  data['end_date'] = this.endDate;
  data['team_brief'] = this.teamBrief;
  data['forty_man_sw'] = this.fortyManSw;
  data['sport_id'] = this.sportId;
  data['league_short'] = this.leagueShort;
  data['org_full'] = this.orgFull;
  data['status_code'] = this.statusCode;
  data['league_full'] = this.leagueFull;
  data['primary_position'] = this.primaryPosition;
  data['team_abbrev'] = this.teamAbbrev;
  data['status'] = this.status;
  data['org_abbrev'] = this.orgAbbrev;
  data['league_id'] = this.leagueId;
  data['class'] = this.klass;
  data['sport'] = this.sport;
  data['team_short'] = this.teamShort;
  data['team'] = this.team;
  data['league'] = this.league;
  data['fielding_season'] = this.fieldingSeason;
  data['org_id'] = this.orgId;
  data['class_id'] = this.classId;
  data['league_season'] = this.leagueSeason;
  data['forty_man_sw_old'] = this.fortyManSwOld;
  data['pitching_season'] = this.pitchingSeason;
  data['sport_short'] = this.sportShort;
  data['status_date'] = this.statusDate;
  data['player_id'] = this.playerId;
  data['current_sw'] = this.currentSw;
  data['primary_stat_type'] = this.primaryStatType;
  data['team_id'] = this.teamId;
  data['start_date'] = this.startDate;
  data['Major League Baseball'] = this.majorLeagueBaseball;
  return data;
  }
}