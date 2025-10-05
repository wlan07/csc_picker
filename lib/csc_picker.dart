library csc_picker;

import 'package:csc_picker/dropdown_with_search.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'model/select_status_model.dart';

export 'model/select_status_model.dart';

enum Layout { vertical, horizontal }

enum CountryFlag { SHOW_IN_DROP_DOWN_ONLY, ENABLE, DISABLE }

enum CscCountry {
  Afghanistan,
  Aland_Islands,
  Albania,
  Algeria,
  American_Samoa,
  Andorra,
  Angola,
  Anguilla,
  Antarctica,
  Antigua_And_Barbuda,
  Argentina,
  Armenia,
  Aruba,
  Australia,
  Austria,
  Azerbaijan,
  Bahamas_The,
  Bahrain,
  Bangladesh,
  Barbados,
  Belarus,
  Belgium,
  Belize,
  Benin,
  Bermuda,
  Bhutan,
  Bolivia,
  Bosnia_and_Herzegovina,
  Botswana,
  Bouvet_Island,
  Brazil,
  British_Indian_Ocean_Territory,
  Brunei,
  Bulgaria,
  Burkina_Faso,
  Burundi,
  Cambodia,
  Cameroon,
  Canada,
  Cape_Verde,
  Cayman_Islands,
  Central_African_Republic,
  Chad,
  Chile,
  China,
  Christmas_Island,
  Cocos_Keeling_Islands,
  Colombia,
  Comoros,
  Congo,
  Congo_The_Democratic_Republic_Of_The,
  Cook_Islands,
  Costa_Rica,
  Cote_D_Ivoire_Ivory_Coast,
  Croatia_Hrvatska,
  Cuba,
  Cyprus,
  Czech_Republic,
  Denmark,
  Djibouti,
  Dominica,
  Dominican_Republic,
  East_Timor,
  Ecuador,
  Egypt,
  El_Salvador,
  Equatorial_Guinea,
  Eritrea,
  Estonia,
  Ethiopia,
  Falkland_Islands,
  Faroe_Islands,
  Fiji_Islands,
  Finland,
  France,
  French_Guiana,
  French_Polynesia,
  French_Southern_Territories,
  Gabon,
  Gambia_The,
  Georgia,
  Germany,
  Ghana,
  Gibraltar,
  Greece,
  Greenland,
  Grenada,
  Guadeloupe,
  Guam,
  Guatemala,
  Guernsey_and_Alderney,
  Guinea,
  Guinea_Bissau,
  Guyana,
  Haiti,
  Heard_Island_and_McDonald_Islands,
  Honduras,
  Hong_Kong_S_A_R,
  Hungary,
  Iceland,
  India,
  Indonesia,
  Iran,
  Iraq,
  Ireland,
  Israel,
  Italy,
  Jamaica,
  Japan,
  Jersey,
  Jordan,
  Kazakhstan,
  Kenya,
  Kiribati,
  Korea_North,
  Korea_South,
  Kuwait,
  Kyrgyzstan,
  Laos,
  Latvia,
  Lebanon,
  Lesotho,
  Liberia,
  Libya,
  Liechtenstein,
  Lithuania,
  Luxembourg,
  Macau_S_A_R,
  Macedonia,
  Madagascar,
  Malawi,
  Malaysia,
  Maldives,
  Mali,
  Malta,
  Man_Isle_of,
  Marshall_Islands,
  Martinique,
  Mauritania,
  Mauritius,
  Mayotte,
  Mexico,
  Micronesia,
  Moldova,
  Monaco,
  Mongolia,
  Montenegro,
  Montserrat,
  Morocco,
  Mozambique,
  Myanmar,
  Namibia,
  Nauru,
  Nepal,
  Bonaire_Sint_Eustatius_and_Saba,
  Netherlands_The,
  New_Caledonia,
  New_Zealand,
  Nicaragua,
  Niger,
  Nigeria,
  Niue,
  Norfolk_Island,
  Northern_Mariana_Islands,
  Norway,
  Oman,
  Pakistan,
  Palau,
  Palestinian_Territory_Occupied,
  Panama,
  Papua_new_Guinea,
  Paraguay,
  Peru,
  Philippines,
  Pitcairn_Island,
  Poland,
  Portugal,
  Puerto_Rico,
  Qatar,
  Reunion,
  Romania,
  Russia,
  Rwanda,
  Saint_Helena,
  Saint_Kitts_And_Nevis,
  Saint_Lucia,
  Saint_Pierre_and_Miquelon,
  Saint_Vincent_And_The_Grenadines,
  Saint_Barthelemy,
  Saint_Martin_French_part,
  Samoa,
  San_Marino,
  Sao_Tome_and_Principe,
  Saudi_Arabia,
  Senegal,
  Serbia,
  Seychelles,
  Sierra_Leone,
  Singapore,
  Slovakia,
  Slovenia,
  Solomon_Islands,
  Somalia,
  South_Africa,
  South_Georgia,
  South_Sudan,
  Spain,
  Sri_Lanka,
  Sudan,
  Suriname,
  Svalbard_And_Jan_Mayen_Islands,
  Swaziland,
  Sweden,
  Switzerland,
  Syria,
  Taiwan,
  Tajikistan,
  Tanzania,
  Thailand,
  Togo,
  Tokelau,
  Tonga,
  Trinidad_And_Tobago,
  Tunisia,
  Turkey,
  Turkmenistan,
  Turks_And_Caicos_Islands,
  Tuvalu,
  Uganda,
  Ukraine,
  United_Arab_Emirates,
  United_Kingdom,
  United_States,
  United_States_Minor_Outlying_Islands,
  Uruguay,
  Uzbekistan,
  Vanuatu,
  Vatican_City_State_Holy_See,
  Venezuela,
  Vietnam,
  Virgin_Islands_British,
  Virgin_Islands_US,
  Wallis_And_Futuna_Islands,
  Western_Sahara,
  Yemen,
  Zambia,
  Zimbabwe,
  Kosovo,
  Curacao,
  Sint_Maarten_Dutch_part
}

