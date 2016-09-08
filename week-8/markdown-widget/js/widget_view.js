var WidgetView = function(widget, inputContainer, previewContainer) {

  this.render = function() {
    $(inputContainer).on('keyup', function() {
      var text = $(inputContainer).first().val();
      var response = widget.transform(text);
      $(previewContainer).html(response);
    })
  }

}
