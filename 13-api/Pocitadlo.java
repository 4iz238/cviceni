// na�ten� v�ech pot�ebn�ch knihoven
import java.io.*;
import org.xml.sax.*;
import org.xml.sax.helpers.*;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.parsers.SAXParser;

public class Pocitadlo
{
  // hlavn� program
  public static void main(String[] args)
  {
    // kontrola vstupn�ch parametr�
    if (args.length != 2)
    {
      System.out.println("�patn� po�et parametr�!\n");
      System.out.println("Syntaxe: java SAXPocitadlo <soubor> <n�zev elementu>\n");
      System.exit(1);
    }

    try
    {
      // vytvo�en� parseru
      SAXParserFactory spf = SAXParserFactory.newInstance();
      spf.setValidating(false);
      SAXParser sp = spf.newSAXParser();
      XMLReader parser = sp.getXMLReader();

      // vytvo�en� handleru
      PocitadloHandler handler = new PocitadloHandler(args[1]);

      // nastaven� handleru pro parser
      parser.setContentHandler(handler);
      parser.setErrorHandler(handler);

      // spu�t�n� parseru na soubor
      parser.parse(args[0]);

      // v�pis statistiky
      System.out.println("Po�et znak�: " + handler.getCharCount());
      System.out.println("Po�et element� '" + args[1] + "': " +
        handler.getElementCount());
    }
    // zachycen� v�jimek
    catch (SAXException e)
    {
      System.out.println(e.getMessage());
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
  }
}