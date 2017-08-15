// na�ten� v�ech pot�ebn�ch knihoven
import java.io.*;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.*;
import org.xml.sax.*;

public class DOMPocitadlo
{
  // hlavn� program
  public static void main(String[] args)
  {
    // kontrola vstupn�ch parametr�
    if (args.length != 2)
    {
      System.out.println("�patn� po�et parametr�!\n");
      System.out.println("Syntaxe: java ObsluhaChyb <soubor> <n�zev elementu>\n");
      System.exit(1);
    }

    try
    {
      // vytvo�en� DocumentBuilderu
      DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
      DocumentBuilder builder = dbf.newDocumentBuilder();

      // nastaven� t��dy pro obsluhu chyb
      builder.setErrorHandler(new MyErrorHandler());

      // na�ten� dokumentu do pam�ti
      Document doc = builder.parse(args[0]);

      System.out.println("Po�et element� '" + args[1] + "' v dokumentu: " +
        doc.getDocumentElement().getElementsByTagName(args[1]).getLength());
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

  // t��da definuj�c� obsluhu chyb
  private static class MyErrorHandler implements ErrorHandler
  {

    // zform�tov�n� chybov�ho hl�en�
    private String getParseExceptionInfo(SAXParseException e)
    {
      return "URI: " + e.getSystemId() + "\n" +
             "��dka: " + e.getLineNumber() + " Znak: " +
             e.getColumnNumber() + "\n" +
             e.getMessage();
    }

    // obsluha chyb v dokumentu
    public void error (SAXParseException e) throws SAXException
    {
      throw new SAXException("Chyba: " + getParseExceptionInfo(e));
    }

    // obsluha fat�ln�ch chyb v dokumentu
    public void fatalError (SAXParseException e) throws SAXException
    {
      throw new SAXException("Fat�ln� chyba: " + getParseExceptionInfo(e));
    }

    // obsluha varovn�ch hl�en� od parseru
    public void warning (SAXParseException e)
    {
      System.out.println("Varov�n�: " + getParseExceptionInfo(e));
    }
  }
}
