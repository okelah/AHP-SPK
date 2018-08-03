/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cmpnt;

import conn.koneksi;
import java.awt.Color;
import java.awt.Component;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultCellEditor;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.table.AbstractTableModel;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.TableColumn;
import view.Config_Bobot_subkreteria;

/**
 *
 * @author User
 */
public class MyTblModelPenerima extends DefaultTableCellRenderer {
    koneksi conn= new koneksi();
            public Component getTableCellRendererComponent(JTable table,
                                                 Object value,
                                                 boolean isSelected,
                                                 boolean hasFocus,
                                                 int row,
                                                 int column) {
    Component c = 
      super.getTableCellRendererComponent(table, value,
                                          isSelected, hasFocus,
                                          row, column);
    
         try { 
             Object[] obj=new Object[20];
            ResultSet res = conn.ambilData("select Nama from tbl_sub_kriteria ");
        JComboBox jc=  new JComboBox();
        TableColumn tc=table.getColumnModel().getColumn(column);
             for (int i = 0; res.next(); i++) {
                 jc.addItem(res.getString(1)); 
             }
             {
           }
           tc.setCellEditor(new DefaultCellEditor(jc));
           obj[0]="Pilih";
            c=new JComboBox();
        } catch (SQLException ex) {
            Logger.getLogger(Config_Bobot_subkreteria.class.getName()).log(Level.SEVERE, null, ex);
        }
        c=new JTextField();
    return c;
  }
    


    
}
