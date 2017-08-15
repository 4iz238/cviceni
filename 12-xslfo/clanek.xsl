<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:output method="xml" encoding="utf-8"/>

<xsl:template match="/">
  <fo:root>
    <!-- Definice layoutu stránky -->
    <fo:layout-master-set>
      <!-- Rozměry stránky a její okraje -->
      <fo:simple-page-master master-name="my-page"
                             page-height="297mm" 
                             page-width="210mm" 
                             margin="1in">
        <!-- Tiskové zrcadlo - oblast pro samotný obsah stránky -->
        <fo:region-body margin-bottom="15mm"/>        
        <!-- Oblast pro patu stránky -->
        <fo:region-after extent="10mm"/>
      </fo:simple-page-master>
    </fo:layout-master-set>
    
    <!-- Definice obsahu stránky -->
    <fo:page-sequence master-reference="my-page">
      <!-- Společný obsah všech stránek v patě stránky -->
      <fo:static-content flow-name="xsl-region-after">
        <fo:block>
          <xsl:text>Strana </xsl:text>
          <fo:page-number/>
        </fo:block>
      </fo:static-content>
      <!-- Samotný text dokumentu -->
      <fo:flow flow-name="xsl-region-body">
        <!-- Zpracování všech elementů zdrojového dokumentu -->
        <xsl:apply-templates/>
        <xsl:apply-templates select="clanek/zahlavi/autor"/>
      </fo:flow>
    </fo:page-sequence>
  </fo:root>
</xsl:template>

<!-- Šablona pro záhlaví článku -->
<xsl:template match="zahlavi">
  <fo:block text-align="center" space-before="20pt"
            space-after="14pt" font-family="Helvetica">
    <xsl:apply-templates select="rubrika"/>
    <xsl:apply-templates select="nazev"/>
  </fo:block>
</xsl:template>

<!--Šablona pro rubriku -->
<xsl:template match="rubrika">
  <fo:block font-size="6pt" text-align="end">
    <xsl:text>Rubrika: </xsl:text>
    <fo:inline font-weight="bold">
      <xsl:apply-templates/>
    </fo:inline>
  </fo:block>
</xsl:template>

<!--Šablona pro název článku -->
<xsl:template match="nazev">
  <fo:block font-size="24pt" font-weight="bold" space-before="6pt"
            space-after="4pt">
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>

<!--Šablona pro autora článku -->
<xsl:template match="autor">
  <fo:block font-style="italic" text-align="end" space-before="6pt">
    <xsl:text>&#x2014; </xsl:text>
    <xsl:apply-templates/>
    <xsl:text> &#x2014; </xsl:text>
  </fo:block>
</xsl:template>

<!--Šablona pro perex -->
<xsl:template match="perex">
  <fo:block text-align="justify" font-style="italic" font-weight="bold">
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>

<!--Šablona pro odtavec -->
<xsl:template match="para">
  <fo:block text-indent="20pt" text-align="justify">
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>

<!--Šablona pro zvýraznění -->
<xsl:template match="em">
  <fo:inline font-style="italic">
    <xsl:apply-templates/>
  </fo:inline>
</xsl:template>

</xsl:stylesheet>