const Map<CscCountry, int> Countries = {
  CscCountry.Afghanistan: 0,
  CscCountry.Aland_Islands: 1,
  CscCountry.Albania: 2,
  CscCountry.Algeria: 3,
  CscCountry.American_Samoa: 4,
  CscCountry.Andorra: 5,
  CscCountry.Angola: 6,
  CscCountry.Anguilla: 7,
  CscCountry.Antarctica: 8,
  CscCountry.Antigua_And_Barbuda: 9,
  CscCountry.Argentina: 10,
  CscCountry.Armenia: 11,
  CscCountry.Aruba: 12,
  CscCountry.Australia: 13,
  CscCountry.Austria: 14,
  CscCountry.Azerbaijan: 15,
  CscCountry.Bahamas_The: 16,
  CscCountry.Bahrain: 17,
  CscCountry.Bangladesh: 18,
  CscCountry.Barbados: 19,
  CscCountry.Belarus: 20,
  CscCountry.Belgium: 21,
  CscCountry.Belize: 22,
  CscCountry.Benin: 23,
  CscCountry.Bermuda: 24,
  CscCountry.Bhutan: 25,
  CscCountry.Bolivia: 26,
  CscCountry.Bosnia_and_Herzegovina: 27,
  CscCountry.Botswana: 28,
  CscCountry.Bouvet_Island: 29,
  CscCountry.Brazil: 30,
  CscCountry.British_Indian_Ocean_Territory: 31,
  CscCountry.Brunei: 32,
  CscCountry.Bulgaria: 33,
  CscCountry.Burkina_Faso: 34,
  CscCountry.Burundi: 35,
  CscCountry.Cambodia: 36,
  CscCountry.Cameroon: 37,
  CscCountry.Canada: 38,
  CscCountry.Cape_Verde: 39,
  CscCountry.Cayman_Islands: 40,
  CscCountry.Central_African_Republic: 41,
  CscCountry.Chad: 42,
  CscCountry.Chile: 43,
  CscCountry.China: 44,
  CscCountry.Christmas_Island: 45,
  CscCountry.Cocos_Keeling_Islands: 46,
  CscCountry.Colombia: 47,
  CscCountry.Comoros: 48,
  CscCountry.Congo: 49,
  CscCountry.Congo_The_Democratic_Republic_Of_The: 50,
  CscCountry.Cook_Islands: 51,
  CscCountry.Costa_Rica: 52,
  CscCountry.Cote_D_Ivoire_Ivory_Coast: 53,
  CscCountry.Croatia_Hrvatska: 54,
  CscCountry.Cuba: 55,
  CscCountry.Cyprus: 56,
  CscCountry.Czech_Republic: 57,
  CscCountry.Denmark: 58,
  CscCountry.Djibouti: 59,
  CscCountry.Dominica: 60,
  CscCountry.Dominican_Republic: 61,
  CscCountry.East_Timor: 62,
  CscCountry.Ecuador: 63,
  CscCountry.Egypt: 64,
  CscCountry.El_Salvador: 65,
  CscCountry.Equatorial_Guinea: 66,
  CscCountry.Eritrea: 67,
  CscCountry.Estonia: 68,
  CscCountry.Ethiopia: 69,
  CscCountry.Falkland_Islands: 70,
  CscCountry.Faroe_Islands: 71,
  CscCountry.Fiji_Islands: 72,
  CscCountry.Finland: 73,
  CscCountry.France: 74,
  CscCountry.French_Guiana: 75,
  CscCountry.French_Polynesia: 76,
  CscCountry.French_Southern_Territories: 77,
  CscCountry.Gabon: 78,
  CscCountry.Gambia_The: 79,
  CscCountry.Georgia: 80,
  CscCountry.Germany: 81,
  CscCountry.Ghana: 82,
  CscCountry.Gibraltar: 83,
  CscCountry.Greece: 84,
  CscCountry.Greenland: 85,
  CscCountry.Grenada: 86,
  CscCountry.Guadeloupe: 87,
  CscCountry.Guam: 88,
  CscCountry.Guatemala: 89,
  CscCountry.Guernsey_and_Alderney: 90,
  CscCountry.Guinea: 91,
  CscCountry.Guinea_Bissau: 92,
  CscCountry.Guyana: 93,
  CscCountry.Haiti: 94,
  CscCountry.Heard_Island_and_McDonald_Islands: 95,
  CscCountry.Honduras: 96,
  CscCountry.Hong_Kong_S_A_R: 97,
  CscCountry.Hungary: 98,
  CscCountry.Iceland: 99,
  CscCountry.India: 100,
  CscCountry.Indonesia: 101,
  CscCountry.Iran: 102,
  CscCountry.Iraq: 103,
  CscCountry.Ireland: 104,
  CscCountry.Israel: 105,
  CscCountry.Italy: 106,
  CscCountry.Jamaica: 107,
  CscCountry.Japan: 108,
  CscCountry.Jersey: 109,
  CscCountry.Jordan: 110,
  CscCountry.Kazakhstan: 111,
  CscCountry.Kenya: 112,
  CscCountry.Kiribati: 113,
  CscCountry.Korea_North: 114,
  CscCountry.Korea_South: 115,
  CscCountry.Kuwait: 116,
  CscCountry.Kyrgyzstan: 117,
  CscCountry.Laos: 118,
  CscCountry.Latvia: 119,
  CscCountry.Lebanon: 120,
  CscCountry.Lesotho: 121,
  CscCountry.Liberia: 122,
  CscCountry.Libya: 123,
  CscCountry.Liechtenstein: 124,
  CscCountry.Lithuania: 125,
  CscCountry.Luxembourg: 126,
  CscCountry.Macau_S_A_R: 127,
  CscCountry.Macedonia: 128,
  CscCountry.Madagascar: 129,
  CscCountry.Malawi: 130,
  CscCountry.Malaysia: 131,
  CscCountry.Maldives: 132,
  CscCountry.Mali: 133,
  CscCountry.Malta: 134,
  CscCountry.Man_Isle_of: 135,
  CscCountry.Marshall_Islands: 136,
  CscCountry.Martinique: 137,
  CscCountry.Mauritania: 138,
  CscCountry.Mauritius: 139,
  CscCountry.Mayotte: 140,
  CscCountry.Mexico: 141,
  CscCountry.Micronesia: 142,
  CscCountry.Moldova: 143,
  CscCountry.Monaco: 144,
  CscCountry.Mongolia: 145,
  CscCountry.Montenegro: 146,
  CscCountry.Montserrat: 147,
  CscCountry.Morocco: 148,
  CscCountry.Mozambique: 149,
  CscCountry.Myanmar: 150,
  CscCountry.Namibia: 151,
  CscCountry.Nauru: 152,
  CscCountry.Nepal: 153,
  CscCountry.Bonaire_Sint_Eustatius_and_Saba: 154,
  CscCountry.Netherlands_The: 155,
  CscCountry.New_Caledonia: 156,
  CscCountry.New_Zealand: 157,
  CscCountry.Nicaragua: 158,
  CscCountry.Niger: 159,
  CscCountry.Nigeria: 160,
  CscCountry.Niue: 161,
  CscCountry.Norfolk_Island: 162,
  CscCountry.Northern_Mariana_Islands: 163,
  CscCountry.Norway: 164,
  CscCountry.Oman: 165,
  CscCountry.Pakistan: 166,
  CscCountry.Palau: 167,
  CscCountry.Palestinian_Territory_Occupied: 168,
  CscCountry.Panama: 169,
  CscCountry.Papua_new_Guinea: 170,
  CscCountry.Paraguay: 171,
  CscCountry.Peru: 172,
  CscCountry.Philippines: 173,
  CscCountry.Pitcairn_Island: 174,
  CscCountry.Poland: 175,
  CscCountry.Portugal: 176,
  CscCountry.Puerto_Rico: 177,
  CscCountry.Qatar: 178,
  CscCountry.Reunion: 179,
  CscCountry.Romania: 180,
  CscCountry.Russia: 181,
  CscCountry.Rwanda: 182,
  CscCountry.Saint_Helena: 183,
  CscCountry.Saint_Kitts_And_Nevis: 184,
  CscCountry.Saint_Lucia: 185,
  CscCountry.Saint_Pierre_and_Miquelon: 186,
  CscCountry.Saint_Vincent_And_The_Grenadines: 187,
  CscCountry.Saint_Barthelemy: 188,
  CscCountry.Saint_Martin_French_part: 189,
  CscCountry.Samoa: 190,
  CscCountry.San_Marino: 191,
  CscCountry.Sao_Tome_and_Principe: 192,
  CscCountry.Saudi_Arabia: 193,
  CscCountry.Senegal: 194,
  CscCountry.Serbia: 195,
  CscCountry.Seychelles: 196,
  CscCountry.Sierra_Leone: 197,
  CscCountry.Singapore: 198,
  CscCountry.Slovakia: 199,
  CscCountry.Slovenia: 200,
  CscCountry.Solomon_Islands: 201,
  CscCountry.Somalia: 202,
  CscCountry.South_Africa: 203,
  CscCountry.South_Georgia: 204,
  CscCountry.South_Sudan: 205,
  CscCountry.Spain: 206,
  CscCountry.Sri_Lanka: 207,
  CscCountry.Sudan: 208,
  CscCountry.Suriname: 209,
  CscCountry.Svalbard_And_Jan_Mayen_Islands: 210,
  CscCountry.Swaziland: 211,
  CscCountry.Sweden: 212,
  CscCountry.Switzerland: 213,
  CscCountry.Syria: 214,
  CscCountry.Taiwan: 215,
  CscCountry.Tajikistan: 216,
  CscCountry.Tanzania: 217,
  CscCountry.Thailand: 218,
  CscCountry.Togo: 219,
  CscCountry.Tokelau: 220,
  CscCountry.Tonga: 221,
  CscCountry.Trinidad_And_Tobago: 222,
  CscCountry.Tunisia: 223,
  CscCountry.Turkey: 224,
  CscCountry.Turkmenistan: 225,
  CscCountry.Turks_And_Caicos_Islands: 226,
  CscCountry.Tuvalu: 227,
  CscCountry.Uganda: 228,
  CscCountry.Ukraine: 229,
  CscCountry.United_Arab_Emirates: 230,
  CscCountry.United_Kingdom: 231,
  CscCountry.United_States: 232,
  CscCountry.United_States_Minor_Outlying_Islands: 233,
  CscCountry.Uruguay: 234,
  CscCountry.Uzbekistan: 235,
  CscCountry.Vanuatu: 236,
  CscCountry.Vatican_City_State_Holy_See: 237,
  CscCountry.Venezuela: 238,
  CscCountry.Vietnam: 239,
  CscCountry.Virgin_Islands_British: 240,
  CscCountry.Virgin_Islands_US: 241,
  CscCountry.Wallis_And_Futuna_Islands: 242,
  CscCountry.Western_Sahara: 243,
  CscCountry.Yemen: 244,
  CscCountry.Zambia: 245,
  CscCountry.Zimbabwe: 246,
  CscCountry.Kosovo: 247,
  CscCountry.Curacao: 248,
  CscCountry.Sint_Maarten_Dutch_part: 249,
};

