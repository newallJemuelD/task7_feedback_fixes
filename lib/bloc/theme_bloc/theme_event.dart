abstract class ThemeEvent {}

class ThemeChangedEvent extends ThemeEvent {
  bool themeChange;

  ThemeChangedEvent(this.themeChange);
}
