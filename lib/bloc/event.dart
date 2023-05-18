abstract class SpeedOMeterEvent {}

class ClickEvent extends SpeedOMeterEvent {
  dynamic eventValue;

  ClickEvent(this.eventValue);
}

class ThemeChangeEvent extends SpeedOMeterEvent {
  bool themeChange;

  ThemeChangeEvent(this.themeChange);
}
