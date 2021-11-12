import 'dart:convert';

class SimCard {
  final String? carrierName;
  final String? displayName;
  final int? slotIndex;
  final String? number;
  final String? countryIso;
  final String? countryPhonePrefix;

  SimCard({
    this.carrierName,
    this.displayName,
    this.slotIndex,
    this.number,
    this.countryIso,
    this.countryPhonePrefix,
  });

  Map<String, dynamic> toJson() => {
        'carrierName': this.carrierName,
        'displayName': this.displayName,
        'slotIndex': this.slotIndex,
        'number': this.number,
        'countryIso': this.countryIso,
        'countryPhonePrefix': this.countryPhonePrefix,
      };

  factory SimCard.fromJson(Map<String, dynamic> json) => SimCard(
        carrierName: json['carrierName'] as String,
        displayName: json['displayName'] as String,
        slotIndex: json['slotIndex'] as int,
        number: json['number'] as String,
        countryIso: json['countryIso'] as String,
        countryPhonePrefix: json['countryPhonePrefix'] as String,
      );

  static List<SimCard> parseSimCards(String str) =>
      List<SimCard>.from(json.decode(str).map((x) => SimCard.fromJson(x)));

  static String simCardToJson(List<SimCard> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}
