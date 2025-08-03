import 'package:flutter/widgets.dart';
import 'package:periodic_table/data/models/element_data.dart';
import 'package:periodic_table/presentation/screens/data_shows.dart/design.dart';

class LandScapeMode extends StatelessWidget {
  final List<ElementData> periodicTableElements;
  const LandScapeMode({super.key, required this.periodicTableElements});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Check if screen is too narrow
    final bool forceLandscape = screenWidth < 500;
    return forceLandscape
        ? RotatedBox(
            quarterTurns: 1,
            child: PeriodicTableDesign(
              periodicTableElements: periodicTableElements,
            ),
          )
        : PeriodicTableDesign(periodicTableElements: periodicTableElements);
  }
}
