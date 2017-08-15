/**
 *
 * Seètení faktury pomocí rozhraní DOM
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
  // hlavní program
  public static void main(String[] args)
  {
    try
    {
      // vytvoøení factory, která umí vytváøet nové DocumentBuildery
      DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

      // nastavení parametrù novì vytváøených DocumentBuilderù
      // dbf.setValidating(true);

      // vytvoøení DocumentBuilderu
      DocumentBuilder builder = dbf.newDocumentBuilder();

      // naètení dokumentu do pamìti
      Document doc = builder.parse("faktura.xml");

      // získání všech elemementù cena
      NodeList nl = doc.getElementsByTagName("cena");

      // prùchod uzly
      int n = nl.getLength();
      double suma = 0;
      double sumaDPH = 0;

      for (int i=0; i<n; i++)
      {
        Element node = (Element)nl.item(i);
        double sazbaDPH = Double.parseDouble(node.getAttribute("dph")) / 100;

        // obsah elementu mùže být ve více uzlech (rozdìlený napø. komentáøi)
        StringBuffer cena = new StringBuffer();
        NodeList inl = node.getChildNodes();
        int m = inl.getLength();
        for (int j=0; j<m; j++)
        {
          // zajímají nás jen textové uzly
          if (inl.item(j).getNodeType() == Node.TEXT_NODE)
            cena.append(inl.item(j).getNodeValue());
        }

        double castka = Double.parseDouble(cena.toString());
        suma += castka;
        sumaDPH += sazbaDPH * castka;
      }

      // výpis statistiky
      System.out.println("Celkem Kè:  " + suma);
      System.out.println("Celkem DPH: " + sumaDPH);
    }
    // zachycení výjimek
    catch (ParserConfigurationException e)
    {
      // Chyby vzniklé pøi nastavování vlastností parseru
      System.out.println(e.getMessage());
    }
    catch (SAXException e)
    {
      // Chyby vzniklé pøi parsování XML dokumentu
      System.out.println(e.getMessage());
    }
    catch (IOException e)
    {
      // Chyby vzniklé pøi ètení XML z nìjakého souboru nebo ze sítì
      System.out.println(e.getMessage());
    }
  }
}