// Reverse mapping: ID (0-249) → ISO2 country code
const Map<int, String> countryIdToIso2 = {
  0: 'AF',
  1: 'AX',
  2: 'AL',
  3: 'DZ',
  4: 'AS',
  5: 'AD',
  6: 'AO',
  7: 'AI',
  8: 'AQ',
  9: 'AG',
  10: 'AR',
  11: 'AM',
  12: 'AW',
  13: 'AU',
  14: 'AT',
  15: 'AZ',
  16: 'BS',
  17: 'BH',
  18: 'BD',
  19: 'BB',
  20: 'BY',
  21: 'BE',
  22: 'BZ',
  23: 'BJ',
  24: 'BM',
  25: 'BT',
  26: 'BO',
  27: 'BA',
  28: 'BW',
  29: 'BV',
  30: 'BR',
  31: 'IO',
  32: 'BN',
  33: 'BG',
  34: 'BF',
  35: 'BI',
  36: 'KH',
  37: 'CM',
  38: 'CA',
  39: 'CV',
  40: 'KY',
  41: 'CF',
  42: 'TD',
  43: 'CL',
  44: 'CN',
  45: 'CX',
  46: 'CC',
  47: 'CO',
  48: 'KM',
  49: 'CG',
  50: 'CD',
  51: 'CK',
  52: 'CR',
  53: 'CI',
  54: 'HR',
  55: 'CU',
  56: 'CY',
  57: 'CZ',
  58: 'DK',
  59: 'DJ',
  60: 'DM',
  61: 'DO',
  62: 'TL',
  63: 'EC',
  64: 'EG',
  65: 'SV',
  66: 'GQ',
  67: 'ER',
  68: 'EE',
  69: 'ET',
  70: 'FK',
  71: 'FO',
  72: 'FJ',
  73: 'FI',
  74: 'FR',
  75: 'GF',
  76: 'PF',
  77: 'TF',
  78: 'GA',
  79: 'GM',
  80: 'GE',
  81: 'DE',
  82: 'GH',
  83: 'GI',
  84: 'GR',
  85: 'GL',
  86: 'GD',
  87: 'GP',
  88: 'GU',
  89: 'GT',
  90: 'GG',
  91: 'GN',
  92: 'GW',
  93: 'GY',
  94: 'HT',
  95: 'HM',
  96: 'HN',
  97: 'HK',
  98: 'HU',
  99: 'IS',
  100: 'IN',
  101: 'ID',
  102: 'IR',
  103: 'IQ',
  104: 'IE',
  105: 'IL',
  106: 'IT',
  107: 'JM',
  108: 'JP',
  109: 'JE',
  110: 'JO',
  111: 'KZ',
  112: 'KE',
  113: 'KI',
  114: 'KP',
  115: 'KR',
  116: 'KW',
  117: 'KG',
  118: 'LA',
  119: 'LV',
  120: 'LB',
  121: 'LS',
  122: 'LR',
  123: 'LY',
  124: 'LI',
  125: 'LT',
  126: 'LU',
  127: 'MO',
  128: 'MK',
  129: 'MG',
  130: 'MW',
  131: 'MY',
  132: 'MV',
  133: 'ML',
  134: 'MT',
  135: 'IM',
  136: 'MH',
  137: 'MQ',
  138: 'MR',
  139: 'MU',
  140: 'YT',
  141: 'MX',
  142: 'FM',
  143: 'MD',
  144: 'MC',
  145: 'MN',
  146: 'ME',
  147: 'MS',
  148: 'MA',
  149: 'MZ',
  150: 'MM',
  151: 'NA',
  152: 'NR',
  153: 'NP',
  154: 'BQ',
  155: 'NL',
  156: 'NC',
  157: 'NZ',
  158: 'NI',
  159: 'NE',
  160: 'NG',
  161: 'NU',
  162: 'NF',
  163: 'MP',
  164: 'NO',
  165: 'OM',
  166: 'PK',
  167: 'PW',
  168: 'PS',
  169: 'PA',
  170: 'PG',
  171: 'PY',
  172: 'PE',
  173: 'PH',
  174: 'PN',
  175: 'PL',
  176: 'PT',
  177: 'PR',
  178: 'QA',
  179: 'RE',
  180: 'RO',
  181: 'RU',
  182: 'RW',
  183: 'SH',
  184: 'KN',
  185: 'LC',
  186: 'PM',
  187: 'VC',
  188: 'BL',
  189: 'MF',
  190: 'WS',
  191: 'SM',
  192: 'ST',
  193: 'SA',
  194: 'SN',
  195: 'RS',
  196: 'SC',
  197: 'SL',
  198: 'SG',
  199: 'SK',
  200: 'SI',
  201: 'SB',
  202: 'SO',
  203: 'ZA',
  204: 'GS',
  205: 'SS',
  206: 'ES',
  207: 'LK',
  208: 'SD',
  209: 'SR',
  210: 'SJ',
  211: 'SZ',
  212: 'SE',
  213: 'CH',
  214: 'SY',
  215: 'TW',
  216: 'TJ',
  217: 'TZ',
  218: 'TH',
  219: 'TG',
  220: 'TK',
  221: 'TO',
  222: 'TT',
  223: 'TN',
  224: 'TR',
  225: 'TM',
  226: 'TC',
  227: 'TV',
  228: 'UG',
  229: 'UA',
  230: 'AE',
  231: 'GB',
  232: 'US',
  233: 'UM',
  234: 'UY',
  235: 'UZ',
  236: 'VU',
  237: 'VA',
  238: 'VE',
  239: 'VN',
  240: 'VG',
  241: 'VI',
  242: 'WF',
  243: 'EH',
  244: 'YE',
  245: 'ZM',
  246: 'ZW',
  247: 'XK',
  248: 'CW',
  249: 'SX',
};

