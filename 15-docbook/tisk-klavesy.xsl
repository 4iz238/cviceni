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
<xsl:param name="xep.extensions" select="1"/>

<!-- Velikost písma textu -->
<xsl:param name="body.font.master">11</xsl:param>

<!-- Nechceme obrázek -->
<xsl:param name="draft.watermark.image" select="''"/>

<!-- Nadpisy jsou zarovnány s textem, jak je zvykem v evropské typografii -->
<xsl:param name="body.start.indent" select="'0pt'"/>

<!-- Okolo jména klávesy se pomocí SVG nakreslí rámeček -->
<xsl:template match="keycap">
  <xsl:variable name="scale" select="string-length(.)"/>
  <fo:instream-foreign-object content-height="12pt" baseline-shift="-2.5pt">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {6*$scale + 4} 10">
      <rect x="1" y="1" width="{6*$scale + 2}" height="8" rx="1" ry="1" style="stroke: black; fill: none; stroke-width: 0.1"/>
      <text x="{(6*$scale + 4) div 2}" y="8" style="text-anchor: middle; font-size: 8;">
	<xsl:value-of select="."/>
      </text>
    </svg>
  </fo:instream-foreign-object>
</xsl:template>

</xsl:stylesheet>