<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/fo/docbook.xsl"/>

<!-- Úpravy parametrů -->

<!-- Velikost papíru -->
<xsl:param name="paper.type" select="'A4'"/>

<!-- XSLT procesor může používat rozšíření pro callouts apod. -->
<xsl:param name="use.extensions" select="1"/>

<!-- Z jakého dokumentu se bude číst uživatelská změna lokalizace -->
<xsl:param name="local.l10n.xml" select="document('')"/>

<!-- Lokalizační dokument může být přímo součástí stylu -->
<i18n xmlns="http://docbook.sourceforge.net/xmlns/l10n/1.0">

  <!-- Jazyk lokalizace -->
  <l10n language="cs">
    
    <!-- Úprava šablon pro křížové odkazy -->
    <context name="xref-number-and-title">
      <template name="figure" text="%n (%t)"/>
    </context>

  </l10n>
</i18n>

<!-- Nechceme obrázek -->
<xsl:param name="draft.watermark.image" select="''"/>

</xsl:stylesheet>