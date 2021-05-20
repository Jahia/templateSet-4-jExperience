CKEDITOR.editorConfig = function (config) {
    config.allowedContent = true;

    config.contextPath = (typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '';
    config.language = (typeof contextJsParameters != 'undefined') ? contextJsParameters.uilang : 'en';
    config.contentlanguage = (typeof contextJsParameters != 'undefined') ? contextJsParameters.lang : 'en';
    config.siteUuid = (typeof contextJsParameters != 'undefined') ? contextJsParameters.siteUuid : '';

    config.filebrowserWindowFeatures = 'location=no,menubar=no,toolbar=no,dependent=yes,minimizable=no,modal=yes,alwaysRaised=yes,resizable=yes,scrollbars=yes';
    config.filebrowserWindowName = 'JahiaFileBrowser';
    config.filebrowserBrowseUrl = config.contextPath + '/engines/contentpicker.jsp?site=' + config.siteUuid + '&lang=' + config.contentlanguage + '&uilang=' + config.language;
    config.filebrowserImageBrowseUrl = config.contextPath + '/engines/contentpicker.jsp?type=imagepicker&site=' + config.siteUuid + '&lang=' + config.contentlanguage + '&uilang=' + config.language;
    config.filebrowserFlashBrowseUrl = config.contextPath + '/engines/contentpicker.jsp?mime=application%2Fx-shockwave-flash%2Cvideo%2Fx-flv&site=' + config.siteUuid + '&lang=' + config.contentlanguage + '&uilang=' + config.language;
    config.filebrowserLinkBrowseUrl = config.contextPath + '/engines/contentpicker.jsp?type=editoriallinkpicker&site=' + config.siteUuid + '&lang=' + config.contentlanguage + '&uilang=' + config.language;
    config.image_previewText = '';

    config.format_tags = 'h1;h2;h3;h4;h5;h6;p;pre;code';
    config.format_code = {
        name: 'code',
        element: 'code',
        attributes: { class: 'editorCode' },
    };

    // config.templates = 'templateSet-4-jExperience,default';
    // config.stylesSet = 'B4:'+((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/modules/templateSet-4-jExperience/javascript/ckeditor/stylesSet.js';
    config.contentsCss = [
        // ((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/modules/bootstrap4-core/css/bootstrap.min.css',
        ((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/modules/templateSet-4-jExperience/css/style.min.css'
    ];
    // config.templates_files = [
    //     ((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/modules/templateSet-4-jExperience/javascript/ckeditor/templates.js',
    //     // ((typeof contextJsParameters != 'undefined') ? contextJsParameters.contextPath : '') + '/modules/bootstrap4-components/javascript/cktemplates.js'
    // ];

//'Templates','Styles'
    config.toolbar_Tinny = [
        ['Source','Format', '-', 'PasteText', 'wsc','Scayt', 'ACheck', 'SpellChecker'],
        ['Bold','Italic'],
        ['NumberedList', 'BulletedList', 'Outdent','Indent', 'Blockquote'],
        ['JustifyLeft','JustifyCenter','JustifyRight'],
        ['Link', 'Unlink','Anchor','Image'],
        ['RemoveFormat','HorizontalRule','ShowBlocks']
    ];


    config.extraPlugins = 'acheck,wsc,scayt,macrosdropdown';
    config.templates_replaceContent = false;

    // [ Left, Center, Right, Justified ]
    // config.justifyClasses = [ 'text-left', 'text-center', 'text-right', 'text-justify' ];
};

CKEDITOR.addCss(
    '.cke_combopanel { width:300px !important;}'
)

CKEDITOR.dtd.$removeEmpty['i'] = 0;
CKEDITOR.dtd.$removeEmpty['span'] = 0;
CKEDITOR.dtd.$removeEmpty['div'] = 0;
CKEDITOR.dtd.$removeEmpty['em'] = 0;

CKEDITOR.on('instanceReady', function() {
    $(".cke_combo_inlinelabel").text("Inline styles");
});