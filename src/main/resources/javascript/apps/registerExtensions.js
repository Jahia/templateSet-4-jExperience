window.jahia.i18n.loadNamespaces('templateSet-4-jExperience');

window.jahia.uiExtender.registry.add('callback', 'templateSet-4-jExperience', {
    targets: ['jahiaApp-init:30'],
    callback: function () {

        const contentPicker = window.jahia.uiExtender.registry.get('selectorType', 'ContentPicker');
        const personalizedContentNodePickerCmp={
            picker: contentPicker,
            treeConfigs : [{
                rootPath: site => `/sites/${site}/contents`,
                openableTypes: ['jnt:contentFolder'],
                selectableTypes: ['jnt:contentFolder'],
                type: 'contents',
                rootLabelKey: 'content-editor:label.contentEditor.edit.fields.contentPicker.contentsRootLabel'
            }],
            searchSelectorType: 'wemnt:personalizedContent',
            listTypesTable: ['wemnt:personalizedContent'],
            selectableTypesTable: ['wemnt:personalizedContent']
        }

        console.debug('personalizedContentNodePickerCmp', personalizedContentNodePickerCmp);
        console.debug('%c personalizedContent pickerConfiguration Extensions  is activated', 'color: #3c8cba');
        window.jahia.uiExtender.registry.add('pickerConfiguration', 'personalizedContent', {
            cmp: personalizedContentNodePickerCmp
        });
    }
});
