<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/html/chunk.xsl"/>

<!-- Připojení kaskádového stylu -->
<xsl:param name="html.stylesheet">docbook.css</xsl:param>

<!-- Mají se používat rozšíření -->
<xsl:param name="use.extensions" select="1"/>

<!-- Kódování výstupních HTML stránek -->
<xsl:param name="default.encoding" select="'utf-8'"/>
<xsl:param name="saxon.character.representation" select="'native'"/>

<!-- Chunky se vytvářejí jen pro kapitoly -->
<xsl:param name="chunk.sections" select="'0'"/>
							
</xsl:stylesheet>