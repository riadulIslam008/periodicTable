import 'package:flutter/material.dart';
import 'package:periodic_table/core/constants/app_colors.dart';
import 'package:periodic_table/data/models/element_data.dart';
import 'package:periodic_table/presentation/screens/data_shows.dart/hover_effect.dart';
import 'package:periodic_table/presentation/screens/data_shows.dart/linear_text.dart';

/// A widget that builds a Periodic Table layout from a list of [ElementData]
class PeriodicTableDesign extends StatelessWidget {
  final List<ElementData> periodicTableElements;

  PeriodicTableDesign({super.key, required this.periodicTableElements});

  // List to hold indexes of all f-block elements (lanthanides & actinides)
  final List<int> fBlockElementsList = [];

  @override
  Widget build(BuildContext context) {
    int elementIndex = 0; // Tracks main element list index
    int fBlockIndex = 0; // Tracks index while placing f-block elements

    return SingleChildScrollView(
      child: Column(
        children: [
          LinearText(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.custom(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              // Defines a fixed 18-column grid layout (standard periodic table width)
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 18,
                childAspectRatio: 1 / 1.1,
              ),
      
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) {
                  // Prevent rendering cells beyond a max index (6 rows × 18 columns = 108, reserving up to 180)
                  if (index >= 180) return const SizedBox.shrink();
      
                  //When Periodic Table Element(element Index) reaches hightest Index(119),
                  // it should come back the "F Block elemet" that is stored in "fBlockElementsList"
                  if (elementIndex >= periodicTableElements.length) {
                    elementIndex = fBlockElementsList[fBlockIndex];
                  }
      
                  // Get current element from list
                  ElementData element = periodicTableElements[elementIndex];
      
                  // Calculate the current grid position (x = group, y = period)
                  final int xAxis = (index % 18) + 1;
                  final int yAxis = (index ~/ 18) + 1;
      
                  /// ==== Handle f-block elements (lanthanides/actinides) ====
                  if (element.block == "f" && fBlockElementsList.length != 28) {
                    // Store all f-block element indexes in a separate list
                    while (periodicTableElements[elementIndex].block == "f") {
                      fBlockElementsList.add(
                        periodicTableElements[elementIndex].number - 1,
                      );
                      elementIndex++;
                    }
      
                    // Skip rendering here (f-block is shown later)
                    elementIndex++;
                    return _buildPlaceholderBox();
                  }
      
                  /// ==== Match element position in the grid ====
                  if (elementIndex < periodicTableElements.length &&
                      element.xpos == xAxis &&
                      element.ypos == yAxis) {
                    // If it's an f-block element rendered in separate section
                    // From 2nd if block, F Block element assigned in "elementIndex"
                    //Now It should pass the next Index to elementIndex and continue this process.
                    if (element.block == "f") {
                      fBlockIndex++;
                      if (fBlockIndex < fBlockElementsList.length) {
                        elementIndex = fBlockElementsList[fBlockIndex];
                      }
                    } else {
                      // Proceed to next element
                      elementIndex++;
                    }
                    // Display element as a card
                    return HoverEffect(elementData: element);
                  }
      
                  /// ==== Empty cell ====
                  // Empty slot (used to space out the periodic table correctly)
                  return _buildPlaceholderBox();
                },
                childCount: 180, // Grid dimensions: 10 rows × 18 columns
              ),
            ),
          ),
      
          // Linear gradient title "Periodic Table"
          // Positioned(top: 10, left: 20, right: 20, child: const LinearText()),
        ],
      ),
    );
  }

  /// Creates an invisible placeholder for empty grid cells
  Widget _buildPlaceholderBox() {
    return Container(color: AppColors.transparentColor);
  }
}
