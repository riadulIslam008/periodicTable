import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:periodic_table/core/constants/app_colors.dart';
import 'package:periodic_table/core/constants/element_style.dart';
import 'package:periodic_table/data/models/element_data.dart';

/// ElementCard: Widget to display a single element in the periodic table
class ElementCard extends StatelessWidget {
  final ElementData elementData;

  const ElementCard({super.key, required this.elementData});

  @override
  Widget build(BuildContext context) {
    // Get background and text colors based on the element category
    final style = getElementStyle(elementData.category);
    bool smallerScreen = MediaQuery.of(context).size.width < 650;
    bool mediumScreen = MediaQuery.of(context).size.width < 1000;

    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(top: 1, right: 1),
      color: const Color.fromARGB(255, 57, 28, 18), // Outer card color
      shape: RoundedRectangleBorder(
        borderRadius: smallerScreen
            ? BorderRadius.zero
            : BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(2),
              ),
      ),
      child: Container(
        color: style.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTopRow(
              style,
              mediumScreen,
              // smallerScreen,
            ), // 🔹 Element Number + Mass
            _buildSymbol(
              style,
              context,
              smallerScreen,
              mediumScreen,
            ), // 🔹 Element Symbol (centered)
            // smallerScreen
            // ? SizedBox.shrink() :
            _buildElectronConfig(
              style,
              mediumScreen,
            ), // 🔹 Electron Configuration
            _buildBottomInfo(
              smallerScreen,
              mediumScreen,
            ), // 🔹 Name + Phase + Divider
          ],
        ),
      ),
    );
  }

  // 🔸 _buildTopRow: Atomic number and atomic mass
  Widget _buildTopRow(ElementStyle style, bool mediumScreen) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${elementData.number}',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: style.subTextColor,
              fontSize: mediumScreen ? 5 : 7,
            ),
          ),
          mediumScreen
              ? SizedBox.shrink()
              : Text(
                  elementData.atomicMass!.toStringAsFixed(2),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: style.subTextColor, fontSize: 5),
                ),
        ],
      ),
    );
  }

  // 🔸 _buildSymbol: Element symbol (large and centered)
  Widget _buildSymbol(
    ElementStyle style,
    BuildContext context,
    bool smallerScreen,
    bool mediumScreen,
  ) {
    return Text(
      elementData.symbol,
      style: TextStyle(
        color: style.textColor,
        fontSize: mediumScreen ? 8 : 12.0,
        fontWeight: mediumScreen ? FontWeight.normal : FontWeight.bold,
      ),
    );
  }

  // 🔸 _buildElectronConfig: Electron configuration string
  Widget _buildElectronConfig(ElementStyle style, bool mediumScreen) {
    return mediumScreen
        ? SizedBox.shrink()
        : Text(
            elementData.electronConfigurationSemantic ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: style.subTextColor, fontSize: 5),
          );
  }

  // 🔸 _buildBottomInfo: Displays element name, a dotted line, and the physical phase
  Widget _buildBottomInfo(bool smallerScreen, bool mediumScreen) {
    return smallerScreen
        ? SizedBox.shrink()
        : Container(
            alignment: Alignment.center,
            color: AppColors.customWhite,
            child: Column(
              children: [
                Text(
                  elementData.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.customBlack,
                    fontSize: mediumScreen ? 6 : 8,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // smallerScreen
                //     ? SizedBox.shrink():
                mediumScreen
                    ? SizedBox.shrink()
                    : DottedLine(
                        lineThickness: 1,
                        dashColor: Colors.grey,
                        dashGapLength: 0.5,
                      ),
                // smallerScreen
                //     ? SizedBox.shrink() :
                mediumScreen
                    ? SizedBox.shrink()
                    : Text(
                        elementData.phase ?? '',
                        style: TextStyle(
                          color: AppColors.customBlack,
                          fontSize: 5,
                        ),
                      ),
              ],
            ),
          );
  }
}
