// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:periodic_table/core/constants/app_colors.dart';
import 'package:periodic_table/data/models/element_data.dart';
import 'package:periodic_table/presentation/screens/data_shows.dart/dialog%20widgets.dart/heading_widget.dart';
import 'package:periodic_table/presentation/screens/data_shows.dart/dialog%20widgets.dart/image_section.dart';
import 'package:periodic_table/presentation/screens/data_shows.dart/dialog%20widgets.dart/properties.dart';
import 'package:periodic_table/presentation/screens/data_shows.dart/dialog%20widgets.dart/row_details.dart';

/// Show a dialog with close icon
void showElementDialog(BuildContext context, ElementData element) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent tap outside to close
    builder: (context) {
      final screenWidth = MediaQuery.of(context).size.width;

      // Check if screen is too narrow
      final bool forceLandscape = screenWidth < 500;
      return Dialog(
        backgroundColor: AppColors.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: forceLandscape
            ? RotatedBox(quarterTurns: 1, child: DialogBody(element: element))
            : DialogBody(element: element),
      );
    },
  );
}

class DialogBody extends StatelessWidget {
  final ElementData element;
  const DialogBody({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    Map<String, String> elementdetails1 = <String, String>{
      "Atomic Number": element.number.toString(),
      "Group": element.group.toString(),
      "Period": element.period.toString(),
      "Block": element.block!,
      "Electron Configration": element.electronConfigurationSemantic.toString(),
      "Shells": element.shells!.length.toString(),
    };

    Map<String, String> elementdetails2 = <String, String>{
      "PHASE: ": element.phase!,
      "MELTING POINT: ": element.melt.toString(),
      "BOLING POINT: ": element.boil.toString(),
      "DENSITY: ": element.density.toString(),
      "LIQUID DENSITY: ": element.density.toString(),
    };
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Header
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.customBrown,
                  border: Border(
                    bottom: BorderSide(color: AppColors.customBlack),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 30,
                          color: AppColors.customWhite,
                        ),
                        children: [
                          WidgetSpan(
                            child: Transform.translate(
                              offset: Offset(0, -20),
                              child: Text(
                                element.number.toString(),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: AppColors.customWhite,
                                ),
                              ),
                            ),
                          ),
                          TextSpan(
                            text: element.symbol,
                            style: TextStyle(color: AppColors.customWhite),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      element.name,
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.customWhite,
                      ),
                    ),
                  ],
                ),
              ),
              //// Body Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      spacing: 20,
                      children: [
                        ImageSection(
                          imageUrl: element.image!.url,
                          imageTitle: element.image!.title,
                        ),
                        ImageSection(
                          imageUrl: element.bohrModelImage!,
                          imageTitle: "Bohr Model",
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      spacing: 10,
                      children: [
                        SizedBox(height: 10),
                        HeadingWidget(heading: "General Properties"),
                        Wrap(
                          spacing: 8,
                          children: elementdetails1.entries
                              .map(
                                (data) => Properties(
                                  title: data.key,
                                  properties: data.value,
                                ),
                              )
                              .toList(),
                        ),
                        Column(
                          spacing: 10,
                          children: [
                            DetailsRow(
                              name: "Appearance: ",
                              value: element.appearance ?? "",
                            ),
                            DetailsRow(
                              name: "Named By: ",
                              value: element.namedBy ?? "Unknown",
                            ),
                            DetailsRow(
                              name: "Discovered By: ",
                              value: element.discoveredBy ?? "Unknown",
                            ),
                            DetailsRow(
                              name: "Catgory: ",
                              value: element.category,
                            ),
                          ],
                        ),
                        HeadingWidget(heading: "Physical Properties"),
                        Column(
                          spacing: 5,
                          children: elementdetails2.entries
                              .map(
                                (data) => DetailsRow(
                                  name: data.key,
                                  value: data.value,
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Close Button (Top Right)
        Positioned(
          right: 8,
          top: 8,
          child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.close, size: 24),
          ),
        ),
      ],
    );
  }
}
