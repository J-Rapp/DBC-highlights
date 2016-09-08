describe("Markdown Widget", function() {
  var widget;

  beforeEach(function() {
    widget = new MarkdownWidget();
  })

  describe("converting text", function(){

    it("can convert # to H1", function(){
      expect(widget.transform('#Hello')).toEqual('<h1>Hello</h1>');
    });

    it("can convert ## to H2", function(){
      expect(widget.transform('##Hello')).toEqual('<h2>Hello</h2>');
    });

    it("can convert _single underscore text_ to <em>", function(){
      expect(widget.transform('_Hello_')).toEqual('<em>Hello</em>');
    });

    it("can convert *single asterisk text* to <em>", function(){
      expect(widget.transform('*Hello*')).toEqual('<em>Hello</em>');
    });

    it("can convert __double underscore text__ to <bold>", function(){
      expect(widget.transform('__Hello__')).toEqual('<b>Hello</b>');
    });

    it("can convert **double asterisk text** to <bold>", function(){
      expect(widget.transform('**Hello**')).toEqual('<b>Hello</b>');
    });

    // it("can convert ~~strikethrough~~", function(){

    // })
  })
});
