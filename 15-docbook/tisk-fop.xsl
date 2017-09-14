<?xml version="1.0" encoding="windows-1250"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:import href="file:///c:/docbook/xsl/fo/docbook.xsl"/>

<!-- �pravy parametr� -->

<!-- Velikost pap�ru -->
<xsl:param name="paper.type" select="'A4'"/>

<!-- XSLT procesor m��e pou��vat roz���en� pro callouts apod. -->
<xsl:param name="use.extensions" select="1"/>

<xsl:param name="fop1.extensions" select="1"/>

<!-- Velikost p�sma textu -->
<xsl:param name="body.font.master">11</xsl:param>

<!-- Velikost okraj� -->
<xsl:param name="page.margin.inner" select="'1in'"/>
<xsl:param name="page.margin.outer" select="'1in'"/>

<!-- ��slov�n� sekc� a kapitol -->
<xsl:param name="section.autolabel" select="1"/>
<xsl:param name="section.label.includes.component.label" select="1"/>
<xsl:param name="chapter.autolabel" select="1"/>
<xsl:param name="appendix.autolabel" select="1"/>
<xsl:param name="part.autolabel" select="1"/>
<xsl:param name="preface.autolabel" select="0"/>

<!-- Nadpisy jsou zarovn�ny s textem, jak je zvykem v evropsk� typografii -->
<xsl:param name="title.margin.left" select="'0pt'"/>

</xsl:stylesheet>