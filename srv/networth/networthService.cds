
using { wealthnest.networth as networth } from '../../db/model/networth';

service NetworthService {
    @odata.draft.enabled
    entity Networth as projection on networth.Networth;
    entity Assests as projection on networth.Assests;
    entity Liabilities as projection on networth.Liabilities;
    entity AssetTypes as projection on networth.AssetTypes;
    entity LiabilityTypes as projection on networth.LiabilityTypes;
    entity AssestSubTypes as projection on networth.AssestSubTypes;
    entity LiabilitySubTypes as projection on networth.LiabilitySubTypes;
}

