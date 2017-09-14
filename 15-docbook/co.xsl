<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"
		xmlns:saxon="http://icl.com/saxon"
                extension-element-prefixes="saxon">

<!-- Ukázka obousměrných odkazů pro callouts -->

<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/html/docbook.xsl"/>

<!-- Úpravy parametrů -->

<!-- Změna výstupního kódování -->
<xsl:output method="html" encoding="iso-8859-2" 
                          saxon:character-representation="native"/>

<!-- Mají se používat rozšíření -->
<xsl:param name="use.extensions" select="1"/>

<xsl:template match="co" name="co">
  <!-- Support a single linkend in HTML -->
  <xsl:variable name="targets" select="key('id', @linkends)"/>
  <xsl:variable name="target" select="$targets[1]"/>
  <xsl:choose>
    <xsl:when test="$target">
      <a>
        <xsl:if test="@id">
          <xsl:attribute name="name">
            <xsl:value-of select="@id"/>
          </xsl:attribute>
        </xsl:if>
        <xsl:attribute name="href">
          <xsl:call-template name="href.target">
            <xsl:with-param name="object" select="$target"/>
          </xsl:call-template>
        </xsl:attribute>
        <xsl:apply-templates select="." mode="callout-bug"/>
      </a>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="anchor"/>
      <a>
        <xsl:attribute name="href">
          <xsl:call-template name="href.target">
            <xsl:with-param name="object" select="key('callouts', @id)"/>
          </xsl:call-template>
        </xsl:attribute>
        <xsl:apply-templates select="." mode="callout-bug"/>
      </a>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:key name="callouts" match="callout" use="@arearefs"/>

<xsl:template match="callout">
  <xsl:choose>
    <xsl:when test="$callout.list.table != 0">
      <tr>
        <xsl:call-template name="tr.attributes">
          <xsl:with-param name="rownum">
            <xsl:number from="calloutlist" count="callout"/>
          </xsl:with-param>
        </xsl:call-template>

        <td width="5%" valign="top" align="left">
          <xsl:call-template name="anchor">
            <xsl:with-param name="conditional" select="0"/>
          </xsl:call-template>
          <xsl:call-template name="callout.arearefs">
            <xsl:with-param name="arearefs" select="@arearefs"/>
          </xsl:call-template>
        </td>
        <td valign="top" align="left">
          <xsl:apply-templates/>
        </td>
      </tr>
    </xsl:when>
    <xsl:otherwise>
      <dt>
        <xsl:call-template name="anchor">
          <xsl:with-param name="conditional" select="0"/>
        </xsl:call-template>
        <xsl:call-template name="callout.arearefs">
          <xsl:with-param name="arearefs" select="@arearefs"/>
        </xsl:call-template>
      </dt>
      <dd><xsl:apply-templates/></dd>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>