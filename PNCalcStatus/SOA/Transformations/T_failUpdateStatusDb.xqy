xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace fau="http://soa.indonesiapower.co.id/schema/fault";
(:: import schema at "../Schemas/fault.xsd" ::)
declare namespace dbc="http://xmlns.oracle.com/pcbpel/adapter/db/top/dbCalcStatus";
(:: import schema at "../Schemas/dbCalcStatus_table.xsd" ::)
declare namespace upd="http://xmlns.oracle.com/pcbpel/adapter/db/top/updateStatusdbFail";
(:: import schema at "../Schemas/updateStatusdbFail_table.xsd" ::)

declare variable $InputVariable.Pronia3CalcStatusCollection as element() (:: schema-element(dbc:Pronia3CalcStatusCollection) ::) external;
declare variable $fault as element() (:: schema-element(fau:fault) ::) external;

declare function local:funcT_failupdatestatusdb($InputVariable.Pronia3CalcStatusCollection as element() (:: schema-element(dbc:Pronia3CalcStatusCollection) ::), 
                                                $fault as element() (:: schema-element(fau:fault) ::)) 
                                                as element() (:: schema-element(upd:Pronia3CalcStatusCollection) ::) {
    <upd:Pronia3CalcStatusCollection>
        {
            for $Pronia3CalcStatus in $InputVariable.Pronia3CalcStatusCollection/dbc:Pronia3CalcStatus
            return 
            <upd:Pronia3CalcStatus>
                <upd:id>{fn:data($Pronia3CalcStatus/dbc:id)}</upd:id>
                <upd:unit>{fn:data($Pronia3CalcStatus/dbc:unit)}</upd:unit>
                <upd:calcPeriod>{fn:data($Pronia3CalcStatus/dbc:calcPeriod)}</upd:calcPeriod>
                <upd:etlStartDate>{fn:data($Pronia3CalcStatus/dbc:etlStartDate)}</upd:etlStartDate>
                <upd:etlEndDate>{fn:data($Pronia3CalcStatus/dbc:etlEndDate)}</upd:etlEndDate>
                <upd:owbStatus>{fn:data($Pronia3CalcStatus/dbc:owbStatus)}</upd:owbStatus>
                <upd:status>{fn:data($Pronia3CalcStatus/dbc:status)}</upd:status>
                <upd:soaMessages>{fn:data($fault/fau:details)}</upd:soaMessages></upd:Pronia3CalcStatus>
        }</upd:Pronia3CalcStatusCollection>
};

local:funcT_failupdatestatusdb($InputVariable.Pronia3CalcStatusCollection, $fault)
