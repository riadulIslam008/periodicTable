part of 'hover_effect_bloc.dart';

// sealed class HoverEffectState extends Equatable {
//   const HoverEffectState();
  
//   @override
//   List<Object> get props => [];
// }

// final class HideHoverEffectState extends HoverEffectState {
//   final bool hoverEffect;

//   const HideHoverEffectState({required this.hoverEffect});
// }
// final class ShowHoverEffectState extends HoverEffectState {
//   final bool hoverEffect;

//   const ShowHoverEffectState({required this.hoverEffect});
// }


// hover_state.dart

class HoverState extends Equatable {
  final Map<String, bool> hoveredItems;

  const HoverState({required this.hoveredItems});

  factory HoverState.initial() => const HoverState(hoveredItems: {});

  HoverState copyWith({Map<String, bool>? hoveredItems}) {
    return HoverState(
      hoveredItems: hoveredItems ?? this.hoveredItems,
    );
  }

  @override
  List<Object?> get props => [hoveredItems];
}
