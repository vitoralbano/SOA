(:: pragma bea:global-element-parameter parameter="$parametrosVerificaCreditoExterno" element="ns2:parametrosVerificaCreditoExterno" location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)
(:: pragma bea:global-element-return element="ns0:ParametrosSerasa" location="../Interfaces/Schemas/Serasa.xsd" ::)

declare namespace ns2 = "http://pucminas.br/SN/Credito";
declare namespace ns1 = "http://pucminas.br/MC/SOA/Biharck";
declare namespace ns0 = "http://serasa.com.br/SN/Serasa";
declare namespace xf = "http://tempuri.org/OSB_VARR/ServicosNegocio/Credito/Resources/Transformations/VerificaCreditoExternoToSerasa/";

declare function xf:VerificaCreditoExternoToSerasa($parametrosVerificaCreditoExterno as element(ns2:parametrosVerificaCreditoExterno))
    as element(ns0:ParametrosSerasa) {
        <ns0:ParametrosSerasa>
            <ns0:num_documento>{ data($parametrosVerificaCreditoExterno/ns2:pessoa/ns1:cnpj) }</ns0:num_documento>
            <ns0:dt_nascimento>{ data($parametrosVerificaCreditoExterno/ns2:pessoa/ns1:dataNascimento) }</ns0:dt_nascimento>
            <ns0:dt_solicitacao>{ fn:current-date() }</ns0:dt_solicitacao>
        </ns0:ParametrosSerasa>
};

declare variable $parametrosVerificaCreditoExterno as element(ns2:parametrosVerificaCreditoExterno) external;

xf:VerificaCreditoExternoToSerasa($parametrosVerificaCreditoExterno)
