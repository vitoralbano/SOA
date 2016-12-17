(:: pragma bea:global-element-parameter parameter="$parametrosVerificaCreditoInterno" element="ns2:parametrosVerificaCreditoInterno" location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)
(:: pragma bea:global-element-return element="ns0:ParametrosCreditLegacy" location="../Interfaces/Schemas/CreditLegacy.xsd" ::)

declare namespace ns2 = "http://pucminas.br/SN/Credito";
declare namespace ns1 = "http://pucminas.br/MC/SOA/Biharck";
declare namespace ns0 = "http://creditlegacy.com.br/SN/CreditLegacy";
declare namespace xf = "http://tempuri.org/OSB_VARR/ServicosNegocio/Credito/Resources/Transformations/VerificaCreditoInternoToCreditLegacy/";

declare function xf:VerificaCreditoInternoToCreditLegacy($parametrosVerificaCreditoInterno as element(ns2:parametrosVerificaCreditoInterno))
    as element(ns0:ParametrosCreditLegacy) {
        <ns0:ParametrosCreditLegacy>
            <ns0:cpf>{ data($parametrosVerificaCreditoInterno/ns2:pessoa/ns1:cnpj) }</ns0:cpf>
            <ns0:dt_solicitacao>{ fn:current-date() }</ns0:dt_solicitacao>
        </ns0:ParametrosCreditLegacy>
};

declare variable $parametrosVerificaCreditoInterno as element(ns2:parametrosVerificaCreditoInterno) external;

xf:VerificaCreditoInternoToCreditLegacy($parametrosVerificaCreditoInterno)
