import 'package:flutter/cupertino.dart';

String tablePlayer = 'Players';
String playerId = 'id';
String playerName = 'name';
String playerAge = 'age';
String playerClubId = 'club_id';
String playerClubName = 'club_name';
String playerPosition = 'position';
String playerOvr = 'ovr';
String playerNumber = 'number';
String playerNation = 'nation';
String playerWage = 'wage';
String playerFootPrefer = 'foot_prefer';
String playerBirthday = 'birthday';
String playerWeight = 'weight';
String playerHeight = 'height';
String playerAvatarUrl = 'avatar_url';
String playerBallSkill = 'ball_skill';
String playerDefense = 'defense';
String playerShooting = 'shooting';
String playerPhysical = 'physical';
String playerPassing = 'passing';
String playerIsExpand = 'isExpand';
String playerOffset = 'offset';

class Player {
  String id;
  String name;
  String age;
  String clubId;
  String clubName;
  String position;
  String ovr;
  String number;
  String nation;
  String wage;
  String footPrefer;
  String birthday;
  String weight;
  String height;
  String avatarUrl;
  String ballSkill;
  String defense;
  String shooting;
  String physical;
  String passing;
  bool isExpand;
  Offset offset;

  Player({
    this.id,
    this.name,
    this.clubId,
    this.clubName,
    this.age,
    this.position,
    this.ovr,
    this.number,
    this.nation,
    this.wage,
    this.footPrefer,
    this.birthday,
    this.weight,
    this.height,
    this.avatarUrl,
    this.ballSkill,
    this.defense,
    this.shooting,
    this.physical,
    this.passing,
    this.isExpand,
    this.offset,
  });

  Player.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    age = map['age'];
    clubId = map['club_id'];
    clubName = map['club_name'];
    position = map['position'];
    ovr = map['ovr'];
    number = map['number'];
    nation = map['nation'];
    wage = map['wage'];
    footPrefer = map['footPrefer'];
    birthday = map['birthday'];
    weight = map['weight'];
    height = map['height'];
    avatarUrl = map['imageUrl'];
    ballSkill = map['ballSkill'];
    defense = map['defense'];
    shooting = map['shooting'];
    physical = map['physical'];
    passing = map['passing'];
    isExpand = map['isExpand'] == 0 ? false : true;
    offset = map['offset'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      playerId: id,
      playerName: name,
      playerAge: age,
      playerClubId: clubId,
      playerClubName: clubName,
      playerPosition: position,
      playerOvr: ovr,
      playerNumber: number,
      playerNation: nation,
      playerWage: wage,
      playerFootPrefer: footPrefer,
      playerBirthday: birthday,
      playerWeight: weight,
      playerHeight: height,
      playerAvatarUrl: avatarUrl,
      playerBallSkill: ballSkill,
      playerDefense: defense,
      playerShooting: shooting,
      playerPhysical: physical,
      playerPassing: passing,
      playerIsExpand: isExpand == true ? 0 : 1,
      playerOffset: offset,
    };
  }
}
