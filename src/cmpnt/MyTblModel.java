/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cmpnt;

import java.awt.Color;
import java.awt.Component;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.table.AbstractTableModel;
import javax.swing.table.DefaultTableCellRenderer;

/**
 *
 * @author User
 */
public class MyTblModel extends DefaultTableCellRenderer {
    /**
     *
     * @param table
     * @param value
     * @param isSelected
     * @param hasFocus
     * @param row
     * @param column
     * @return
     */
    @Override
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
    
        c=new JTextField(""+value);
        table.setRowHeight(25);
        if (column<=row+1&&column>=row+1&& column!=0){
                c.setForeground(Color.red);
                 c.setBackground(Color.BLACK);
            } 
        else if(column<=row+1 && column!=0){
            c.setForeground(Color.GREEN);
                 c.setBackground(Color.BLACK);
        }
     
        else if(column==0){
                c.setForeground(Color.black);
                    c.setBackground(Color.lightGray);
              }
        else {
                 c.setForeground(Color.black);
                     c.setBackground(Color.WHITE);
        }  
    return c;
  }
    


    
}
