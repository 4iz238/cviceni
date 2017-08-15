/**
 *
 * Se�ten� faktury pomoc� rozhran� DOM
 *
 * */

import java.io.*;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.*;
import org.xml.sax.*;

public class DOMFaktura
{
  // hlavn� program
  public static void main(String[] args)
  {
    try
    {
      // vytvo�en� factory, kter� um� vytv��et nov� DocumentBuildery
      DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

      // nastaven� parametr� nov� vytv��en�ch DocumentBuilder�
      // dbf.setValidating(true);

      // vytvo�en� DocumentBuilderu
      DocumentBuilder builder = dbf.newDocumentBuilder();

      // na�ten� dokumentu do pam�ti
      Document doc = builder.parse("faktura.xml");

      // z�sk�n� v�ech elemement� cena
      NodeList nl = doc.getElementsByTagName("cena");

      // pr�chod uzly
      int n = nl.getLength();
      double suma = 0;
      double sumaDPH = 0;

      for (int i=0; i<n; i++)
      {
        Element node = (Element)nl.item(i);
        double sazbaDPH = Double.parseDouble(node.getAttribute("dph")) / 100;

        // obsah elementu m��e b�t ve v�ce uzlech (rozd�len� nap�. koment��i)
        StringBuffer cena = new StringBuffer();
        NodeList inl = node.getChildNodes();
        int m = inl.getLength();
        for (int j=0; j<m; j++)
        {
          // zaj�maj� n�s jen textov� uzly
          if (inl.item(j).getNodeType() == Node.TEXT_NODE)
            cena.append(inl.item(j).getNodeValue());
        }

        double castka = Double.parseDouble(cena.toString());
        suma += castka;
        sumaDPH += sazbaDPH * castka;
      }

      // v�pis statistiky
      System.out.println("Celkem K�:  " + suma);
      System.out.println("Celkem DPH: " + sumaDPH);
    }
    // zachycen� v�jimek
    catch (ParserConfigurationException e)
    {
      // Chyby vznikl� p�i nastavov�n� vlastnost� parseru
      System.out.println(e.getMessage());
    }
    catch (SAXException e)
    {
      // Chyby vznikl� p�i parsov�n� XML dokumentu
      System.out.println(e.getMessage());
    }
    catch (IOException e)
    {
      // Chyby vznikl� p�i �ten� XML z n�jak�ho souboru nebo ze s�t�
      System.out.println(e.getMessage());
    }
  }
}
