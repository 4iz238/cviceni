<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"
                xmlns:saxon="http://icl.com/saxon"
                extension-element-prefixes="saxon">

<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/html/docbook.xsl"/>

<!-- Úpravy parametrů -->

<!-- Změna výstupního kódování -->
<xsl:output method="html" encoding="utf-8" 
                          saxon:character-representation="native"/>

<!-- Mají se používat rozšíření -->
<xsl:param name="use.extensions" select="1"/>

<!-- Mají se sekce automaticky číslovat -->
<xsl:param name="section.autolabel" select="1"/>

<!-- Mají čísla sekcí obsahovat i čísla kapitol -->
<xsl:param name="section.label.includes.component.label" select="1"/>

<!-- Mají se číslovat kapitoly -->
<xsl:param name="chapter.autolabel" select="1"/>

</xsl:stylesheet>