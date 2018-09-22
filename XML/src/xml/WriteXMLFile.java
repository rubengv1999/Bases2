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

    public static void main(String argv[]) throws IOException  {
        
        txtToXml("C:\\Users\\ruben\\Downloads\\padron_completo\\PADRON_COMPLETO.txt");
    }


    public static void txtToXml(String path) {
        try {
            DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
            Document doc = docBuilder.newDocument();
            Element rootElement = doc.createElement("personas");
            doc.appendChild(rootElement);
            try {
                File f = new File(path);
                BufferedReader b = new BufferedReader(new InputStreamReader(new FileInputStream(f), "ISO-8859-1"));
                int i = 0;
                    
                String readLine = "";
                
                while ((readLine = b.readLine()) != null) {
                    i++;
                    if (i % 100 == 0) {
                        System.out.println(i);
                    }

                    Element staff = doc.createElement("Persona");
                    rootElement.appendChild(staff);
                    Attr attr = doc.createAttribute("Cedula");
                    attr.setValue(readLine.substring(0, 9));
                    staff.setAttributeNode(attr);
                    attr = doc.createAttribute("Codelec");
                    attr.setValue(readLine.substring(10, 16));
                    staff.setAttributeNode(attr);
                    attr = doc.createAttribute("Sexo");
                    attr.setValue(readLine.substring(17, 18));
                    staff.setAttributeNode(attr);
                    attr = doc.createAttribute("FechaCaducidad");
                    attr.setValue(readLine.substring(19, 27));
                    staff.setAttributeNode(attr);
                    attr = doc.createAttribute("Junta");
                    attr.setValue(readLine.substring(28, 33));
                    staff.setAttributeNode(attr);
                    attr = doc.createAttribute("Nombre");
                    attr.setValue(readLine.substring(34, 64));
                    staff.setAttributeNode(attr);
                    attr = doc.createAttribute("Apellido1");
                    attr.setValue(readLine.substring(65, 91));
                    staff.setAttributeNode(attr);
                    attr = doc.createAttribute("Apellido2");
                    attr.setValue(readLine.substring(92));
                    staff.setAttributeNode(attr);
                }
            } catch (IOException e) {
            }

            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            DOMSource source = new DOMSource(doc);
            StreamResult result = new StreamResult(new File("C:\\Users\\ruben\\Downloads\\padron_completo\\file.xml"));
            transformer.transform(source, result);
        } catch (ParserConfigurationException | TransformerException pce) {
        }
    }
}
