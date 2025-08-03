import 'package:periodic_table/data/models/periodic_table_model.dart';

class ElementData {
  final int number;
  final String name;
  final String symbol;
  final String? appearance;
  final double? atomicMass;
  final double? boil;
  final String category;
  final String? color;
  final double? density;
  final String? discoveredBy;
  final double? melt;
  final double? molarHeat;
  final String? namedBy;
  final int period;
  final String? phase;
  final String source;
  final String? spectralImg;
  final String summary;
  final int group;
  final int xpos;
  final int ypos;
  final List<int>? shells;
  final String? electronConfiguration;
  final String? electronConfigurationSemantic;
  final double? electronAffinity;
  final double? electronegativityPauling;
  final List<int>? ionizationEnergies;
  final String? cpkHex;
  final String? block;
  final ElementImage? image;
  final String? bohrModelImage;

  ElementData({
    required this.number,
    required this.name,
    required this.symbol,
    this.appearance,
    this.atomicMass,
    this.boil,
    required this.category,
    this.color,
    this.density,
    this.discoveredBy,
    this.melt,
    this.molarHeat,
    this.namedBy,
    this.bohrModelImage,
    required this.period,
    this.phase,
    required this.source,
    this.spectralImg,
    required this.summary,
    required this.group,
    required this.xpos,
    required this.ypos,
    this.shells,
    this.electronConfiguration,
    this.electronConfigurationSemantic,
    this.electronAffinity,
    this.electronegativityPauling,
    this.ionizationEnergies,
    this.cpkHex,
    this.block,
    this.image,
  });

  factory ElementData.fromJson(Map<String, dynamic> json) {
    return ElementData(
      number: (json['number'] as num).toInt(),
      name: json['name'],
      symbol: json['symbol'],
      appearance: json['appearance'],
      bohrModelImage: json['bohr_model_image'] as String?,
      atomicMass: (json['atomic_mass'] as num?)?.toDouble(),
      boil: (json['boil'] as num?)?.toDouble(),
      category: json['category'],
      color: json['color'],
      density: (json['density'] as num?)?.toDouble(),
      discoveredBy: json['discovered_by'],
      melt: (json['melt'] as num?)?.toDouble(),
      molarHeat: (json['molar_heat'] as num?)?.toDouble(),
      namedBy: json['named_by'],
      period: (json['period'] as num).toInt(),
      phase: json['phase'],
      source: json['source'],
      spectralImg: json['spectral_img'],
      summary: json['summary'],
      group: (json['group'] as num).toInt(),
      xpos: (json['xpos'] as num).toInt(),
      ypos: (json['ypos'] as num).toInt(),
      shells: json['shells'] != null ? List<int>.from(json['shells']) : null,
      electronConfiguration: json['electron_configuration'],
      electronConfigurationSemantic: json['electron_configuration_semantic'],
      electronAffinity: (json['electron_affinity'] as num?)?.toDouble(),
      electronegativityPauling: (json['electronegativity_pauling'] as num?)
          ?.toDouble(),
      ionizationEnergies: json['ionization_energies'] != null
          ? List<num>.from(
              json['ionization_energies'],
            ).map((e) => e.toInt()).toList()
          : null,
      cpkHex: json['cpk-hex'],
      block: json['block'],
      image: json['image'] != null
          ? ElementImage.fromJson(json['image'])
          : null,
    );
  }
}
