using {NetworthService} from './networthService';

annotate NetworthService.Networth with @odata.draft.enabled;
annotate NetworthService.Networth with @fiori.draft.enabled;



//Networth Labels
annotate NetworthService.Networth with {
    year    @title: '{i18n>year}';
}

//Selection Fields
annotate NetworthService.Networth with @(UI.SelectionFields: [
    year
]);

//Line Item
annotate NetworthService.Networth with @(UI.LineItem: [
    {Value: year}
]);


// ObjectPage
annotate NetworthService.Networth with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>generalInfo}',
            ID : 'generalInfo',
            Target : '@UI.FieldGroup#General',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>assests}',
            ID : 'Assests',
            Target : 'assests/@UI.LineItem#Assests',
        },
    ]
);

annotate NetworthService.Networth with @(
    UI.FieldGroup#General: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {Value: year}
        ]

    },
);


//Networth Labels
annotate NetworthService.Assests with {
    type    @title: '{i18n>asset}';
    amount @title : '{i18n>amount}';
    comments @title: '{i18n>comments}'
}

annotate NetworthService.Assests with @(
    UI.LineItem #Assests : [
        {
            $Type : 'UI.DataField',
            Value : type.title,
            Label : 'assets',
        },
        {
            $Type : 'UI.DataField',
            Value : amount,
        },
        {
            $Type : 'UI.DataField',
            Value : comments,
            Label : 'comments',
        },
        {
            $Type : 'UI.DataField',
            Value : currency_code,
        },
        {
            $Type : 'UI.DataField',
            Value : subtype.title,
            Label : 'SubAssets',
        }
    ]
);


//**********Value help for Fields*****************//
annotate NetworthService.Assests with {
    type @Common: {
        Text                    : type.descr,
        TextArrangement         : #TextOnly,
        ValueListWithFixedValues: true
    };
}

annotate NetworthService.AssetTypes with @(
    UI.PresentationVariant #vh_AssestSubTypes_title : {
        $Type : 'UI.PresentationVariantType',
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : ID,
                Descending : false,
            },
        ],
    }
);

annotate NetworthService.AssetTypes with {
    ID @Common.Text : {
        $value : title,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

