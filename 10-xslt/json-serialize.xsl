<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  version="3.0">
  
  <xsl:template name="xsl:initial-template">
    <xsl:result-document href="test.json" method="json" indent="yes">
      <xsl:sequence select="
        map {
          'id': '123',
          'tags': array { 'people', 'landscape' },
          'iso': 400,
          'camera': map {
            'manufacturer': 'Nikon',
            'type': 'D80'
          }
        }
        "/>      
    </xsl:result-document>
  </xsl:template>
  
</xsl:stylesheet>