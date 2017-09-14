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

<!-- Nechceme obrázek -->
<xsl:param name="draft.watermark.image" select="''"/>

<xsl:attribute-set name="table.properties">
  <xsl:attribute name="text-align">center</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="table.table.properties">
  <xsl:attribute name="table-layout">auto</xsl:attribute>
  <xsl:attribute name="start-indent">auto</xsl:attribute>
  <xsl:attribute name="end-indent">auto</xsl:attribute>
</xsl:attribute-set>

<xsl:param name="tablecolumns.extension" select="0"/>

</xsl:stylesheet>