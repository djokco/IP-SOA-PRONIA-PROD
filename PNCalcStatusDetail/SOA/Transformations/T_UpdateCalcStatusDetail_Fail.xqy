xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace fau="http://ebs.indonesiapower.co.id/schema/fault";
(:: import schema at "../Schemas/fault.xsd" ::)
declare namespace dbp="http://xmlns.oracle.com/pcbpel/adapter/db/top/dbPronia3CalcStatusDetail";
(:: import schema at "../Schemas/dbPronia3CalcStatusDetail_table.xsd" ::)
declare namespace dbu="http://xmlns.oracle.com/pcbpel/adapter/db/top/dbUpdatePronia3CalcStatusDetail";
(:: import schema at "../Schemas/dbUpdatePronia3CalcStatusDetail_table.xsd" ::)

declare variable $InputVariable.Pronia3CalcStatusDetailCollection as element() (:: schema-element(dbp:Pronia3CalcStatusDetailCollection) ::) external;
declare variable $fault as element() (:: schema-element(fau:fault) ::) external;

declare function local:funcTransformation_1($InputVariable.Pronia3CalcStatusDetailCollection as element() (:: schema-element(dbp:Pronia3CalcStatusDetailCollection) ::), 
                                            $fault as element() (:: schema-element(fau:fault) ::)) 
                                            as element() (:: schema-element(dbu:Pronia3CalcStatusDetailCollection) ::) {
    <dbu:Pronia3CalcStatusDetailCollection>
        {
            for $Pronia3CalcStatusDetail in $InputVariable.Pronia3CalcStatusDetailCollection/dbp:Pronia3CalcStatusDetail
            return 
            <dbu:Pronia3CalcStatusDetail>
                <dbu:id>{fn:data($Pronia3CalcStatusDetail/dbp:id)}</dbu:id>
                <dbu:unit>{fn:data($Pronia3CalcStatusDetail/dbp:unit)}</dbu:unit>
                <dbu:calcPeriod>{fn:data($Pronia3CalcStatusDetail/dbp:calcPeriod)}</dbu:calcPeriod>
                <dbu:calcStartDate>{fn:data($Pronia3CalcStatusDetail/dbp:calcStartDate)}</dbu:calcStartDate>
                <dbu:calcEndDate>{fn:data($Pronia3CalcStatusDetail/dbp:calcEndDate)}</dbu:calcEndDate>
                <dbu:owbStatus>{fn:data($Pronia3CalcStatusDetail/dbp:owbStatus)}</dbu:owbStatus>
                <dbu:soaMessages>{fn:data($fault/fau:details)}</dbu:soaMessages></dbu:Pronia3CalcStatusDetail>
        }
    </dbu:Pronia3CalcStatusDetailCollection>
};

local:funcTransformation_1($InputVariable.Pronia3CalcStatusDetailCollection, $fault)