class CSCPicker extends StatefulWidget {
  ///CSC Picker Constructor
  const CSCPicker({
    Key? key,
    this.onCountryChanged,
    this.onStateChanged,
    this.onCityChanged,
    this.selectedItemStyle,
    this.dropdownHeadingStyle,
    this.dropdownItemStyle,
    this.dropdownDecoration,
    this.disabledDropdownDecoration,
    this.searchBarRadius,
    this.dropdownDialogRadius,
    this.flagState = CountryFlag.ENABLE,
    this.layout = Layout.horizontal,
    this.showStates = true,
    this.showCities = true,
    this.defaultCountry,
    this.currentCountry,
    this.currentState,
    this.currentCity,
    this.disableCountry = false,
    this.countrySearchPlaceholder = "Search Country",
    this.stateSearchPlaceholder = "Search State",
    this.citySearchPlaceholder = "Search City",
    this.countryDropdownLabel = "Country",
    this.stateDropdownLabel = "State",
    this.cityDropdownLabel = "City",
    this.countryFilter,
    this.selectedItemPadding,
  }) : super(key: key);

  final ValueChanged<Country>? onCountryChanged;
  final ValueChanged<Region?>? onStateChanged;
  final ValueChanged<City?>? onCityChanged;

  final Country? currentCountry;
  final Region? currentState;
  final City? currentCity;

