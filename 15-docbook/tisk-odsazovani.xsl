<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="1.0">

<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/fo/docbook.xsl"/>

<!-- Úpravy parametrů -->

<!-- Velikost papíru -->
<xsl:param name="paper.type" select="'A4'"/>

<!-- XSLT procesor může používat rozšíření pro callouts apod. -->
<xsl:param name="use.extensions" select="1"/>

<!-- Rozšíření specifická pro daný FO procesor -->
<!-- <xsl:param name="passivetex.extensions" select="1"/> -->

<xsl:param name="xep.extensions" select="1"/>

<!-- Nechceme obrázek -->
<xsl:param name="draft.watermark.image" select="''"/>

<xsl:template match="para[1]">
  <fo:block text-indent="0em">
    <xsl:apply-imports/>
  </fo:block>
</xsl:template>

<xsl:template match="para">
  <fo:block text-indent="1em">
    <xsl:apply-imports/>
  </fo:block>
</xsl:template>

</xsl:stylesheet>