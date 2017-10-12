## Open Source > ToastUI Grid > Getting Started

# Getting Started

## Downloading Files

The recommended way to download the **Toast-UI Grid** as a package is through the [bower](http://bower.io), which is a package manager for the front-end. If you've installed the *bower*, run this command in the directory of your project.

```
bower install tui-grid
```

This downloads all necessary files for the **Toast-UI Grid**, including all dependencies.

You can also download these files manually at the [dist directory](https://github.com/nhnent/tui.grid/tree/master/dist) or [releases page](https://github.com/nhnent/tui.grid/releases). But you have to download all dependencies below manually as well.

- jquery ~1.8.3
- jquery-json ~2.5.1
- underscore >= 1.5.0
- backbone ~1.1.2
- tui-code-snippet ~1.0.2
- *tui-component (optional)*
    - *tui-component-pagination ~1.0.0*
    - *tui-component-datepicker ~1.3.0*
    - *tui-component-calendar ~1.1.1*

## Including Files

Now you can include the script files to your html page. If you download files through the **bower**, they will be in the **bower_components** directory.

```html
<script src="bower_components/jquery/jquery.js"></script>
<script src="bower_components/jquery-json/dist/jquery.json.min.js"></script>
<script src="bower_components/underscore/underscore.js"></script>
<script src="bower_components/backbone/backbone.js"></script>
<script src="bower_components/tui-code-snippet/code-snippet.js"></script>
<script src="bower_components/tui-grid/dist/grid.js"></script>
```

You need to include the CSS file as well.

```html
<link rel="stylesheet" type="text/css" href="bower_components/tui-grid/dist/grid.css" />
```

There is one more thing to do. The Toast-UI Grid uses two images to display a loading-indicator and icons, **ani_loading.gif** and **icons.gif** respectively. In the CSS file, paths of these images are specified with the relative path **../images/**. If you place the images in the different paths, you should find and replace all paths of the images in the CSS file to the correct paths.

## Creating an Instance

To use the **Toast-UI Grid** in your page, you should create an instance of **tui.Grid** like example below.

```javascript
var grid = new tui.Grid({
    el: $('#wrapper'), // only required. other options are optional
    selectType: 'checkbox',
    displayRowCount: 5,
    headerHeight: 50,
    rowHeight: 35,
    toolbar: null
});
```

The **tui.Grid** class receives an option object as a parameter, in which only **el** field is required. The value of **el** should be a jQuery object of the HTML element you want to use as a wrapper. As this does not create an HTML element automatically, the wrapper element must exist in advance when creating the instance.

Another options like **selectType**, **displayRowCount** are optional, and you can find more options in detail at the [API page](https://nhnent.github.io/tui.grid/api).

## Defining Column Models

Before you add data to the Grid, you need to define column models which specify the schema of data. You can use **setColumnModelList()** method to define them, like an example below.

```javascript
grid.setColumnModelList([
    {
        title: 'ID',
        columnName: 'id'
    },
    {
        title: 'CITY',
        columnName: 'city',
        editOption: {
            type: 'text'    
        }    
    },
    {
        title: 'COUNTRY',
        columnName: 'country',
        editOption: {
            type: 'text'    
        }
    }
]);
```

The **setColumnModelList()** method receives an array as a parameter, in which each element specifies a column definition.
The **columnName** property is only required, and it's used as a key of row data. The string value defined as the **title** property is shown in the column header. It's optional, but it would be better to set it because the column header will be empty without this value.

You can specify the input type of the column using the **editOption.type** property. If not specified, the type will be a **normal**, which is plain text that is not editable. The **text** type uses an **input[type=text]** element to present the value of the cell. More types like **select**, **checkbox** can be used as an **editOption.type**. In addition, there are other options which can be used as a property of the **editOption**. You can find the details about the **editOption** at the [API page](https://nhnent.github.io/tui.grid/api).

You can also define the column models with a **columnModelList** option when creating a **tui.Grid** instance.

```javascript
var grid = new tui.Grid({
    el: $('#wrapper'),
    columnModelList: [
        // ... same array as above example
    ],
    // another options ...
});
```

## Setting data

Finally, you can set your data to the Grid using the **setRowList()** method.

```javascript
grid.setRowList([
    {
        id: '10012',
        city: 'Seoul',
        country: 'South Korea'
    },
    {
        id: '10013',
        city: 'Tokyo',
        country: 'Japan'    
    },
    {
        id: '10014',
        city: 'London',
        country: 'England'
    },
    {
        id: '10015',
        city: 'Ljubljana',
        country: 'Slovenia'
    },
    {
        id: '10016',
        city: 'Reykjavik',
        country: 'Iceland'
    }
]);
```

The **setRowList()** method receives an array as a parameter, in which each element specifies a row data. The data is just a plain object. You can see that the properties of each row data matches the **columnName** properties of the column models, that is specified above.

Then you can see the table of your data on your screen.

![First grid example](http://static.toastoven.net/prod_toastuigrid/getting-started.png)
