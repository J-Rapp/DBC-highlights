var markdownWidget = new MarkdownWidget();
var widgetView = new WidgetView(markdownWidget, '#text-input', '#preview-text');

$(document).ready(function() {
  widgetView.render();
});
