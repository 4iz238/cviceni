<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="PLAY">
        <h1>Seznam dějství</h1>
        <ol>
            <xsl:apply-templates select="ACT" mode="toc"/>
        </ol>
        
        <h1>Text hry</h1>
        
        <xsl:apply-templates select="ACT"/>
    </xsl:template>

    <xsl:template match="ACT" mode="toc">
        <xsl:apply-templates select="TITLE" mode="toc"/>
    </xsl:template>

    <xsl:template match="TITLE" mode="toc">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>

    <xsl:template match="ACT">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="ACT/TITLE">
        <h2><xsl:apply-templates/></h2>
    </xsl:template>

    <xsl:template match="SCENE/TITLE">
        <h3><xsl:apply-templates/></h3>
    </xsl:template>    

    <xsl:template match="LINE">
        <p>
            <xsl:value-of select="."/>
        </p>
    </xsl:template>
    
    <xsl:template match="STAGEDIR"/> 

</xsl:stylesheet>
