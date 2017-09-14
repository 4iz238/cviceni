<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/fo/docbook.xsl"/>

<!-- Úpravy parametrů -->

<!-- Velikost papíru -->
<xsl:param name="paper.type" select="'A4'"/>

<!-- XSLT procesor může používat rozšíření pro callouts apod. -->
<xsl:param name="use.extensions" select="1"/>

<xsl:param name="xep.extensions" select="1"/>

<!-- Velikost písma textu -->
<xsl:param name="body.font.master">11</xsl:param>

<!-- Nechceme obrázek -->
<xsl:param name="draft.watermark.image" select="''"/>

<!-- Nadpisy jsou zarovnány s textem, jak je zvykem v evropské typografii -->
<xsl:param name="body.start.indent" select="'0pt'"/>

<!-- Nastavení seznamů -->
<xsl:attribute-set name="list.block.properties">
  <xsl:attribute name="provisional-distance-between-starts">4em</xsl:attribute>
  <xsl:attribute name="provisional-label-separation">1em</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="orderedlist.properties">
  <xsl:attribute name="provisional-distance-between-starts">4em</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="itemizedlist.label.properties">
  <xsl:attribute name="text-align">right</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="orderedlist.label.properties">
  <xsl:attribute name="text-align">right</xsl:attribute>
</xsl:attribute-set>

</xsl:stylesheet>