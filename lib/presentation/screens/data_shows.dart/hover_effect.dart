import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:periodic_table/core/constants/app_colors.dart';
import 'package:periodic_table/data/models/element_data.dart';
import 'package:periodic_table/presentation/screens/bloc/hover_effect_bloc.dart';
import 'package:periodic_table/presentation/screens/data_shows.dart/element_card_design.dart';
import 'package:periodic_table/presentation/screens/data_shows.dart/dialog%20widgets.dart/show_element_dialog.dart';

class HoverEffect extends StatelessWidget {
  final ElementData elementData;
  const HoverEffect({super.key, required this.elementData});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HoverBloc, HoverState>(
      builder: (context, state) {
        final isHovered =
            state.hoveredItems[elementData.number.toString()] ?? false;

        return MouseRegion(
          onEnter: (_) => context.read<HoverBloc>().add(
            HoverEnterEvent(elementData.number.toString()),
          ),
          onExit: (_) => context.read<HoverBloc>().add(
            HoverExitEvent(elementData.number.toString()),
          ),
          child: InkWell(
            onTap: () {
             // debugPrint('Clicked on ${elementData.name}');
             showElementDialog(context, elementData);
            },
           // borderRadius: BorderRadius.circular(8),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              transform: Matrix4.translationValues(
                0,
                isHovered ? -4 : 0, // Lift effect on hover
                0,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isHovered ? Colors.blue : AppColors.customBrown,
                  width: 1,
                ),
                boxShadow: isHovered
                    ? [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ]
                    : [],
              ),
              child: ElementCard(elementData: elementData),
            ),
          ),
        );
      },
    );
  }
}
