part of 'hover_effect_bloc.dart';

// sealed class HoverEffectEvent extends Equatable {
//   const HoverEffectEvent();

//   @override
//   List<Object> get props => [];
// }

// class ShowHoverEffectEvent extends HoverEffectEvent{}
// class HideHoverEffectEvent extends HoverEffectEvent{}


// hover_event.dart

abstract class HoverEvent extends Equatable {
  const HoverEvent();
  @override
  List<Object?> get props => [];
}

class HoverEnterEvent extends HoverEvent {
  final String elementId; // Use element number or unique id
  const HoverEnterEvent(this.elementId);
  @override
  List<Object?> get props => [elementId];
}

class HoverExitEvent extends HoverEvent {
  final String elementId;
  const HoverExitEvent(this.elementId);
  @override
  List<Object?> get props => [elementId];
}
