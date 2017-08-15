// nezbytn� knihovny
import org.xml.sax.*;
import org.xml.sax.helpers.*;

// vlastn� handler, je odvozen od DefaultHandleru,
// kter� obsahuje pr�zdn� definice v�ech pot�ebn�ch metod
public class PocitadloHandler extends DefaultHandler
{
  // ��ta�e pro element a znaky
  int elementCount = 0;
  int charCount = 0;
  // pomocn� prom�nn� pro n�zev po��tan�ho elementu
  String elementName;

  // konstruktor
  public PocitadloHandler(String element)
  {
    // ulo�en� n�zvu elementu, kter� budeme po��tat
    elementName = element;
  }

  // funkce vrac� po�et znak� v dokumentu
  public int getCharCount()
  {
    return charCount;
  }

  // funkce vrac� po�et element� zadan�ho jm�na
  public int getElementCount()
  {
    return elementCount;
  }

  // obsluha znakov�ch dat
  public void characters(char[] ch, int start, int length)
  {
    // zv�t�en� ��ta�e
    charCount += length;
  }

  // obsluha za��tku elementu
  public void startElement(String namespaceURI, String localName,
                           String qName, Attributes atts)
  {
    // pokud parser narazil na hledan� element, je zapo��t�n
    if (elementName.equals(qName)) elementCount++;
  }

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