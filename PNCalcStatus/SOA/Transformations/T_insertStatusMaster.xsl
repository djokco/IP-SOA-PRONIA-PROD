<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/top/dbCalcStatus"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tns="http://www.ibm.com/maximo"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl ns0 tns oraxsl xp20 xref mhdr oraext dvm socket"
                xmlns:pc="http://xmlns.oracle.com/pcbpel/" xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/"
                xmlns:ns2="http://soa.indonesiapower.co.id/schema/calcproniastatus"
                xmlns:ns3="http://soa.indonesiapower.co.id/schema/fault"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ns1="http://xmlns.oracle.com/pcbpel/adapter/db/IPApplication/PNCalcStatus/dbCalcStatus"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:mxws="http://www.ibm.com/maximo/wsdl/OracleBI_PNCALCInterface">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/dbCalcStatus.wsdl"/>
        <oracle-xsl-mapper:rootElement name="Pronia3CalcStatusCollection"
                                       namespace="http://xmlns.oracle.com/pcbpel/adapter/db/top/dbCalcStatus"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="http://mx76app2.indonesiapower.co.id:9089/meaweb/wsdl/OracleBI_PNCALCInterface?wsdl"/>
        <oracle-xsl-mapper:rootElement name="SyncPNCALC" namespace="http://www.ibm.com/maximo"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [FRI JAN 06 15:10:29 ICT 2017].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:SyncPNCALC>
      <tns:PNCALCSet>
        <xsl:for-each select="/ns0:Pronia3CalcStatusCollection/ns0:Pronia3CalcStatus">
          <tns:IPPN_CALC_STATUS>
            <tns:CALC_PERIOD>
              <xsl:value-of select="ns0:calcPeriod"/>
            </tns:CALC_PERIOD>
            <tns:ETL_END_DATE>
              <xsl:value-of select="ns0:etlEndDate"/>
            </tns:ETL_END_DATE>
            <tns:ETL_START_DATE>
              <xsl:value-of select="ns0:etlStartDate"/>
            </tns:ETL_START_DATE>
            <tns:ID>
              <xsl:value-of select="ns0:id"/>
            </tns:ID>
            <tns:ORGID>IP</tns:ORGID>
            <tns:OWB_STATUS>
              <xsl:value-of select="ns0:owbStatus"/>
            </tns:OWB_STATUS>
            <tns:SITEID>
              <xsl:choose>
                <xsl:when test="ns0:unit='BCL'">
                  <xsl:value-of select="'CLG'"/>
                </xsl:when>
                <otherwise>
                  <xsl:value-of select="ns0:unit"/>
                </otherwise>
              </xsl:choose>
            </tns:SITEID>
            <tns:STATUS>
              <xsl:value-of select="ns0:status"/>
            </tns:STATUS>
          </tns:IPPN_CALC_STATUS>
        </xsl:for-each>
      </tns:PNCALCSet>
    </tns:SyncPNCALC>
  </xsl:template>
</xsl:stylesheet>
