/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cmpnt;

import java.awt.Color;
import java.awt.Component;
import javax.swing.JButton;
import javax.swing.JTable;
import javax.swing.SwingConstants;
import javax.swing.table.AbstractTableModel;
import javax.swing.table.DefaultTableCellRenderer;

/**
 *
 * @author User
 */
public class MyTblModel1 extends DefaultTableCellRenderer {
    
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
       if(column==0){
                c.setForeground(Color.black);
                    c.setBackground(Color.lightGray);
                   // c=new JButton(value.toString());
                   // c.setEnabled(false);
            }
        else {
                 c.setForeground(Color.black);
                     c.setBackground(Color.WHITE);
        }  
        
    return c;
  }
    


    
}
