## Open Source > ToastUI Editor > Getting Started

You should load all JavaScript dependencies and CSS files in order to use TUI Editor.

javascript files

- jquery/dist/jquery.js
- tui-code-snippet/code-snippet.js
- marked/lib/marked.js
- toMark/dist/toMark.js
- codemirror/lib/codemirror.js
- highlightjs/highlight.pack.js
- squire-rte/build/squire.js
- tui-editor/dist/tui-editor.min.js

css files

- codemirror/lib/codemirror.css
- highlightjs/styles/github.css
- tui-editor/dist/tui-editor.css
- tui-editor/dist/tui-editor-contents.css

_tui-editor.contents.css_ defines content's displaying style that in WYSIWYG Editor and Markdown Preview.
You can customize editor content's displaying style through modifying _tui-editor.contents.css_ file.

``` html
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>DEMO</title>
    <script src="bower_components/jquery/dist/jquery.js"></script>
    <script src="bower_components/tui-code-snippet/code-snippet.js"></script>
    <script src="bower_components/marked/lib/marked.js"></script>
    <script src="bower_components/toMark/dist/toMark.js"></script>
    <script src="bower_components/codemirror/lib/codemirror.js"></script>
    <script src="bower_components/highlightjs/highlight.pack.js"></script>
    <script src="bower_components/Squire/build/squire-raw.js"></script>
    <script src="bower_components/tui-editor/dist/tui-editor.min.js"></script>
    <link rel="stylesheet" href="bower_components/codemirror/lib/codemirror.css">
    <link rel="stylesheet" href="bower_components/highlightjs/styles/github.css">
    <link rel="stylesheet" href="bower_components/tui-editor/dist/tui-editor.css">
    <link rel="stylesheet" href="bower_components/tui-editor/dist/tui-editor-contents.css">
</head>
<body>
<div id="editSection"></div>
<script>
    $('#editSection').tuiEditor({
        initialEditType: 'markdown',
        previewStyle: 'vertical',
        height: 300
    });
</script>
</body>
</html>
```

Create TUI Editor instance with jQuery plugin style way or call tui.Editor.factory() method in our _tui.Editor_ namespace.

``` javascript
var editor = tui.Editor.factory({
    el: $('#editSection'),
    initialEditType: 'markdown',
    previewStyle: 'vertical',
    height: 300
});
```

## Options

* viewOnly: {boolean}
    * When passed parameter is true, create editor with view-only mode. And then Editor renders markdown content to HTML.
* initialEditType: 'markdown' || 'wysiwyg'
    * Initialize and show editor with editing mode that given option.
* previewStyle: 'tab' || 'vertical'
    * In markdown case, define preview pane displaying style that given option.
* height: {number} || 'auto'
    * Set fixed height of content area with number type parameter.
    * Parameter 'auto' means expand editor's height content relatively.
* events: {object}
    * Bind event listener to editor's internal event.
    * You can checkout _Event_ part for details.
* exts: [string]
    * Define your extensions with string array.
    * built-in extensions
        * scrollFollow: In Markdown Editor, For use preview pane's scroll following related to current editing position.
        * colorSyntax: For use syntax coloring.
* hooks: {object}
    * Register hook functions for bind Editor and your service.
    * addImageBlobHook : Upload image file to server with file blob. (Base64 encoded)

## Upload image to image server
You can use _addImageBlobHook_ with file blob for upload image file to image server.
Checkout some detail for image server for 'Handling the upload process for a file' part [Here](https://developer.mozilla.org/en/docs/Using_files_from_web_applications)


``` javascript
    hooks: {
        'addImageBlobHook': function(blob, callback) {
            //run callback
            //callback('Image URL');
        }
    }
```

## API

``` javascript
editor.setValue('# Hello');
editor.on('focus', handler);
editor.off('focus');

//Using jQuery plugin interface
$('#editSection').tuiEditor('setValue', '# Hello');
$('#editSection').tuiEditor('on', 'focus');
$('#editSection').tuiEditor('off', 'focus');
```

* focus: set focus into Editor
* hide: hide Editor from document
* show: show Editor on document
* getValue: get Markdown contents to Editor
* setValue: set Markdown contnets to Editor
* changeMode: change Editor type WYSIWYG or Makrdown ("wysiwyg", "markdown")
* contentHeight: set or get Editor's contents area height through with or without parameter
* moveCursorToEnd: move cursor at end of Editor's content
* moveCursorToStart: move cursor at start of Editor's content
* on: bind event handler function to Editor's internal Events
    * You can bind event handlers like jQuery.on() way, so you can remove particular event handler. (ex. change.dooray)
* off : remove event handler with namespace
    * editor.off("change"): remove the "change" event's handlers
    * editor.off("change.dooray"): remove the "change" event's handlers which has namespace "dooray"
    * editor.off(".dooray"): remove the event handler which has namespace ".dooray"
* remove: remove Editor from document

## Events

* change: invoke when Editor's content changes
* changeMode: invoke when Editor mode change
* stateChange: invoke when cursor position changes across state (bold, italic, code, codeBlock, text)
* keyMap: invoke when Editor's key combination pressed (expected Data be like 'SHIFT+CTRL+A')
* removeEditor: invoke when Editor's remove() method called
* click
* keydown, keyup
* focus
* blur
* show
* hide

## Applying custom renderer

You can extend _tui.Editor.markedRenderer_ to get your own Markdown to HTML renderer rather use _marked_.

``` javascript

tui.Editor.markedRenderer.table = function() {
    // your codes here
}

```
