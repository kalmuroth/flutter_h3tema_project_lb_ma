import 'dart:convert';

List<Country> countryFromJson(String str) =>
    List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

String countryToJson(List<Country> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Country {
  Country({
    required this.name,
    this.tld,
    required this.cca2,
    this.ccn3,
    required this.cca3,
    this.cioc,
    this.independent,
    required this.status,
    required this.unMember,
    this.currencies,
    required this.idd,
    this.capital,
    required this.altSpellings,
    required this.region,
    this.subregion,
    this.languages,
    required this.translations,
    required this.latlng,
    required this.landlocked,
    this.borders,
    required this.area,
    this.demonyms,
    required this.flag,
    required this.maps,
    required this.population,
    this.gini,
    this.fifa,
    required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.startOfWeek,
    required this.capitalInfo,
    this.postalCode,
  });

  Name name;
  List<String>? tld;
  String cca2;
  String? ccn3;
  String cca3;
  String? cioc;
  bool? independent;
  Status status;
  bool unMember;
  Currencies? currencies;
  Idd idd;
  List<String>? capital;
  List<String> altSpellings;
  Region region;
  String? subregion;
  Map<String, String>? languages;
  Map<String, Translation> translations;
  List<double> latlng;
  bool landlocked;
  List<String>? borders;
  double area;
  Demonyms? demonyms;
  String flag;
  Maps maps;
  int population;
  Map<String, double>? gini;
  String? fifa;
  Car car;
  List<String> timezones;
  List<Continent> continents;
  Flags flags;
  CoatOfArms coatOfArms;
  StartOfWeek startOfWeek;
  CapitalInfo capitalInfo;
  PostalCode? postalCode;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: Name.fromJson(json["name"]),
        tld: json["tld"] == null
            ? []
            : List<String>.from(json["tld"]!.map((x) => x)),
        cca2: json["cca2"],
        ccn3: json["ccn3"],
        cca3: json["cca3"],
        cioc: json["cioc"],
        independent: json["independent"],
        status: statusValues.map[json["status"]]!,
        unMember: json["unMember"],
        currencies: json["currencies"] == null
            ? null
            : Currencies.fromJson(json["currencies"]),
        idd: Idd.fromJson(json["idd"]),
        capital: json["capital"] == null
            ? []
            : List<String>.from(json["capital"]!.map((x) => x)),
        altSpellings: List<String>.from(json["altSpellings"].map((x) => x)),
        region: regionValues.map[json["region"]]!,
        subregion: json["subregion"],
        translations: Map.from(json["translations"]).map((k, v) =>
            MapEntry<String, Translation>(k, Translation.fromJson(v))),
        latlng: List<double>.from(json["latlng"].map((x) => x?.toDouble())),
        landlocked: json["landlocked"],
        borders: json["borders"] == null
            ? []
            : List<String>.from(json["borders"]!.map((x) => x)),
        area: json["area"]?.toDouble(),
        demonyms: json["demonyms"] == null
            ? null
            : Demonyms.fromJson(json["demonyms"]),
        flag: json["flag"],
        maps: Maps.fromJson(json["maps"]),
        population: json["population"],
        fifa: json["fifa"],
        car: Car.fromJson(json["car"]),
        timezones: List<String>.from(json["timezones"].map((x) => x)),
        continents: List<Continent>.from(
            json["continents"].map((x) => continentValues.map[x]!)),
        flags: Flags.fromJson(json["flags"]),
        coatOfArms: CoatOfArms.fromJson(json["coatOfArms"]),
        startOfWeek: startOfWeekValues.map[json["startOfWeek"]]!,
        capitalInfo: CapitalInfo.fromJson(json["capitalInfo"]),
        postalCode: json["postalCode"] == null
            ? null
            : PostalCode.fromJson(json["postalCode"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "tld": tld == null ? [] : List<dynamic>.from(tld!.map((x) => x)),
        "cca2": cca2,
        "ccn3": ccn3,
        "cca3": cca3,
        "cioc": cioc,
        "independent": independent,
        "status": statusValues.reverse[status],
        "unMember": unMember,
        "currencies": currencies?.toJson(),
        "idd": idd.toJson(),
        "capital":
            capital == null ? [] : List<dynamic>.from(capital!.map((x) => x)),
        "altSpellings": List<dynamic>.from(altSpellings.map((x) => x)),
        "region": regionValues.reverse[region],
        "subregion": subregion,
        "languages":
            Map.from(languages!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "translations": Map.from(translations)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
        "landlocked": landlocked,
        "borders":
            borders == null ? [] : List<dynamic>.from(borders!.map((x) => x)),
        "area": area,
        "demonyms": demonyms?.toJson(),
        "flag": flag,
        "maps": maps.toJson(),
        "population": population,
        "gini": Map.from(gini!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "fifa": fifa,
        "car": car.toJson(),
        "timezones": List<dynamic>.from(timezones.map((x) => x)),
        "continents": List<dynamic>.from(
            continents.map((x) => continentValues.reverse[x])),
        "flags": flags.toJson(),
        "coatOfArms": coatOfArms.toJson(),
        "startOfWeek": startOfWeekValues.reverse[startOfWeek],
        "capitalInfo": capitalInfo.toJson(),
        "postalCode": postalCode?.toJson(),
      };

  static countryFromJson(e) {}
}

class CapitalInfo {
  CapitalInfo({
    this.latlng,
  });

  List<double>? latlng;

  factory CapitalInfo.fromJson(Map<String, dynamic> json) => CapitalInfo(
        latlng: json["latlng"] == null
            ? []
            : List<double>.from(json["latlng"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "latlng":
            latlng == null ? [] : List<dynamic>.from(latlng!.map((x) => x)),
      };
}

class Car {
  Car({
    this.signs,
    required this.side,
  });

  List<String>? signs;
  Side side;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        signs: json["signs"] == null
            ? []
            : List<String>.from(json["signs"]!.map((x) => x)),
        side: sideValues.map[json["side"]]!,
      );

  Map<String, dynamic> toJson() => {
        "signs": signs == null ? [] : List<dynamic>.from(signs!.map((x) => x)),
        "side": sideValues.reverse[side],
      };
}

enum Side { RIGHT, LEFT }

final sideValues = EnumValues({"left": Side.LEFT, "right": Side.RIGHT});

class CoatOfArms {
  CoatOfArms({
    this.png,
    this.svg,
  });

  String? png;
  String? svg;

  factory CoatOfArms.fromJson(Map<String, dynamic> json) => CoatOfArms(
        png: json["png"],
        svg: json["svg"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
      };
}

enum Continent {
  EUROPE,
  ASIA,
  NORTH_AMERICA,
  AFRICA,
  OCEANIA,
  SOUTH_AMERICA,
  ANTARCTICA
}

final continentValues = EnumValues({
  "Africa": Continent.AFRICA,
  "Antarctica": Continent.ANTARCTICA,
  "Asia": Continent.ASIA,
  "Europe": Continent.EUROPE,
  "North America": Continent.NORTH_AMERICA,
  "Oceania": Continent.OCEANIA,
  "South America": Continent.SOUTH_AMERICA
});

class Currencies {
  Currencies({
    this.rub,
    this.bnd,
    this.sgd,
    this.gip,
    this.sek,
    this.eur,
    this.cad,
    this.rsd,
    this.jod,
    this.yer,
    this.ern,
    this.mur,
    this.aud,
    this.byn,
    this.chf,
    this.tzs,
    this.nio,
    this.mru,
    this.xpf,
    this.huf,
    this.pgk,
    this.fjd,
    this.tvd,
    this.usd,
    this.mnt,
    this.kzt,
    this.syp,
    this.gbp,
    this.imp,
    this.mwk,
    this.all,
    this.czk,
    this.isk,
    this.sbd,
    this.crc,
    this.krw,
    this.xcd,
    this.srd,
    this.mga,
    this.xof,
    this.thb,
    this.ckd,
    this.nzd,
    this.kyd,
    this.nok,
    this.lrd,
    this.aoa,
    this.vnd,
    this.mdl,
    this.dkk,
    this.jpy,
    this.myr,
    this.lbp,
    this.ils,
    this.azn,
    this.jep,
    this.bmd,
    this.djf,
    this.gmd,
    this.kid,
    this.nad,
    this.zar,
    this.mad,
    this.sos,
    this.cuc,
    this.cup,
    this.xaf,
    this.bzd,
    this.ttd,
    this.dzd,
    this.idr,
    this.ves,
    this.bam,
    this.shp,
    this.pkr,
    this.omr,
    this.pyg,
    this.iqd,
    this.mvr,
    this.bdt,
    this.szl,
    this.tjs,
    this.aed,
    this.stn,
    this.gtq,
    this.tnd,
    this.ggp,
    this.cve,
    this.egp,
    this.inr,
    this.gyd,
    this.mzn,
    this.bsd,
    this.brl,
    this.fok,
    this.gel,
    this.zwl,
    this.etb,
    this.irr,
    this.bhd,
    this.gnf,
    this.kes,
    this.bif,
    this.ang,
    this.lsl,
    this.uyu,
    this.ugx,
    this.mmk,
    this.fkp,
    this.cop,
    this.ghs,
    this.hkd,
    this.pln,
    this.ssp,
    this.bob,
    this.tmt,
    this.khr,
    this.dop,
    this.ron,
    this.pab,
    this.clp,
    this.jmd,
    this.currenciesTry,
    this.htg,
    this.kmf,
    this.kwd,
    this.ars,
    this.scr,
    this.lak,
    this.twd,
    this.php,
    this.cny,
    this.uah,
    this.ngn,
    this.awg,
    this.amd,
    this.sll,
    this.vuv,
    this.bbd,
    this.mkd,
    this.hnl,
    this.afn,
    this.sdg,
    this.bwp,
    this.mxn,
    this.lyd,
    this.wst,
    this.pen,
    this.npr,
    this.sar,
    this.cdf,
    this.top,
    this.uzs,
    this.btn,
    this.kpw,
    this.zmw,
    this.kgs,
    this.mop,
    this.lkr,
    this.rwf,
    this.qar,
    this.bgn,
  });

  Aed? rub;
  Aed? bnd;
  Aed? sgd;
  Aed? gip;
  Aed? sek;
  Aed? eur;
  Aed? cad;
  Aed? rsd;
  Aed? jod;
  Aed? yer;
  Aed? ern;
  Aed? mur;
  Aed? aud;
  Aed? byn;
  Aed? chf;
  Aed? tzs;
  Aed? nio;
  Aed? mru;
  Aed? xpf;
  Aed? huf;
  Aed? pgk;
  Aed? fjd;
  Aed? tvd;
  Aed? usd;
  Aed? mnt;
  Aed? kzt;
  Aed? syp;
  Aed? gbp;
  Aed? imp;
  Aed? mwk;
  Aed? all;
  Aed? czk;
  Aed? isk;
  Aed? sbd;
  Aed? crc;
  Aed? krw;
  Aed? xcd;
  Aed? srd;
  Aed? mga;
  Aed? xof;
  Aed? thb;
  Aed? ckd;
  Aed? nzd;
  Aed? kyd;
  Aed? nok;
  Aed? lrd;
  Aed? aoa;
  Aed? vnd;
  Aed? mdl;
  Aed? dkk;
  Aed? jpy;
  Aed? myr;
  Aed? lbp;
  Aed? ils;
  Aed? azn;
  Aed? jep;
  Aed? bmd;
  Aed? djf;
  Aed? gmd;
  Aed? kid;
  Aed? nad;
  Aed? zar;
  Aed? mad;
  Aed? sos;
  Aed? cuc;
  Aed? cup;
  Aed? xaf;
  Aed? bzd;
  Aed? ttd;
  Aed? dzd;
  Aed? idr;
  Aed? ves;
  Bam? bam;
  Aed? shp;
  Aed? pkr;
  Aed? omr;
  Aed? pyg;
  Aed? iqd;
  Aed? mvr;
  Aed? bdt;
  Aed? szl;
  Aed? tjs;
  Aed? aed;
  Aed? stn;
  Aed? gtq;
  Aed? tnd;
  Aed? ggp;
  Aed? cve;
  Aed? egp;
  Aed? inr;
  Aed? gyd;
  Aed? mzn;
  Aed? bsd;
  Aed? brl;
  Aed? fok;
  Aed? gel;
  Aed? zwl;
  Aed? etb;
  Aed? irr;
  Aed? bhd;
  Aed? gnf;
  Aed? kes;
  Aed? bif;
  Aed? ang;
  Aed? lsl;
  Aed? uyu;
  Aed? ugx;
  Aed? mmk;
  Aed? fkp;
  Aed? cop;
  Aed? ghs;
  Aed? hkd;
  Aed? pln;
  Aed? ssp;
  Aed? bob;
  Aed? tmt;
  Aed? khr;
  Aed? dop;
  Aed? ron;
  Aed? pab;
  Aed? clp;
  Aed? jmd;
  Aed? currenciesTry;
  Aed? htg;
  Aed? kmf;
  Aed? kwd;
  Aed? ars;
  Aed? scr;
  Aed? lak;
  Aed? twd;
  Aed? php;
  Aed? cny;
  Aed? uah;
  Aed? ngn;
  Aed? awg;
  Aed? amd;
  Aed? sll;
  Aed? vuv;
  Aed? bbd;
  Aed? mkd;
  Aed? hnl;
  Aed? afn;
  Bam? sdg;
  Aed? bwp;
  Aed? mxn;
  Aed? lyd;
  Aed? wst;
  Aed? pen;
  Aed? npr;
  Aed? sar;
  Aed? cdf;
  Aed? top;
  Aed? uzs;
  Aed? btn;
  Aed? kpw;
  Aed? zmw;
  Aed? kgs;
  Aed? mop;
  Aed? lkr;
  Aed? rwf;
  Aed? qar;
  Aed? bgn;

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
        rub: json["RUB"] == null ? null : Aed.fromJson(json["RUB"]),
        bnd: json["BND"] == null ? null : Aed.fromJson(json["BND"]),
        sgd: json["SGD"] == null ? null : Aed.fromJson(json["SGD"]),
        gip: json["GIP"] == null ? null : Aed.fromJson(json["GIP"]),
        sek: json["SEK"] == null ? null : Aed.fromJson(json["SEK"]),
        eur: json["EUR"] == null ? null : Aed.fromJson(json["EUR"]),
        cad: json["CAD"] == null ? null : Aed.fromJson(json["CAD"]),
        rsd: json["RSD"] == null ? null : Aed.fromJson(json["RSD"]),
        jod: json["JOD"] == null ? null : Aed.fromJson(json["JOD"]),
        yer: json["YER"] == null ? null : Aed.fromJson(json["YER"]),
        ern: json["ERN"] == null ? null : Aed.fromJson(json["ERN"]),
        mur: json["MUR"] == null ? null : Aed.fromJson(json["MUR"]),
        aud: json["AUD"] == null ? null : Aed.fromJson(json["AUD"]),
        byn: json["BYN"] == null ? null : Aed.fromJson(json["BYN"]),
        chf: json["CHF"] == null ? null : Aed.fromJson(json["CHF"]),
        tzs: json["TZS"] == null ? null : Aed.fromJson(json["TZS"]),
        nio: json["NIO"] == null ? null : Aed.fromJson(json["NIO"]),
        mru: json["MRU"] == null ? null : Aed.fromJson(json["MRU"]),
        xpf: json["XPF"] == null ? null : Aed.fromJson(json["XPF"]),
        huf: json["HUF"] == null ? null : Aed.fromJson(json["HUF"]),
        pgk: json["PGK"] == null ? null : Aed.fromJson(json["PGK"]),
        fjd: json["FJD"] == null ? null : Aed.fromJson(json["FJD"]),
        tvd: json["TVD"] == null ? null : Aed.fromJson(json["TVD"]),
        usd: json["USD"] == null ? null : Aed.fromJson(json["USD"]),
        mnt: json["MNT"] == null ? null : Aed.fromJson(json["MNT"]),
        kzt: json["KZT"] == null ? null : Aed.fromJson(json["KZT"]),
        syp: json["SYP"] == null ? null : Aed.fromJson(json["SYP"]),
        gbp: json["GBP"] == null ? null : Aed.fromJson(json["GBP"]),
        imp: json["IMP"] == null ? null : Aed.fromJson(json["IMP"]),
        mwk: json["MWK"] == null ? null : Aed.fromJson(json["MWK"]),
        all: json["ALL"] == null ? null : Aed.fromJson(json["ALL"]),
        czk: json["CZK"] == null ? null : Aed.fromJson(json["CZK"]),
        isk: json["ISK"] == null ? null : Aed.fromJson(json["ISK"]),
        sbd: json["SBD"] == null ? null : Aed.fromJson(json["SBD"]),
        crc: json["CRC"] == null ? null : Aed.fromJson(json["CRC"]),
        krw: json["KRW"] == null ? null : Aed.fromJson(json["KRW"]),
        xcd: json["XCD"] == null ? null : Aed.fromJson(json["XCD"]),
        srd: json["SRD"] == null ? null : Aed.fromJson(json["SRD"]),
        mga: json["MGA"] == null ? null : Aed.fromJson(json["MGA"]),
        xof: json["XOF"] == null ? null : Aed.fromJson(json["XOF"]),
        thb: json["THB"] == null ? null : Aed.fromJson(json["THB"]),
        ckd: json["CKD"] == null ? null : Aed.fromJson(json["CKD"]),
        nzd: json["NZD"] == null ? null : Aed.fromJson(json["NZD"]),
        kyd: json["KYD"] == null ? null : Aed.fromJson(json["KYD"]),
        nok: json["NOK"] == null ? null : Aed.fromJson(json["NOK"]),
        lrd: json["LRD"] == null ? null : Aed.fromJson(json["LRD"]),
        aoa: json["AOA"] == null ? null : Aed.fromJson(json["AOA"]),
        vnd: json["VND"] == null ? null : Aed.fromJson(json["VND"]),
        mdl: json["MDL"] == null ? null : Aed.fromJson(json["MDL"]),
        dkk: json["DKK"] == null ? null : Aed.fromJson(json["DKK"]),
        jpy: json["JPY"] == null ? null : Aed.fromJson(json["JPY"]),
        myr: json["MYR"] == null ? null : Aed.fromJson(json["MYR"]),
        lbp: json["LBP"] == null ? null : Aed.fromJson(json["LBP"]),
        ils: json["ILS"] == null ? null : Aed.fromJson(json["ILS"]),
        azn: json["AZN"] == null ? null : Aed.fromJson(json["AZN"]),
        jep: json["JEP"] == null ? null : Aed.fromJson(json["JEP"]),
        bmd: json["BMD"] == null ? null : Aed.fromJson(json["BMD"]),
        djf: json["DJF"] == null ? null : Aed.fromJson(json["DJF"]),
        gmd: json["GMD"] == null ? null : Aed.fromJson(json["GMD"]),
        kid: json["KID"] == null ? null : Aed.fromJson(json["KID"]),
        nad: json["NAD"] == null ? null : Aed.fromJson(json["NAD"]),
        zar: json["ZAR"] == null ? null : Aed.fromJson(json["ZAR"]),
        mad: json["MAD"] == null ? null : Aed.fromJson(json["MAD"]),
        sos: json["SOS"] == null ? null : Aed.fromJson(json["SOS"]),
        cuc: json["CUC"] == null ? null : Aed.fromJson(json["CUC"]),
        cup: json["CUP"] == null ? null : Aed.fromJson(json["CUP"]),
        xaf: json["XAF"] == null ? null : Aed.fromJson(json["XAF"]),
        bzd: json["BZD"] == null ? null : Aed.fromJson(json["BZD"]),
        ttd: json["TTD"] == null ? null : Aed.fromJson(json["TTD"]),
        dzd: json["DZD"] == null ? null : Aed.fromJson(json["DZD"]),
        idr: json["IDR"] == null ? null : Aed.fromJson(json["IDR"]),
        ves: json["VES"] == null ? null : Aed.fromJson(json["VES"]),
        bam: json["BAM"] == null ? null : Bam.fromJson(json["BAM"]),
        shp: json["SHP"] == null ? null : Aed.fromJson(json["SHP"]),
        pkr: json["PKR"] == null ? null : Aed.fromJson(json["PKR"]),
        omr: json["OMR"] == null ? null : Aed.fromJson(json["OMR"]),
        pyg: json["PYG"] == null ? null : Aed.fromJson(json["PYG"]),
        iqd: json["IQD"] == null ? null : Aed.fromJson(json["IQD"]),
        mvr: json["MVR"] == null ? null : Aed.fromJson(json["MVR"]),
        bdt: json["BDT"] == null ? null : Aed.fromJson(json["BDT"]),
        szl: json["SZL"] == null ? null : Aed.fromJson(json["SZL"]),
        tjs: json["TJS"] == null ? null : Aed.fromJson(json["TJS"]),
        aed: json["AED"] == null ? null : Aed.fromJson(json["AED"]),
        stn: json["STN"] == null ? null : Aed.fromJson(json["STN"]),
        gtq: json["GTQ"] == null ? null : Aed.fromJson(json["GTQ"]),
        tnd: json["TND"] == null ? null : Aed.fromJson(json["TND"]),
        ggp: json["GGP"] == null ? null : Aed.fromJson(json["GGP"]),
        cve: json["CVE"] == null ? null : Aed.fromJson(json["CVE"]),
        egp: json["EGP"] == null ? null : Aed.fromJson(json["EGP"]),
        inr: json["INR"] == null ? null : Aed.fromJson(json["INR"]),
        gyd: json["GYD"] == null ? null : Aed.fromJson(json["GYD"]),
        mzn: json["MZN"] == null ? null : Aed.fromJson(json["MZN"]),
        bsd: json["BSD"] == null ? null : Aed.fromJson(json["BSD"]),
        brl: json["BRL"] == null ? null : Aed.fromJson(json["BRL"]),
        fok: json["FOK"] == null ? null : Aed.fromJson(json["FOK"]),
        gel: json["GEL"] == null ? null : Aed.fromJson(json["GEL"]),
        zwl: json["ZWL"] == null ? null : Aed.fromJson(json["ZWL"]),
        etb: json["ETB"] == null ? null : Aed.fromJson(json["ETB"]),
        irr: json["IRR"] == null ? null : Aed.fromJson(json["IRR"]),
        bhd: json["BHD"] == null ? null : Aed.fromJson(json["BHD"]),
        gnf: json["GNF"] == null ? null : Aed.fromJson(json["GNF"]),
        kes: json["KES"] == null ? null : Aed.fromJson(json["KES"]),
        bif: json["BIF"] == null ? null : Aed.fromJson(json["BIF"]),
        ang: json["ANG"] == null ? null : Aed.fromJson(json["ANG"]),
        lsl: json["LSL"] == null ? null : Aed.fromJson(json["LSL"]),
        uyu: json["UYU"] == null ? null : Aed.fromJson(json["UYU"]),
        ugx: json["UGX"] == null ? null : Aed.fromJson(json["UGX"]),
        mmk: json["MMK"] == null ? null : Aed.fromJson(json["MMK"]),
        fkp: json["FKP"] == null ? null : Aed.fromJson(json["FKP"]),
        cop: json["COP"] == null ? null : Aed.fromJson(json["COP"]),
        ghs: json["GHS"] == null ? null : Aed.fromJson(json["GHS"]),
        hkd: json["HKD"] == null ? null : Aed.fromJson(json["HKD"]),
        pln: json["PLN"] == null ? null : Aed.fromJson(json["PLN"]),
        ssp: json["SSP"] == null ? null : Aed.fromJson(json["SSP"]),
        bob: json["BOB"] == null ? null : Aed.fromJson(json["BOB"]),
        tmt: json["TMT"] == null ? null : Aed.fromJson(json["TMT"]),
        khr: json["KHR"] == null ? null : Aed.fromJson(json["KHR"]),
        dop: json["DOP"] == null ? null : Aed.fromJson(json["DOP"]),
        ron: json["RON"] == null ? null : Aed.fromJson(json["RON"]),
        pab: json["PAB"] == null ? null : Aed.fromJson(json["PAB"]),
        clp: json["CLP"] == null ? null : Aed.fromJson(json["CLP"]),
        jmd: json["JMD"] == null ? null : Aed.fromJson(json["JMD"]),
        currenciesTry: json["TRY"] == null ? null : Aed.fromJson(json["TRY"]),
        htg: json["HTG"] == null ? null : Aed.fromJson(json["HTG"]),
        kmf: json["KMF"] == null ? null : Aed.fromJson(json["KMF"]),
        kwd: json["KWD"] == null ? null : Aed.fromJson(json["KWD"]),
        ars: json["ARS"] == null ? null : Aed.fromJson(json["ARS"]),
        scr: json["SCR"] == null ? null : Aed.fromJson(json["SCR"]),
        lak: json["LAK"] == null ? null : Aed.fromJson(json["LAK"]),
        twd: json["TWD"] == null ? null : Aed.fromJson(json["TWD"]),
        php: json["PHP"] == null ? null : Aed.fromJson(json["PHP"]),
        cny: json["CNY"] == null ? null : Aed.fromJson(json["CNY"]),
        uah: json["UAH"] == null ? null : Aed.fromJson(json["UAH"]),
        ngn: json["NGN"] == null ? null : Aed.fromJson(json["NGN"]),
        awg: json["AWG"] == null ? null : Aed.fromJson(json["AWG"]),
        amd: json["AMD"] == null ? null : Aed.fromJson(json["AMD"]),
        sll: json["SLL"] == null ? null : Aed.fromJson(json["SLL"]),
        vuv: json["VUV"] == null ? null : Aed.fromJson(json["VUV"]),
        bbd: json["BBD"] == null ? null : Aed.fromJson(json["BBD"]),
        mkd: json["MKD"] == null ? null : Aed.fromJson(json["MKD"]),
        hnl: json["HNL"] == null ? null : Aed.fromJson(json["HNL"]),
        afn: json["AFN"] == null ? null : Aed.fromJson(json["AFN"]),
        sdg: json["SDG"] == null ? null : Bam.fromJson(json["SDG"]),
        bwp: json["BWP"] == null ? null : Aed.fromJson(json["BWP"]),
        mxn: json["MXN"] == null ? null : Aed.fromJson(json["MXN"]),
        lyd: json["LYD"] == null ? null : Aed.fromJson(json["LYD"]),
        wst: json["WST"] == null ? null : Aed.fromJson(json["WST"]),
        pen: json["PEN"] == null ? null : Aed.fromJson(json["PEN"]),
        npr: json["NPR"] == null ? null : Aed.fromJson(json["NPR"]),
        sar: json["SAR"] == null ? null : Aed.fromJson(json["SAR"]),
        cdf: json["CDF"] == null ? null : Aed.fromJson(json["CDF"]),
        top: json["TOP"] == null ? null : Aed.fromJson(json["TOP"]),
        uzs: json["UZS"] == null ? null : Aed.fromJson(json["UZS"]),
        btn: json["BTN"] == null ? null : Aed.fromJson(json["BTN"]),
        kpw: json["KPW"] == null ? null : Aed.fromJson(json["KPW"]),
        zmw: json["ZMW"] == null ? null : Aed.fromJson(json["ZMW"]),
        kgs: json["KGS"] == null ? null : Aed.fromJson(json["KGS"]),
        mop: json["MOP"] == null ? null : Aed.fromJson(json["MOP"]),
        lkr: json["LKR"] == null ? null : Aed.fromJson(json["LKR"]),
        rwf: json["RWF"] == null ? null : Aed.fromJson(json["RWF"]),
        qar: json["QAR"] == null ? null : Aed.fromJson(json["QAR"]),
        bgn: json["BGN"] == null ? null : Aed.fromJson(json["BGN"]),
      );

  Map<String, dynamic> toJson() => {
        "RUB": rub?.toJson(),
        "BND": bnd?.toJson(),
        "SGD": sgd?.toJson(),
        "GIP": gip?.toJson(),
        "SEK": sek?.toJson(),
        "EUR": eur?.toJson(),
        "CAD": cad?.toJson(),
        "RSD": rsd?.toJson(),
        "JOD": jod?.toJson(),
        "YER": yer?.toJson(),
        "ERN": ern?.toJson(),
        "MUR": mur?.toJson(),
        "AUD": aud?.toJson(),
        "BYN": byn?.toJson(),
        "CHF": chf?.toJson(),
        "TZS": tzs?.toJson(),
        "NIO": nio?.toJson(),
        "MRU": mru?.toJson(),
        "XPF": xpf?.toJson(),
        "HUF": huf?.toJson(),
        "PGK": pgk?.toJson(),
        "FJD": fjd?.toJson(),
        "TVD": tvd?.toJson(),
        "USD": usd?.toJson(),
        "MNT": mnt?.toJson(),
        "KZT": kzt?.toJson(),
        "SYP": syp?.toJson(),
        "GBP": gbp?.toJson(),
        "IMP": imp?.toJson(),
        "MWK": mwk?.toJson(),
        "ALL": all?.toJson(),
        "CZK": czk?.toJson(),
        "ISK": isk?.toJson(),
        "SBD": sbd?.toJson(),
        "CRC": crc?.toJson(),
        "KRW": krw?.toJson(),
        "XCD": xcd?.toJson(),
        "SRD": srd?.toJson(),
        "MGA": mga?.toJson(),
        "XOF": xof?.toJson(),
        "THB": thb?.toJson(),
        "CKD": ckd?.toJson(),
        "NZD": nzd?.toJson(),
        "KYD": kyd?.toJson(),
        "NOK": nok?.toJson(),
        "LRD": lrd?.toJson(),
        "AOA": aoa?.toJson(),
        "VND": vnd?.toJson(),
        "MDL": mdl?.toJson(),
        "DKK": dkk?.toJson(),
        "JPY": jpy?.toJson(),
        "MYR": myr?.toJson(),
        "LBP": lbp?.toJson(),
        "ILS": ils?.toJson(),
        "AZN": azn?.toJson(),
        "JEP": jep?.toJson(),
        "BMD": bmd?.toJson(),
        "DJF": djf?.toJson(),
        "GMD": gmd?.toJson(),
        "KID": kid?.toJson(),
        "NAD": nad?.toJson(),
        "ZAR": zar?.toJson(),
        "MAD": mad?.toJson(),
        "SOS": sos?.toJson(),
        "CUC": cuc?.toJson(),
        "CUP": cup?.toJson(),
        "XAF": xaf?.toJson(),
        "BZD": bzd?.toJson(),
        "TTD": ttd?.toJson(),
        "DZD": dzd?.toJson(),
        "IDR": idr?.toJson(),
        "VES": ves?.toJson(),
        "BAM": bam?.toJson(),
        "SHP": shp?.toJson(),
        "PKR": pkr?.toJson(),
        "OMR": omr?.toJson(),
        "PYG": pyg?.toJson(),
        "IQD": iqd?.toJson(),
        "MVR": mvr?.toJson(),
        "BDT": bdt?.toJson(),
        "SZL": szl?.toJson(),
        "TJS": tjs?.toJson(),
        "AED": aed?.toJson(),
        "STN": stn?.toJson(),
        "GTQ": gtq?.toJson(),
        "TND": tnd?.toJson(),
        "GGP": ggp?.toJson(),
        "CVE": cve?.toJson(),
        "EGP": egp?.toJson(),
        "INR": inr?.toJson(),
        "GYD": gyd?.toJson(),
        "MZN": mzn?.toJson(),
        "BSD": bsd?.toJson(),
        "BRL": brl?.toJson(),
        "FOK": fok?.toJson(),
        "GEL": gel?.toJson(),
        "ZWL": zwl?.toJson(),
        "ETB": etb?.toJson(),
        "IRR": irr?.toJson(),
        "BHD": bhd?.toJson(),
        "GNF": gnf?.toJson(),
        "KES": kes?.toJson(),
        "BIF": bif?.toJson(),
        "ANG": ang?.toJson(),
        "LSL": lsl?.toJson(),
        "UYU": uyu?.toJson(),
        "UGX": ugx?.toJson(),
        "MMK": mmk?.toJson(),
        "FKP": fkp?.toJson(),
        "COP": cop?.toJson(),
        "GHS": ghs?.toJson(),
        "HKD": hkd?.toJson(),
        "PLN": pln?.toJson(),
        "SSP": ssp?.toJson(),
        "BOB": bob?.toJson(),
        "TMT": tmt?.toJson(),
        "KHR": khr?.toJson(),
        "DOP": dop?.toJson(),
        "RON": ron?.toJson(),
        "PAB": pab?.toJson(),
        "CLP": clp?.toJson(),
        "JMD": jmd?.toJson(),
        "TRY": currenciesTry?.toJson(),
        "HTG": htg?.toJson(),
        "KMF": kmf?.toJson(),
        "KWD": kwd?.toJson(),
        "ARS": ars?.toJson(),
        "SCR": scr?.toJson(),
        "LAK": lak?.toJson(),
        "TWD": twd?.toJson(),
        "PHP": php?.toJson(),
        "CNY": cny?.toJson(),
        "UAH": uah?.toJson(),
        "NGN": ngn?.toJson(),
        "AWG": awg?.toJson(),
        "AMD": amd?.toJson(),
        "SLL": sll?.toJson(),
        "VUV": vuv?.toJson(),
        "BBD": bbd?.toJson(),
        "MKD": mkd?.toJson(),
        "HNL": hnl?.toJson(),
        "AFN": afn?.toJson(),
        "SDG": sdg?.toJson(),
        "BWP": bwp?.toJson(),
        "MXN": mxn?.toJson(),
        "LYD": lyd?.toJson(),
        "WST": wst?.toJson(),
        "PEN": pen?.toJson(),
        "NPR": npr?.toJson(),
        "SAR": sar?.toJson(),
        "CDF": cdf?.toJson(),
        "TOP": top?.toJson(),
        "UZS": uzs?.toJson(),
        "BTN": btn?.toJson(),
        "KPW": kpw?.toJson(),
        "ZMW": zmw?.toJson(),
        "KGS": kgs?.toJson(),
        "MOP": mop?.toJson(),
        "LKR": lkr?.toJson(),
        "RWF": rwf?.toJson(),
        "QAR": qar?.toJson(),
        "BGN": bgn?.toJson(),
      };
}

class Aed {
  Aed({
    required this.name,
    required this.symbol,
  });

  String name;
  String symbol;

  factory Aed.fromJson(Map<String, dynamic> json) => Aed(
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
      };
}

class Bam {
  Bam({
    required this.name,
  });

  String name;

  factory Bam.fromJson(Map<String, dynamic> json) => Bam(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Demonyms {
  Demonyms({
    required this.eng,
    this.fra,
  });

  Eng eng;
  Eng? fra;

  factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
        eng: Eng.fromJson(json["eng"]),
        fra: json["fra"] == null ? null : Eng.fromJson(json["fra"]),
      );

  Map<String, dynamic> toJson() => {
        "eng": eng.toJson(),
        "fra": fra?.toJson(),
      };
}

class Eng {
  Eng({
    required this.f,
    required this.m,
  });

  String f;
  String m;

  factory Eng.fromJson(Map<String, dynamic> json) => Eng(
        f: json["f"],
        m: json["m"],
      );

  Map<String, dynamic> toJson() => {
        "f": f,
        "m": m,
      };
}

class Flags {
  Flags({
    required this.png,
    required this.svg,
    this.alt,
  });

  String png;
  String svg;
  String? alt;

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
        "alt": alt,
      };
}

class Idd {
  Idd({
    this.root,
    this.suffixes,
  });

  String? root;
  List<String>? suffixes;

  factory Idd.fromJson(Map<String, dynamic> json) => Idd(
        root: json["root"],
        suffixes: json["suffixes"] == null
            ? []
            : List<String>.from(json["suffixes"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "root": root,
        "suffixes":
            suffixes == null ? [] : List<dynamic>.from(suffixes!.map((x) => x)),
      };
}

class Maps {
  Maps({
    required this.googleMaps,
    required this.openStreetMaps,
  });

  String googleMaps;
  String openStreetMaps;

  factory Maps.fromJson(Map<String, dynamic> json) => Maps(
        googleMaps: json["googleMaps"],
        openStreetMaps: json["openStreetMaps"],
      );

  Map<String, dynamic> toJson() => {
        "googleMaps": googleMaps,
        "openStreetMaps": openStreetMaps,
      };
}

class Name {
  Name({
    required this.common,
    required this.official,
    this.nativeName,
  });

  String common;
  String official;
  Map<String, Translation>? nativeName;

  factory Name.fromJson(Map<String, dynamic> json) =>
      Name(common: json["common"], official: json["official"]);

  Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        "nativeName": Map.from(nativeName!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Translation {
  Translation({
    required this.official,
    required this.common,
  });

  String official;
  String common;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        official: json["official"],
        common: json["common"],
      );

  Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
      };
}

class PostalCode {
  PostalCode({
    required this.format,
    this.regex,
  });

  String format;
  String? regex;

  factory PostalCode.fromJson(Map<String, dynamic> json) => PostalCode(
        format: json["format"],
        regex: json["regex"],
      );

  Map<String, dynamic> toJson() => {
        "format": format,
        "regex": regex,
      };
}

enum Region { EUROPE, ASIA, AMERICAS, AFRICA, OCEANIA, ANTARCTIC }

final regionValues = EnumValues({
  "Africa": Region.AFRICA,
  "Americas": Region.AMERICAS,
  "Antarctic": Region.ANTARCTIC,
  "Asia": Region.ASIA,
  "Europe": Region.EUROPE,
  "Oceania": Region.OCEANIA
});

enum StartOfWeek { MONDAY, SUNDAY, SATURDAY }

final startOfWeekValues = EnumValues({
  "monday": StartOfWeek.MONDAY,
  "saturday": StartOfWeek.SATURDAY,
  "sunday": StartOfWeek.SUNDAY
});

enum Status { OFFICIALLY_ASSIGNED, USER_ASSIGNED }

final statusValues = EnumValues({
  "officially-assigned": Status.OFFICIALLY_ASSIGNED,
  "user-assigned": Status.USER_ASSIGNED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
