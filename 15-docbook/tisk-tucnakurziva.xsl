<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="1.0">

<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/fo/docbook.xsl"/>

<!-- Úpravy parametrů -->

<xsl:template name="inline.biseq">
  <xsl:param name="content">
    <xsl:apply-templates/>
  </xsl:param>
  <fo:inline font-weight="bold" font-style="italic">
    <xsl:copy-of select="$content"/>
  </fo:inline>
</xsl:template>

<xsl:template match="emphasis">
  <xsl:choose>
    <xsl:when test="@role='bolditalic'">
      <xsl:call-template name="inline.biseq"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="inline.italicseq"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- Velikost papíru -->
<xsl:param name="paper.type" select="'A4'"/>

<!-- XSLT procesor může používat rozšíření pro callouts apod. -->
<xsl:param name="use.extensions" select="1"/>

<!-- Rozšíření specifická pro daný XSLT procesor -->
<xsl:param name="passivetex.extensions" select="1"/>

<!-- <xsl:param name="xep.extensions" select="1"/> -->

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

</xsl:stylesheet>