  final bool disableCountry;

  ///Parameters to change style of CSC Picker
  final TextStyle? selectedItemStyle, dropdownHeadingStyle, dropdownItemStyle;
  final BoxDecoration? dropdownDecoration, disabledDropdownDecoration;
  final bool showStates, showCities;
  final CountryFlag flagState;
  final Layout layout;
  final double? searchBarRadius;
  final double? dropdownDialogRadius;

  final CscCountry? defaultCountry;

  final String countrySearchPlaceholder;
  final String stateSearchPlaceholder;
  final String citySearchPlaceholder;

  final String countryDropdownLabel;
  final String stateDropdownLabel;
  final String cityDropdownLabel;

  final EdgeInsets? selectedItemPadding;

  final List<CscCountry>? countryFilter;

  @override
  CSCPickerState createState() => CSCPickerState();
}

class CSCPickerState extends State<CSCPicker> {
  final List<City> _cities = [];
  final List<Country> _country = [];
  final List<Region> _states = [];
  List<CscCountry> _countryFilter = [];

  City? _selectedCity;
  Country? _selectedCountry;
  Region? _selectedState;
  List? _responses;

  Future<List> responses() async {
    _responses ??= await getResponse() as List;

    return Future.value(_responses);
  }

  @override
  void initState() {
    super.initState();
    setDefaults();
    if (widget.countryFilter != null) {
      _countryFilter = widget.countryFilter!;
    }
    getCountries();
  }

