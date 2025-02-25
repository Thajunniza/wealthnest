namespace wealthnest.networth;

using {
    cuid,
    managed,
    Currency
} from '@sap/cds/common';

aspect generic {
    key ID : String(10);
    title  : String(30);
    descr  : String;
};

entity AssetTypes : generic {
    assestSubTypes : Composition of many AssestSubTypes
                         on assestSubTypes.assetType = $self;
}

entity AssestSubTypes : generic {
    key assetType : Association to AssetTypes;
}

entity LiabilityTypes : generic {
    liabilitySubTypes : Composition of many LiabilitySubTypes
                            on liabilitySubTypes.liabilityType = $self;
}

entity LiabilitySubTypes : generic {
   key liabilityType : Association to LiabilityTypes;
}


entity Assests : cuid, managed {
    type             : Association to AssetTypes;
    subtype          : Association to one AssestSubTypes;
    amount           : Double;
    currency         : Currency;
    acquisition_date : Date;
    comments         : String;
    networth         : Association to Networth;
}

entity Liabilities : cuid, managed {
    type     : Association to LiabilityTypes;
    subtype  : Association to one LiabilitySubTypes;
    amount   : Double;
    currency : Currency;
    due_date : Date;
    comments : String;
    networth : Association to Networth;
}

entity Networth : cuid, managed {
    key year        : String(4);
        assests     : Composition of many Assests
                          on assests.networth = $self;
        liabilities : Composition of many Liabilities
                          on liabilities.networth = $self;
}
