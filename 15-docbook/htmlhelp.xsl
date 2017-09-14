<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/htmlhelp/profile-htmlhelp.xsl"/>

<!-- Kódování řídících souborů -->
<xsl:param name="htmlhelp.encoding" select="'windows-1250'"/>

<!-- Kódování výstupních HTML stránek -->
<xsl:param name="chunker.output.encoding" select="'windows-1250'"/>
<xsl:param name="saxon.character.representation" select="'native'"/>

<!-- Mají se číslovat položky v obsahu -->
<xsl:param name="htmlhelp.autolabel" select="0"/>

<!-- Jméno výsledného CHM souboru -->
<xsl:param name="htmlhelp.chm" select="'napoveda.chm'"/>

<!-- Jméno projektového souboru -->
<xsl:param name="htmlhelp.hhp" select="'htmlhelp.hhp'"/>

<!-- Jméno souboru s obsahem -->
<xsl:param name="htmlhelp.hhc" select="'toc.hhc'"/>

<!-- Tlačítko pro skok na domovskou stránku -->
<xsl:param name="htmlhelp.button.home">1</xsl:param>
<xsl:param name="htmlhelp.button.home.url">http://www.kosek.cz</xsl:param>

<!-- Rejstřík se má generovat vždy -->
<xsl:param name="htmlhelp.generate.index" select="1"/>

</xsl:stylesheet>