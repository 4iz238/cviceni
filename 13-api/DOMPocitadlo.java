// naètení všech potøebných knihoven
import java.io.*;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.*;
import org.xml.sax.*;

public class DOMPocitadlo
{
  // hlavní program
  public static void main(String[] args)
  {
    // kontrola vstupních parametrù
    if (args.length != 2)
    {
      System.out.println("Špatný poèet parametrù!\n");
      System.out.println("Syntaxe: java ObsluhaChyb <soubor> <název elementu>\n");
      System.exit(1);
    }

    try
    {
      // vytvoøení DocumentBuilderu
      DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
      DocumentBuilder builder = dbf.newDocumentBuilder();

      // nastavení tøídy pro obsluhu chyb
      builder.setErrorHandler(new MyErrorHandler());

      // naètení dokumentu do pamìti
      Document doc = builder.parse(args[0]);

      System.out.println("Poèet elementù '" + args[1] + "' v dokumentu: " +
        doc.getDocumentElement().getElementsByTagName(args[1]).getLength());
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

  // tøída definující obsluhu chyb
  private static class MyErrorHandler implements ErrorHandler
  {

    // zformátování chybového hlášení
    private String getParseExceptionInfo(SAXParseException e)
    {
      return "URI: " + e.getSystemId() + "\n" +
             "Øádka: " + e.getLineNumber() + " Znak: " +
             e.getColumnNumber() + "\n" +
             e.getMessage();
    }

    // obsluha chyb v dokumentu
    public void error (SAXParseException e) throws SAXException
    {
      throw new SAXException("Chyba: " + getParseExceptionInfo(e));
    }

    // obsluha fatálních chyb v dokumentu
    public void fatalError (SAXParseException e) throws SAXException
    {
      throw new SAXException("Fatální chyba: " + getParseExceptionInfo(e));
    }

    // obsluha varovných hlášení od parseru
    public void warning (SAXParseException e)
    {
      System.out.println("Varování: " + getParseExceptionInfo(e));
    }
  }
}
