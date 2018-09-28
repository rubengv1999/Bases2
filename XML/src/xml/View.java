/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package xml;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;
import org.xml.sax.SAXException;
import static xml.WriteXMLFile.txtToXml;

/**
 *
 * @author ruben
 */
public class View extends javax.swing.JFrame {

    public ArrayList<ArrayList> provincias;
    public ArrayList<ArrayList> cantones;

    /**
     * Creates new form View
     *
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     * @throws javax.xml.transform.TransformerException
     * @throws javax.xml.parsers.ParserConfigurationException
     * @throws org.xml.sax.SAXException
     * @throws java.io.IOException
     */
    public View() throws ClassNotFoundException, SQLException, TransformerException, ParserConfigurationException, SAXException, IOException {
        initComponents();
        buttonGroup1.add(radioTodo);
        buttonGroup1.add(radioProvincia);
        buttonGroup1.add(radioCanton);
        comboBoxProvincia.removeAllItems();
        sqlProvincia();
        provincias.forEach((provincia) -> {
            comboBoxProvincia.addItem((String) provincia.get(1));
        });
        comboBoxProvincia.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                int index = comboBoxProvincia.getSelectedIndex();
                String ID = (String) provincias.get(index).get(0);
                try {
                    sqlCantones(ID);
                } catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(View.class.getName()).log(Level.SEVERE, null, ex);
                }
                comboCanton.removeAllItems();
                cantones.forEach((canton) -> {
                    comboCanton.addItem((String) canton.get(1));
                });

            }
        });
        sqlProvincia();
    }

    public void sqlInsertPeople(String xml) throws ClassNotFoundException, SQLException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection con = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-DEO1EC6\\SQLRUBEN;dataBase=Padron;integratedSecurity=true");
        CallableStatement proc_stmt = con.prepareCall("{  call dbo.insertXMLPeople(?) }");
        proc_stmt.setString(1, xml);
        proc_stmt.execute();
        System.out.println("Está en la base");
    }
    
    public void sqlInsertPeopleCanton(int IDProvincia, int IDCanton) throws ClassNotFoundException, SQLException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection con = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-DEO1EC6\\SQLRUBEN;dataBase=Padron;integratedSecurity=true");
        CallableStatement proc_stmt = con.prepareCall("{  call insertXMLPeopleCanton(?,?) }");
        proc_stmt.setInt(1, IDProvincia);
        proc_stmt.setInt(2, IDCanton);
        proc_stmt.execute();
        System.out.println("Está en la base");
    }

    public void sqlProvincia() throws ClassNotFoundException, SQLException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection con = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-DEO1EC6\\SQLRUBEN;dataBase=Padron;integratedSecurity=true");

        PreparedStatement proc_stmt = con.prepareCall("{  call getProvincias }");

        ResultSet m_ResultSet = proc_stmt.executeQuery();
        provincias = new ArrayList<>();
        while (m_ResultSet.next()) {
            ArrayList provincia = new ArrayList();
            provincia.add(m_ResultSet.getString(1));
            provincia.add(m_ResultSet.getString(2));
            provincias.add(provincia);
        }
    }

    public void sqlCantones(String ID) throws ClassNotFoundException, SQLException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection con = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-DEO1EC6\\SQLRUBEN;dataBase=Padron;integratedSecurity=true");

        PreparedStatement proc_stmt = con.prepareCall("{  call getCantones(?) }");
        proc_stmt.setString(1, ID);
        ResultSet m_ResultSet = proc_stmt.executeQuery();
        cantones = new ArrayList<>();
        while (m_ResultSet.next()) {
            ArrayList provincia = new ArrayList();
            provincia.add(m_ResultSet.getString(1));
            provincia.add(m_ResultSet.getString(2));
            cantones.add(provincia);
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        buttonGroup1 = new javax.swing.ButtonGroup();
        jPanel1 = new javax.swing.JPanel();
        radioTodo = new javax.swing.JRadioButton();
        radioProvincia = new javax.swing.JRadioButton();
        radioCanton = new javax.swing.JRadioButton();
        buttonOk = new javax.swing.JButton();
        jPanel2 = new javax.swing.JPanel();
        comboBoxProvincia = new javax.swing.JComboBox<>();
        jLabel1 = new javax.swing.JLabel();
        jPanel3 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        comboCanton = new javax.swing.JComboBox<>();
        jLabel3 = new javax.swing.JLabel();
        jComboBox1 = new javax.swing.JComboBox<>();
        jLabel4 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        radioTodo.setText("Todo");

        radioProvincia.setText("Provincia");

        radioCanton.setText("Canton");

        buttonOk.setBackground(javax.swing.UIManager.getDefaults().getColor("EditorPane.selectionBackground"));
        buttonOk.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        buttonOk.setForeground(javax.swing.UIManager.getDefaults().getColor("EditorPane.selectionBackground"));
        buttonOk.setText("Añadir");
        buttonOk.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                buttonOkActionPerformed(evt);
            }
        });

        jLabel1.setText("Provincia:");

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(comboBoxProvincia, 0, 155, Short.MAX_VALUE)
                .addContainerGap())
            .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(jPanel2Layout.createSequentialGroup()
                    .addGap(57, 57, 57)
                    .addComponent(jLabel1)
                    .addContainerGap(71, Short.MAX_VALUE)))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel2Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(comboBoxProvincia, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(50, 50, 50))
            .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(jPanel2Layout.createSequentialGroup()
                    .addGap(30, 30, 30)
                    .addComponent(jLabel1)
                    .addContainerGap(78, Short.MAX_VALUE)))
        );

        jLabel2.setText("Canton:");

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(comboCanton, 0, 145, Short.MAX_VALUE)
                .addContainerGap())
            .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(jPanel3Layout.createSequentialGroup()
                    .addGap(57, 57, 57)
                    .addComponent(jLabel2)
                    .addContainerGap(51, Short.MAX_VALUE)))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGap(51, 51, 51)
                .addComponent(comboCanton, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(51, Short.MAX_VALUE))
            .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addGroup(jPanel3Layout.createSequentialGroup()
                    .addGap(30, 30, 30)
                    .addComponent(jLabel2)
                    .addContainerGap(78, Short.MAX_VALUE)))
        );

        jLabel3.setFont(new java.awt.Font("Tahoma", 0, 24)); // NOI18N
        jLabel3.setText("Sistema de Padrón Electoral");

        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SQL Server", "Oracle" }));

        jLabel4.setText("Motor:");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                        .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(23, 23, 23))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                        .addComponent(jLabel3)
                        .addGap(37, 37, 37))))
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(76, 76, 76)
                        .addComponent(radioTodo)
                        .addGap(18, 18, 18)
                        .addComponent(radioProvincia)
                        .addGap(18, 18, 18)
                        .addComponent(radioCanton))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(124, 124, 124)
                        .addComponent(jLabel4)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(143, 143, 143)
                        .addComponent(buttonOk, javax.swing.GroupLayout.PREFERRED_SIZE, 88, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(0, 0, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel3)
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 25, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(radioTodo)
                    .addComponent(radioProvincia)
                    .addComponent(radioCanton))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(buttonOk, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(16, 16, 16))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void buttonOkActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_buttonOkActionPerformed
        // TODO add your handling code here:
        if (radioTodo.isSelected()) {
            try {
                sqlInsertPeople(txtToXml("C:\\Users\\ruben\\Desktop\\Provincias\\CO", "7"));
                sqlInsertPeople(txtToXml("C:\\Users\\ruben\\Desktop\\Provincias\\LI", "6"));
                sqlInsertPeople(txtToXml("C:\\Users\\ruben\\Desktop\\Provincias\\PU", "5"));
                sqlInsertPeople(txtToXml("C:\\Users\\ruben\\Desktop\\Provincias\\GU", "4"));
                sqlInsertPeople(txtToXml("C:\\Users\\ruben\\Desktop\\Provincias\\HE", "3"));
                sqlInsertPeople(txtToXml("C:\\Users\\ruben\\Desktop\\Provincias\\CA", "2"));
                sqlInsertPeople(txtToXml("C:\\Users\\ruben\\Desktop\\Provincias\\AL", "1"));
                sqlInsertPeople(txtToXml("C:\\Users\\ruben\\Desktop\\Provincias\\SJ", "0"));
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(View.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (radioProvincia.isSelected()) {
            try {
                int IDProvincia = comboBoxProvincia.getSelectedIndex();
                switch (IDProvincia) {
                    case 0:
                        sqlInsertPeople(txtToXml("C:\\Users\\ruben\\Desktop\\Provincias\\SJ", "0"));
                        break;
                    case 1:
                        sqlInsertPeople(txtToXml("C:\\Users\\ruben\\Desktop\\Provincias\\AL", "1"));
                        break;
                    case 2:
                        sqlInsertPeople(txtToXml("C:\\Users\\ruben\\Desktop\\Provincias\\CA", "2"));
                        break;
                    case 3:
                        sqlInsertPeople(txtToXml("C:\\Users\\ruben\\Desktop\\Provincias\\HE", "3"));
                        break;
                    case 4:
                        sqlInsertPeople(txtToXml("C:\\Users\\ruben\\Desktop\\Provincias\\GU", "4"));
                        break;
                    case 5:
                        sqlInsertPeople(txtToXml("C:\\Users\\ruben\\Desktop\\Provincias\\PU", "5"));
                        break;
                    case 6:
                        sqlInsertPeople(txtToXml("C:\\Users\\ruben\\Desktop\\Provincias\\LI", "6"));
                        break;
                    case 7:
                        sqlInsertPeople(txtToXml("C:\\Users\\ruben\\Desktop\\Provincias\\CO", "7"));
                        break;
                }
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(View.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (radioCanton.isSelected()) {
            int IDProvincia = comboBoxProvincia.getSelectedIndex();
            String IDP = (String) provincias.get(IDProvincia).get(0);
            int index = comboCanton.getSelectedIndex();
            String ID = (String) cantones.get(index).get(0);
            try {
                System.out.println(IDP+"  "+ID);
                sqlInsertPeopleCanton( Integer.parseInt(IDP), Integer.parseInt(ID));
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(View.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }//GEN-LAST:event_buttonOkActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(View.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(View.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(View.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(View.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(() -> {
            try {
                new View().setVisible(true);
            } catch (ClassNotFoundException | SQLException | TransformerException | ParserConfigurationException | SAXException | IOException ex) {
                Logger.getLogger(View.class.getName()).log(Level.SEVERE, null, ex);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.ButtonGroup buttonGroup1;
    private javax.swing.JButton buttonOk;
    private javax.swing.JComboBox<String> comboBoxProvincia;
    private javax.swing.JComboBox<String> comboCanton;
    private javax.swing.JComboBox<String> jComboBox1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JRadioButton radioCanton;
    private javax.swing.JRadioButton radioProvincia;
    private javax.swing.JRadioButton radioTodo;
    // End of variables declaration//GEN-END:variables
}
