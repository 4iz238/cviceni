<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/html/chunk.xsl"/>
<xsl:include href="html-common.xsl"/>

<!-- Kódování výstupních HTML stránek -->
<xsl:param name="chunker.output.encoding" select="'utf-8'"/>
<xsl:param name="saxon.character.representation" select="'native'"/>

<!-- Přípona pro generované soubory -->
<xsl:param name="html.ext" select="'.html'"/>

<!-- Název hlavního souboru -->
<xsl:param name="root.filename" select="'index'"/>

<!-- Adresář, kam se mají ukládat vygenerované stránky -->
<xsl:param name="base.dir" select="''"/>

<!-- Do jaké hloubky se mají vytvářet chunky pro sekce 
     (0 = chunky se vytvářejí pouze na úrovni kapitol) -->
<xsl:param name="chunk.section.depth" select="1"/>

<!-- Má první sekce kapitoly tvořit samostatný chunk -->
<xsl:param name="chunk.first.sections" select="'0'"/>
							
</xsl:stylesheet>