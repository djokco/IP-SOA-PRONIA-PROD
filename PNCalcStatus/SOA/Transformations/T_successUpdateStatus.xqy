xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace cal="http://soa.indonesiapower.co.id/schema/calcproniastatus";
(:: import schema at "../Schemas/calcproniastatus.xsd" ::)
declare namespace upd="http://xmlns.oracle.com/pcbpel/adapter/db/top/UpdateStatusDb";
(:: import schema at "../Schemas/UpdateStatusDb_table.xsd" ::)
declare namespace dbc="http://xmlns.oracle.com/pcbpel/adapter/db/top/dbCalcStatus";
(:: import schema at "../Schemas/dbCalcStatus_table.xsd" ::)

declare variable $InputVariable.Pronia3CalcStatusCollection as element() (:: schema-element(dbc:Pronia3CalcStatusCollection) ::) external;
declare variable $Response as element() (:: schema-element(cal:ResponseCalcproniastatus) ::) external;

declare function local:funcT_successupdatestatus($InputVariable.Pronia3CalcStatusCollection as element() (:: schema-element(dbc:Pronia3CalcStatusCollection) ::), 
                                                 $Response as element() (:: schema-element(cal:ResponseCalcproniastatus) ::)) 
                                                 as element() (:: schema-element(upd:Pronia3CalcStatusCollection) ::) {
    <upd:Pronia3CalcStatusCollection>
        {
            for $Pronia3CalcStatus in $InputVariable.Pronia3CalcStatusCollection/dbc:Pronia3CalcStatus
            return 
            <upd:Pronia3CalcStatus>
                <upd:id>{fn:data($Pronia3CalcStatus/dbc:id)}</upd:id>
                <upd:unit>{fn:data($Pronia3CalcStatus/dbc:unit)}</upd:unit>
                <upd:soaMessages>{fn:data($Response/cal:response/cal:ErrorMessage)}</upd:soaMessages></upd:Pronia3CalcStatus>
        }</upd:Pronia3CalcStatusCollection>
};

local:funcT_successupdatestatus($InputVariable.Pronia3CalcStatusCollection, $Response)