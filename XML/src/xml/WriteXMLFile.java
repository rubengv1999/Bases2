/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package xml;

/**
 *
 * @author ruben
 */
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringWriter;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class WriteXMLFile {

    public static String txtToXml(String path, String ID) {
        try {
            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
            Document doc = docBuilder.newDocument();
            Element rootElement = doc.createElement("People");
            doc.appendChild(rootElement);
            try {
                File f = new File(path + ".txt");
                BufferedReader b = new BufferedReader(new InputStreamReader(new FileInputStream(f), "utf-8"));
                int i = 0;
                String readLine = "";
                while ((readLine = b.readLine()) != null) {
                    i++;
                    if (i % 10000 == 0) {
                        System.out.println(i);
                    }
                    Element staff = doc.createElement("Person");
                    rootElement.appendChild(staff);
                    Attr attr = doc.createAttribute("Doc");
                    attr.setValue(readLine.substring(0, 9));
                    staff.setAttributeNode(attr);
                    attr = doc.createAttribute("Codelec");
                    attr.setValue(readLine.substring(10, 16));
                    staff.setAttributeNode(attr);
                    attr = doc.createAttribute("Sex");
                    attr.setValue(readLine.substring(17, 18));
                    staff.setAttributeNode(attr);
                    attr = doc.createAttribute("Date");
                    attr.setValue(readLine.substring(19, 27));
                    staff.setAttributeNode(attr);
//                    attr = doc.createAttribute("Junta");
//                    attr.setValue(readLine.substring(28, 33));
//                    staff.setAttributeNode(attr);
                    attr = doc.createAttribute("Name");
                    attr.setValue(readLine.substring(34, 64).replace("  ", ""));
                    staff.setAttributeNode(attr);
                    attr = doc.createAttribute("LastName1");
                    attr.setValue(readLine.substring(65, 91).replace(" ", ""));
                    staff.setAttributeNode(attr);
                    attr = doc.createAttribute("LastName2");
                    attr.setValue(readLine.substring(92).replace(" ", ""));
                    staff.setAttributeNode(attr);
                }
            } catch (IOException e) {
            }
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            DOMSource source = new DOMSource(doc);
            StreamResult result = new StreamResult(new File(path + ".xml"));
            transformer.transform(source, result);
            System.out.println("Listo");
            return ID;
        } catch (ParserConfigurationException | TransformerException pce) {
        }
        return "-1";
    }

    public static void txtToXmlCodelec(String path) {
        try {
            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
            Document doc = docBuilder.newDocument();
            Element rootElement = doc.createElement("codelecs");
            doc.appendChild(rootElement);
            try {
                File f = new File(path + ".txt");
                BufferedReader b = new BufferedReader(new InputStreamReader(new FileInputStream(f), "utf-8"));
//                int i = 0;
                String readLine = "";
                while ((readLine = b.readLine()) != null) {
//                    i++;
//                    if (i % 10000 == 0) {
//                        System.out.println(i);
//                    }
                    String[] parts = readLine.split(",");
                    Element staff = doc.createElement("Codelec");
                    rootElement.appendChild(staff);
                    Attr attr = doc.createAttribute("CodigoProvincia");
                    attr.setValue(readLine.substring(0, 1));
                    staff.setAttributeNode(attr);
                    attr = doc.createAttribute("CodigoCanton");
                    attr.setValue(readLine.substring(1, 3));
                    staff.setAttributeNode(attr);
                    attr = doc.createAttribute("CodigoDistrito");
                    attr.setValue(readLine.substring(3, 6));
                    staff.setAttributeNode(attr);
                    attr = doc.createAttribute("Provincia");
                    attr.setValue(parts[1]);
                    staff.setAttributeNode(attr);
                    attr = doc.createAttribute("Canton");
                    attr.setValue(parts[2]);
                    staff.setAttributeNode(attr);
                    attr = doc.createAttribute("Distrito");
                    attr.setValue(parts[3].replace("  ", ""));
                    staff.setAttributeNode(attr);
                }
            } catch (IOException e) {
            }
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            DOMSource source = new DOMSource(doc);
            StreamResult result = new StreamResult(new File(path + ".xml"));
            transformer.transform(source, result);
        } catch (ParserConfigurationException | TransformerException pce) {
        }
    }
}