  Future<void> setDefaults() async {
    if (widget.currentCountry != null) {
      setState(() => _selectedCountry = widget.currentCountry);
      await getStates();
    }

    if (widget.currentState != null) {
      setState(() => _selectedState = widget.currentState!);
      await getCities();
    }

    if (widget.currentCity != null) {
      setState(() => _selectedCity = widget.currentCity!);
    }
  }

  void _setDefaultCountry() {
    if (widget.defaultCountry != null) {
      print(_country[Countries[widget.defaultCountry]!]);
      _onSelectedCountry(_country[Countries[widget.defaultCountry]!]);
    }
  }

  ///Read JSON country data from assets
  Future<dynamic> getResponse() async {
    var res = await rootBundle.loadString('packages/csc_picker/lib/assets/country.json');
    return jsonDecode(res);
  }

  ///get countries from json response
  Future<List<Country?>> getCountries() async {
    _country.clear();
    var countries = await responses();
    if (_countryFilter.isNotEmpty) {
      for (var element in _countryFilter) {
        var result = countries[Countries[element]!];
        if (result != null) addCountryToList(result);
      }
    } else {
      for (var data in countries) {
        addCountryToList(data);
      }
    }
    _setDefaultCountry();
    return _country;
  }

  ///Add a country to country list
  void addCountryToList(data) {
    final model = Country.fromJson(data);

    if (!mounted) return;
    setState(() {
      _country.add(model);
    });
  }

