import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'hover_effect_event.dart';
part 'hover_effect_state.dart';

// class HoverEffectBloc extends Bloc<HoverEffectEvent, HoverEffectState> {
//   HoverEffectBloc() : super(HideHoverEffectState(hoverEffect: false)) {
//     on<HideHoverEffectEvent>(
//       (event, emit) => emit(HideHoverEffectState(hoverEffect: false)),
//     );
//     on<ShowHoverEffectEvent>(
//       (event, emit) => emit(HideHoverEffectState(hoverEffect: true)),
//     );
//   }
// }


// hover_bloc.dart
class HoverBloc extends Bloc<HoverEvent, HoverState> {
  HoverBloc() : super(HoverState.initial()) {
    on<HoverEnterEvent>((event, emit) {
      final updated = Map<String, bool>.from(state.hoveredItems);
      updated[event.elementId] = true;
      emit(state.copyWith(hoveredItems: updated));
    });

    on<HoverExitEvent>((event, emit) {
      final updated = Map<String, bool>.from(state.hoveredItems);
      updated[event.elementId] = false;
      emit(state.copyWith(hoveredItems: updated));
    });
  }
}
