<?xml version="1.0" encoding="utf-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <pattern>
    <title>Seznam zaměstnanců je neprázdný a máme na výplaty</title>
    <rule context="zamestnanci">
      <assert test="zamestnanec">V seznamu musí být alespoň
        jeden zaměstnanec</assert>
      <report test="sum(zamestnanec/plat) &gt; 500000">Součet platů nemůže
        být větší než 500.000,-</report>
    </rule>
  </pattern>
  <pattern>
    <title>Podmínky pro zaměstnance</title>
    <rule context="zamestnanec">
      <assert test="jmeno">U zaměstnance musí být zadáno jméno.</assert>
      <assert test="prijmeni">U zaměstnance musí být zadáno příjmení.</assert>
      <assert test="email">U zaměstnance musí být zadán e-mail.</assert>
      <assert test="narozen">U zaměstnance musí být zadáno datum narození.</assert>
      <assert test="@id">U zaměstnance musí být zadáno jeho osobní číslo.</assert>
      <report test="jmeno[2]|prijmeni[2]">Zaměstnanec nemůže mít více 
        než jedno jméno.</report>
    </rule>
  </pattern>
  <pattern>
    <title>Duplicita osobních čísel</title>
    <rule context="zamestnanec">
      <report test="count(../zamestnanec[@id = current()/@id]) &gt; 1">Duplicitní osobní číslo
          <value-of select="@id"/> u elementu <name/>.</report>
    </rule>
  </pattern>
</schema>