  ///get states from json response
  Future<List<Region?>> getStates() async {
    _states.clear();
    var response = await responses();
    var takeState = response
        .map((map) => Country.fromJson(map))
        .where((item) => item.id == _selectedCountry?.id)
        .map((item) => item.state)
        .toList();

    var states = takeState as List;
    for (var f in states) {
      if (!mounted) continue;
      setState(() {
        for (var state in f) {
          _states.add(state);
        }
      });
    }
    _states.sort((a, b) => (a.name ?? "").compareTo(b.name ?? ""));
    return _states;
  }

  ///get cities from json response
  Future<List<City?>> getCities() async {
    _cities.clear();
    var response = await responses();
    var takeCity = response
        .map((map) => Country.fromJson(map))
        .where((item) => item.id == _selectedCountry?.id)
        .map((item) => item.state)
        .toList();
    final states = takeCity;
    for (final s in states) {
      final selectedStates = s?.where((item) => item.id == _selectedState?.id);
      final cities = selectedStates?.map((item) => item.city).toList();
      cities?.forEach((ci) {
        if (!mounted) return;
        setState(() {
          for (var city in ci ?? []) {
            _cities.add(city);
          }
        });
      });
    }
    _cities.sort((a, b) => (a.name ?? "").compareTo(b.name ?? ""));
    return _cities;
  }

  ///get methods to catch newly selected country state and city and populate state based on country, and city based on state
  void _onSelectedCountry(Country value) {
    if (!mounted) return;
    setState(() {
      widget.onCountryChanged!(value);

      //code added in if condition
      if (value != _selectedCountry) {
        _states.clear();
        _cities.clear();
        _selectedState = null;
        _selectedCity = null;
        widget.onStateChanged!(null);
        widget.onCityChanged!(null);
        _selectedCountry = value;
        getStates();
      } else {
        widget.onStateChanged!(_selectedState);
        widget.onCityChanged!(_selectedCity);
      }
    });
  }

  void _onSelectedState(Region value) {
    if (!mounted) return;
    setState(() {
      widget.onStateChanged!(value);
      //code added in if condition
      if (value.id != _selectedState?.id) {
        _cities.clear();
        _selectedCity = null;
        widget.onCityChanged!(null);
        _selectedState = value;
        getCities();
      } else {
        widget.onCityChanged!(_selectedCity);
      }
    });
  }

