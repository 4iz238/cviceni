<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:saxon="http://saxon.sf.net/"
  extension-element-prefixes="saxon"
  exclude-result-prefixes="saxon"
  xpath-default-namespace="http://www.w3.org/1999/xhtml"
  version="3.0">
  
  <!-- 
    Nutno stáhnout tagsoup-1.2.1.jar a přidat jako extenzi v transformačním scénáři
    http://vrici.lojban.org/~cowan/XML/tagsoup/
    
    Tagsoup vrací HTML stránku ve jmenném prostoru XHTML, proto je použito 
    xpath-default-namespace="http://www.w3.org/1999/xhtml" pro snazší zápis XPath výrazů
  -->
  
  <xsl:output method="text"/>
  
  <xsl:template name="xsl:initial-template">
    <xsl:variable name="stranka" select="unparsed-text('https://www.cnb.cz/cs/')"/>
    <xsl:variable name="naparsovano" select="saxon:parse-html($stranka)"/>
    
    <xsl:text>Aktuální kurz EUR dle ČNB: </xsl:text>
    <xsl:value-of select="$naparsovano//span[@id = 'rate_eur']"/>
    
  </xsl:template>
  
</xsl:stylesheet>