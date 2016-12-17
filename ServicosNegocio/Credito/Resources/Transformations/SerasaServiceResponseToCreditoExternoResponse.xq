(:: pragma bea:global-element-parameter parameter="$resultadoSerasa" element="ns0:ResultadoSerasa" location="../Interfaces/Schemas/Serasa.xsd" ::)
(:: pragma bea:global-element-return element="ns2:resultadoVerificaCreditoExterno" location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)

declare namespace ns2 = "http://pucminas.br/SN/Credito";
declare namespace ns1 = "http://pucminas.br/MC/SOA/Biharck";
declare namespace ns0 = "http://serasa.com.br/SN/Serasa";
declare namespace xf = "http://tempuri.org/OSB_VARR/ServicosNegocio/Credito/Resources/Transformations/SerasaServiceResponseToCredintoExternoResponse/";

declare function xf:SerasaServiceResponseToCredintoExternoResponse($resultadoSerasa as element(ns0:ResultadoSerasa))
    as element(ns2:resultadoVerificaCreditoExterno) {
        <ns2:resultadoVerificaCreditoExterno>
            <ns2:credito>
                <ns1:pessoa>
                    <ns1:cnpj>{ data($resultadoSerasa/ns0:num_documento) }</ns1:cnpj>
                </ns1:pessoa>
            </ns2:credito>
        </ns2:resultadoVerificaCreditoExterno>
};

declare variable $resultadoSerasa as element(ns0:ResultadoSerasa) external;

xf:SerasaServiceResponseToCredintoExternoResponse($resultadoSerasa)