  void _onSelectedCity(City value) {
    if (!mounted) return;
    setState(() {
      //code added in if condition
      if (value.id != _selectedCity?.id) {
        _selectedCity = value;
        widget.onCityChanged!(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.layout == Layout.vertical
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  countryDropdown(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  widget.showStates ? stateDropdown() : const SizedBox.shrink(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  widget.showStates && widget.showCities ? cityDropdown() : const SizedBox.shrink()
                ],
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(child: countryDropdown()),
                      widget.showStates
                          ? const SizedBox(
                              width: 10.0,
                            )
                          : Container(),
                      widget.showStates ? Expanded(child: stateDropdown()) : const SizedBox.shrink(),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  widget.showStates && widget.showCities ? cityDropdown() : const SizedBox.shrink()
                ],
              ),
      ],
    );
  }

  ///filter Country Data according to user input
  Future<List<Country?>> getCountryData(filter) async {
    var filteredList =
        _country.where((country) => country.name?.toLowerCase().contains(filter.toLowerCase()) ?? false).toList();
    if (filteredList.isEmpty) {
      return _country;
    } else {
      return filteredList;
    }
  }

  ///filter Sate Data according to user input
  Future<List<Region?>> getStateData(filter) async {
    var filteredList =
        _states.where((state) => state.name?.toLowerCase().contains(filter.toLowerCase()) ?? false).toList();
    if (filteredList.isEmpty) {
      return _states;
    } else {
      return filteredList;
    }
  }

  ///filter City Data according to user input
  Future<List<City?>> getCityData(filter) async {
    var filteredList =
        _cities.where((city) => city.name?.toLowerCase().contains(filter.toLowerCase()) ?? false).toList();
    if (filteredList.isEmpty) {
      return _cities;
    } else {
      return filteredList;
    }
  }

  ///Country Dropdown Widget
  Widget countryDropdown() {
    return DropdownWithSearch<Country>(
      dialogSelectionItemText: (value) =>
          value?.displayName(
            widget.flagState == CountryFlag.SHOW_IN_DROP_DOWN_ONLY || widget.flagState == CountryFlag.ENABLE
                ? true
                : false,
          ) ??
          '',
      selectedText: (value) =>
          value?.displayName(
            widget.flagState == CountryFlag.SHOW_IN_DROP_DOWN_ONLY || widget.flagState == CountryFlag.DISABLE
                ? false
                : true,
          ) ??
          '',
      title: widget.countryDropdownLabel,
      placeHolder: widget.countrySearchPlaceholder,
      selectedItemStyle: widget.selectedItemStyle,
      dropdownHeadingStyle: widget.dropdownHeadingStyle,
      selectedItemPadding: widget.selectedItemPadding,
      itemStyle: widget.dropdownItemStyle,
      decoration: widget.dropdownDecoration,
      disabledDecoration: widget.disabledDropdownDecoration,
      disabled: _country.isEmpty || widget.disableCountry ? true : false,
      dialogRadius: widget.dropdownDialogRadius,
      searchBarRadius: widget.searchBarRadius,
      label: widget.countrySearchPlaceholder,
      items: _country.map((Country dropDownStringItem) {
        return dropDownStringItem;
      }).toList(),
      selected: _selectedCountry,
      onChanged: (value) {
        if (value != null) {
          _onSelectedCountry(value);
        }
      },
    );
  }

  ///State Dropdown Widget
  Widget stateDropdown() {
    return DropdownWithSearch<Region>(
      dialogSelectionItemText: (value) {
        return value?.name ?? "";
      },
      selectedText: (value) {
        return value?.name ?? "";
      },
      title: widget.stateDropdownLabel,
      placeHolder: widget.stateSearchPlaceholder,
      disabled: _states.isEmpty ? true : false,
      items: _states.map((Region dropDownStringItem) {
        return dropDownStringItem;
      }).toList(),
      selectedItemStyle: widget.selectedItemStyle,
      dropdownHeadingStyle: widget.dropdownHeadingStyle,
      itemStyle: widget.dropdownItemStyle,
      decoration: widget.dropdownDecoration,
      selectedItemPadding: widget.selectedItemPadding,
      dialogRadius: widget.dropdownDialogRadius,
      searchBarRadius: widget.searchBarRadius,
      disabledDecoration: widget.disabledDropdownDecoration,
      selected: _selectedState,
      label: widget.stateSearchPlaceholder,
      onChanged: (value) {
        if (value != null) {
          _onSelectedState(value);
        }
      },
    );
  }

  ///City Dropdown Widget
  Widget cityDropdown() {
    return DropdownWithSearch<City>(
      dialogSelectionItemText: (value) => value?.name ?? "",
      selectedText: (value) => value?.name ?? "",
      title: widget.cityDropdownLabel,
      placeHolder: widget.citySearchPlaceholder,
      disabled: _cities.isEmpty ? true : false,
      items: _cities.map((City dropDownStringItem) {
        return dropDownStringItem;
      }).toList(),
      selectedItemStyle: widget.selectedItemStyle,
      dropdownHeadingStyle: widget.dropdownHeadingStyle,
      itemStyle: widget.dropdownItemStyle,
      selectedItemPadding: widget.selectedItemPadding,
      decoration: widget.dropdownDecoration,
      dialogRadius: widget.dropdownDialogRadius,
      searchBarRadius: widget.searchBarRadius,
      disabledDecoration: widget.disabledDropdownDecoration,
      selected: _selectedCity,
      label: widget.citySearchPlaceholder,
      onChanged: (value) {
        if (value != null) {
          _onSelectedCity(value);
        }
      },
    );
  }
}
