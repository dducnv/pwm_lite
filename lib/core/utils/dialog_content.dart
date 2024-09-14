class DialogContent {
  final String title;
  final String content;
  final List<String> buttons;
  final List<Function> buttonActions;

  DialogContent(
      {this.title = "",
      this.content = "",
      this.buttons = const [],
      this.buttonActions = const []});
}
