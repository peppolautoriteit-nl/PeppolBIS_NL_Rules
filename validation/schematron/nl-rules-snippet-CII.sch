<!--
     This is a TEST version for the country-specific rules for NL
     Do NOT use these in production.
     
     This particular file is a snippet that can be included in a full document
     type schematron file.
     
     All rules are fatal, and will result in validation failures.
-->
<pattern xmlns="http://purl.oclc.org/dsdl/schematron" abstract="false" id="nlcius">
  <!-- These rules only apply when the supplier is in the Netherlands -->
  <rule context="/rsm:CrossIndustryInvoice/rsm:ExchangedDocument[some $code in tokenize('81 83 381 396 532', '\s') satisfies normalize-space(ram:TypeCode) = $code][$supplierCountry = 'NL']">
    <!-- Original rule in NLCIUS: BR-NL-9 -->
    <assert id="NL-R-001" test="//ram:ApplicableHeaderTradeSettlement/ram:InvoiceReferencedDocument/ram:IssuerAssignedID" flag="fatal">[NL-R-001] For suppliers in the Netherlands, if the document is a creditnote, the document MUST contain an invoice reference (ram:ApplicableHeaderTradeSettlement/ram:InvoiceReferencedDocument/ram:IssuerAssignedID)</assert>
  </rule>

  <rule context="/rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:SellerTradeParty/ram:PostalTradeAddress[$supplierCountry = 'NL']">
    <!-- Original rule in NLCIUS: BR-NL-3 -->
    <assert id="NL-R-002" test="ram:LineOne and ram:CityName and ram:PostcodeCode" flag="fatal">[NL-R-002] For suppliers in the Netherlands the supplier's address (ram:SellerTradeParty/ram:PostalTradeAddress) MUST contain street name (ram:LineOne), city (ram:CityName) and post code (ram:PostcodeCode)</assert>
  </rule>

  <rule context="/rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:SellerTradeParty/ram:SpecifiedLegalOrganization/ram:ID[$supplierCountry = 'NL']">
    <!-- Original rule in NLCIUS: BR-NL-1 -->
    <assert id="NL-R-003" test="(contains(concat(' ', string-join(@schemeID, ' '), ' '), ' 0106 ') or contains(concat(' ', string-join(@schemeID, ' '), ' '), ' 0190 ')) and (normalize-space(.) != '')" flag="fatal">[NL-R-003] For suppliers in the Netherlands, the legal entity identifier MUST be either a KVK or OIN number (schemeID 0106 or 0190)</assert>
  </rule>

  <rule context="/rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:BuyerTradeParty/ram:PostalTradeAddress[$supplierCountry = 'NL']">
    <!-- Original rule in NLCIUS: BR-NL-4 -->
    <assert id="NL-R-004" test="ram:CountryID != 'NL' or (ram:LineOne and ram:CityName and ram:PostcodeCode)" flag="fatal">[NL-R-004] For suppliers in the Netherlands, if the customer is in the Netherlands, the customer address (ram:BuyerTradeParty/ram:PostalTradeAddress) MUST contain street name (ram:LineOne), city (ram:CityName) and post code (ram:PostcodeCode)</assert>
  </rule>

  <rule context="/rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:BuyerTradeParty/ram:SpecifiedLegalOrganization/ram:ID[$supplierCountry = 'NL']">
    <!-- Original rule in NLCIUS: BR-NL-10 -->
    <assert id="NL-R-005" test="
        (not(../../ram:PostalTradeAddress/ram:CountryID = 'NL')
         or (
         contains(concat(' ', string-join(@schemeID, ' '), ' '), ' 0106 ')
         or
         contains(concat(' ', string-join(@schemeID, ' '), ' '), ' 0190 ')
        ) and (normalize-space(.) != ''))
    " flag="fatal">[NL-R-005] For suppliers in the Netherlands, if the customer is in the Netherlands, the customer's legal entity identifier MUST be either a KVK or OIN number (schemeID 0106 or 0190)</assert>
  </rule>

  <rule context="rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:SellerTaxRepresentativeTradeParty/ram:PostalTradeAddress[$supplierCountry = 'NL']">
    <!-- Original rule in NLCIUS: BR-NL-5 -->
    <assert id="NL-R-006" test="ram:CountryID != 'NL' or (ram:LineOne and ram:CityName and ram:PostcodeCode)" flag="fatal">[NL-R-006] For suppliers in the Netherlands, if the fiscal representative is in the Netherlands, the representative's address (ram:SellerTaxRepresentativeTradeParty/ram:PostalTradeAddress) MUST contain street name (ram:LineOne), city (ram:CityName) and post code (ram:PostcodeCode)</assert>
  </rule>

  <rule context="/rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement/ram:SpecifiedTradeSettlementHeaderMonetarySummation[$supplierCountry = 'NL']">
    <!-- Original rule in NLCIUS: BR-NL-11 -->
    <assert id="NL-R-007" test="xs:decimal(ram:DuePayableAmount) &lt;= 0.0 or (/rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement/ram:SpecifiedTradeSettlementPaymentMeans)" flag="fatal">[NL-R-007] For suppliers in the Netherlands, the supplier MUST provide a means of payment (ram:SpecifiedTradeSettlementPaymentMeans) if the payment is from customer to supplier</assert>
  </rule>

  <rule context="/rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement/ram:SpecifiedTradeSettlementPaymentMeans[$supplierCountry = 'NL']">
    <!-- Original rule in NLCIUS: BR-NL-12 -->
    <assert id="NL-R-008" test="normalize-space(ram:TypeCode) = '30' or
              normalize-space(ram:TypeCode) = '48' or
              normalize-space(ram:TypeCode) = '49' or
              normalize-space(ram:TypeCode) = '57' or
              normalize-space(ram:TypeCode) = '58' or
              normalize-space(ram:TypeCode) = '59'" flag="fatal">[NL-R-008] For suppliers in the Netherlands, the payment means code (ram:SpecifiedTradeSettlementPaymentMeans/ram:TypeCode) MUST be one of 30, 48, 49, 57, 58 or 59</assert>
  </rule>

  <rule context="rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/ram:IncludedSupplyChainTradeLineItem/ram:BuyerOrderReferencedCIReferencedDocument/ram:LineID[$supplierCountry = 'NL']">
    <!-- Original rule in NLCIUS: BR-NL-13 -->
    <assert id="NL-R-009" test="exists(/rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeAgreement/ram:BuyerOrderReferencedDocument/ram:IssuerAssignedID)" flag="fatal">[NL-R-009] For suppliers in the Netherlands, if an order line reference (BT-132) is used, there must be an order reference on the document level (BT-13)</assert>
  </rule>

</pattern>