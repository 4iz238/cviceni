// naètení všech potøebných knihoven
import java.io.*;
import org.xml.sax.*;
import org.xml.sax.helpers.*;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.parsers.SAXParser;

public class Pocitadlo
{
  // hlavní program
  public static void main(String[] args)
  {
    // kontrola vstupních parametrù
    if (args.length != 2)
    {
      System.out.println("Špatný poèet parametrù!\n");
      System.out.println("Syntaxe: java SAXPocitadlo <soubor> <název elementu>\n");
      System.exit(1);
    }

    try
    {
      // vytvoøení parseru
      SAXParserFactory spf = SAXParserFactory.newInstance();
      spf.setValidating(false);
      SAXParser sp = spf.newSAXParser();
      XMLReader parser = sp.getXMLReader();

      // vytvoøení handleru
      PocitadloHandler handler = new PocitadloHandler(args[1]);

      // nastavení handleru pro parser
      parser.setContentHandler(handler);
      parser.setErrorHandler(handler);

      // spuštìní parseru na soubor
      parser.parse(args[0]);

      // výpis statistiky
      System.out.println("Poèet znakù: " + handler.getCharCount());
      System.out.println("Poèet elementù '" + args[1] + "': " +
        handler.getElementCount());
    }
    // zachycení výjimek
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