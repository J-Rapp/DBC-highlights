var MarkdownWidget = function() {

  this.transform = function(input) {
    var response

    switch (input.charAt(0)) {
      case '#':
        if (input.charAt(1) === '#') {
          response = '<h2>' + input + '</h2>'
        } else {
          response = '<h1>' + input + '</h1>'
        }
        break;
      case '*':
        if (input.charAt(input.length - 1) === '*') {
          if (input.charAt(1) === '*') {
            if (input.charAt(input.length - 2) === '*') {
              response = '<b>' + input + '</b>'
            } else {
              response = '<p>' + input + '</p>'
            }
          } else {
            response = '<em>' + input + '</em>'
          }
        } else {
          response = '<p>' + input + '</p>'
        }
        break;
      case '_':
        if (input.charAt(input.length - 1) === '_') {
          if (input.charAt(1) === '_') {
            if (input.charAt(input.length - 2) === '_') {
              response = '<b>' + input + '</b>'
            } else {
              response = '<p>' + input + '</p>'
            }
          } else {
            response = '<em>' + input + '</em>'
          }
        } else {
          response = '<p>' + input + '</p>'
        }
        break;
      default:
        response = '<p>' + input + '</p>'
    }

    return response
  }

}
