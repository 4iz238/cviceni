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

<!-- Velikost písma textu -->
<xsl:param name="body.font.master">11</xsl:param>

<!-- Velikost okrajů -->
<xsl:param name="page.margin.inner" select="'1in'"/>
<xsl:param name="page.margin.outer" select="'1in'"/>

<!-- Číslování sekcí a kapitol -->
<xsl:param name="section.autolabel" select="1"/>
<xsl:param name="section.label.includes.component.label" select="1"/>
<xsl:param name="chapter.autolabel" select="1"/>
<xsl:param name="appendix.autolabel" select="1"/>
<xsl:param name="part.autolabel" select="1"/>
<xsl:param name="preface.autolabel" select="0"/>

<!-- Nechceme obrázek -->
<xsl:param name="draft.watermark.image" select="''"/>

<!-- Nadpisy jsou zarovnány s textem, jak je zvykem v evropské typografii -->
<xsl:param name="body.start.indent" select="'0pt'"/>

<!-- Úpravy pro zobrazení rovnic -->

<!-- Z jakého dokumentu se bude číst uživatelská změna lokalizace -->
<xsl:param name="local.l10n.xml" select="document('')"/>

<!-- Lokalizační dokument může být přímo součástí stylu -->
<i18n xmlns="http://docbook.sourceforge.net/xmlns/l10n/1.0">

  <!-- Jazyk lokalizace -->
  <l10n language="cs">
    
    <context name="title">
      <template name="equation" text="(%n)"/>
    </context>

    <context name="xref-number-and-title">
      <template name="equation" text="%n"/>
    </context>

  </l10n>
</i18n>

<xsl:template name="formal.object.heading">
  <xsl:param name="object" select="."/>
  <xsl:param name="placement" select="'before'"/>

  <xsl:variable name="content">
    <fo:block xsl:use-attribute-sets="formal.title.properties">
      <xsl:choose>
	<xsl:when test="$placement = 'before'">
	  <xsl:attribute
		 name="keep-with-next.within-column">always</xsl:attribute>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:attribute
		 name="keep-with-previous.within-column">always</xsl:attribute>
	</xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="$object" mode="object.title.markup">
	<xsl:with-param name="allow-anchors" select="1"/>
      </xsl:apply-templates>
    </fo:block>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="self::equation">
      <fo:float float="right">
	<xsl:copy-of select="$content"/>
      </fo:float>
    </xsl:when>
    <xsl:otherwise>
      <xsl:copy-of select="$content"/>
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>

</xsl:stylesheet>