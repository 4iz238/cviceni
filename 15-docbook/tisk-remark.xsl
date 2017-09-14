<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="1.0">

<!-- Element remark se zobrazuje jako marginálie -->

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
<xsl:param name="page.margin.inner" select="'8pc'"/>
<xsl:param name="page.margin.outer" select="'8pc'"/>

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
<xsl:param name="title.margin.left" select="'-5pc'"/>

<xsl:param name="show.comments.as.marginalias" select="1"/>

<xsl:template match="comment|remark">
  <xsl:if test="$show.comments != 0">
    <xsl:choose>
      <xsl:when test="$show.comments.as.marginalias = 1">
        <fo:float float="start">
          <fo:block width="4pc" text-align="end" font-family="Helvetica" font-size="8pt" font-weight="bold" margin-left="{$title.margin.left}">
            <xsl:call-template name="inline.charseq"/>
          </fo:block>
        </fo:float>
      </xsl:when>
      <xsl:otherwise>
        <fo:block font-style="italic">
          <xsl:call-template name="inline.charseq"/>
        </fo:block>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
</xsl:template>


</xsl:stylesheet>