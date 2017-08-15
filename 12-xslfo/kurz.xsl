<?xml version="1.0" encoding="windows-1250"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="1.0">

<xsl:template match="/">
  <fo:root>
    <fo:layout-master-set>
      <fo:simple-page-master margin-bottom="2cm" margin-left="3cm" 
			     margin-right="2cm" margin-top="2.5cm"
			     master-name="my-master">
	<fo:region-body/>
      </fo:simple-page-master>
    </fo:layout-master-set>
    <fo:page-sequence master-reference="my-master">
      <fo:flow flow-name="xsl-region-body" font-family="serif"
	       font-size="12pt">
        <fo:block>
          <xsl:apply-templates/>
        </fo:block>
      </fo:flow>
    </fo:page-sequence>
  </fo:root>
</xsl:template>

<xsl:template match="ident">
  <fo:block font-family="sans-serif"
	    font-size="200%">
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>

<xsl:template match="n�zev">
  <xsl:apply-templates/>
  <xsl:if test="following-sibling::podn�zev">
    &#x2014;
  </xsl:if>
</xsl:template>

<xsl:template match="podn�zev">
  <fo:inline font-style="italic">
    <xsl:apply-templates/>
  </fo:inline>
</xsl:template>

<xsl:template match="�ed�">
  <fo:inline color="gray">
    <xsl:apply-templates/>
  </fo:inline>
</xsl:template>

<xsl:template match="zelen�">
  <fo:inline color="green">
    <xsl:apply-templates/>
  </fo:inline>
</xsl:template>

</xsl:stylesheet>