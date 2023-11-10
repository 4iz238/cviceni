<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  version="3.0">
  
  <xsl:output method="text"/>
  
  <xsl:template name="xsl:initial-template">
    <xsl:variable name="json" 
                  select="json-doc('https://api.open-meteo.com/v1/forecast?latitude=50.7360066&amp;longitude=15.7396608&amp;current=temperature_2m')"/>
    
    <xsl:text>Aktuální teplota na Sněžce: </xsl:text>
    <xsl:value-of select="$json?current?temperature_2m"/>
    <xsl:value-of select="$json?current_units?temperature_2m"/>
    
    <!-- 
      Zápis je velmi podoný JS:
      $json.current.temperature_2m
      
      JSON je mapován na pole a mapy v XDM, viz https://www.w3.org/TR/xpath-31/#id-maps-and-arrays
    -->    
  </xsl:template>
  
</xsl:stylesheet>