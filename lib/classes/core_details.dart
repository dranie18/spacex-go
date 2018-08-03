import 'package:intl/intl.dart';

class CoreDetails {
  final String serial;
  final int block;
  final String status;
  final DateTime firstLaunched;
  final int landings;
  final missions;
  final String details;

  CoreDetails(
      {this.serial,
      this.block,
      this.status,
      this.firstLaunched,
      this.landings,
      this.missions,
      this.details});

  factory CoreDetails.fromJson(Map<String, dynamic> json) {
    return CoreDetails(
        serial: json['core_serial'],
        block: json['block'],
        status: json['status'],
        firstLaunched: DateTime
            .fromMillisecondsSinceEpoch(json['original_launch_unix'] * 1000),
        landings: json['rtls_landings'] + json['asds_landings'],
        missions: json['missions'],
        details: json['details']);
  }

  String get getBlock => 'Block $block';

  String get getStatus => '${status[0].toUpperCase()}${status.substring(1)}';

  String get getFirstLaunched =>
      '${DateFormat('MMMM yyyy').format(firstLaunched)}';

  String get getDetails => details ?? 'This core has currently no details.';

  String get getMissions {
    String allMissions = '';
    if (missions.isEmpty)
      return 'No previous missions.';
    else {
      missions.forEach((mission) {
        allMissions += mission;
        (mission != missions.last) ? allMissions += ',  ' : '';
      });
      return allMissions;
    }
  }
}
