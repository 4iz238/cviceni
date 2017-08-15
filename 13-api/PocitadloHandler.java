// nezbytné knihovny
import org.xml.sax.*;
import org.xml.sax.helpers.*;

// vlastní handler, je odvozen od DefaultHandleru,
// který obsahuje prázdné definice všech potøebných metod
public class PocitadloHandler extends DefaultHandler
{
  // èítaèe pro element a znaky
  int elementCount = 0;
  int charCount = 0;
  // pomocná promìnná pro název poèítaného elementu
  String elementName;

  // konstruktor
  public PocitadloHandler(String element)
  {
    // uložení názvu elementu, který budeme poèítat
    elementName = element;
  }

  // funkce vrací poèet znakù v dokumentu
  public int getCharCount()
  {
    return charCount;
  }

  // funkce vrací poèet elementù zadaného jména
  public int getElementCount()
  {
    return elementCount;
  }

  // obsluha znakových dat
  public void characters(char[] ch, int start, int length)
  {
    // zvìtšení èítaèe
    charCount += length;
  }

  // obsluha zaèátku elementu
  public void startElement(String namespaceURI, String localName,
                           String qName, Attributes atts)
  {
    // pokud parser narazil na hledaný element, je zapoèítán
    if (elementName.equals(qName)) elementCount++;
  }

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