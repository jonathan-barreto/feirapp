class MainState {
  final int indexSelected;

  MainState({
    required this.indexSelected,
  });

  factory MainState.initial({required int index}) {
    return MainState(
      indexSelected: index,
    );
  }

  factory MainState.selectIndex({required int index}) {
    return MainState(
      indexSelected: index,
    );
  }

  MainState copyWith({int? index}) {
    return MainState(
      indexSelected: index ?? indexSelected,
    );
  }
}
