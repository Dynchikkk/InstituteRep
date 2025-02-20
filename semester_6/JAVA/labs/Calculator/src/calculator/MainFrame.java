package calculator;

import javax.swing.table.DefaultTableModel;

/**
 *
 * @author admin
 */
public class MainFrame extends javax.swing.JFrame {

    /**
     * Creates new form MainFrame
     */
    public MainFrame() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        DataTableScrollPanel = new javax.swing.JScrollPane();
        DataTable = new javax.swing.JTable();
        TopBorderLabel = new javax.swing.JLabel();
        BottomBorderLabel = new javax.swing.JLabel();
        StepWidthLabel = new javax.swing.JLabel();
        TopBorderTextField = new javax.swing.JTextField();
        BottomBorderTextField = new javax.swing.JTextField();
        StepWidthTextField = new javax.swing.JTextField();
        AddButton = new javax.swing.JButton();
        DeleteButton = new javax.swing.JButton();
        CalculateButton = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        DataTable.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Верхняя граница", "Нижняя граница", "Ширина шага", "Результат"
            }
        ));
        DataTableScrollPanel.setViewportView(DataTable);

        TopBorderLabel.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        TopBorderLabel.setText("Верхняя граница");
        TopBorderLabel.setName(""); // NOI18N

        BottomBorderLabel.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        BottomBorderLabel.setText("Ширина шага");

        StepWidthLabel.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        StepWidthLabel.setText("Нижняя границы");

        TopBorderTextField.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        BottomBorderTextField.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        StepWidthTextField.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        AddButton.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        AddButton.setText("Добавить");
        AddButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                AddButtonMouseClicked(evt);
            }
        });

        DeleteButton.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        DeleteButton.setText("Удалить");
        DeleteButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                DeleteButtonMouseClicked(evt);
            }
        });

        CalculateButton.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        CalculateButton.setText("Вычислить");
        CalculateButton.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                CalculateButtonMouseClicked(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(DataTableScrollPanel, javax.swing.GroupLayout.DEFAULT_SIZE, 640, Short.MAX_VALUE)
                .addContainerGap())
            .addGroup(layout.createSequentialGroup()
                .addGap(48, 48, 48)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(TopBorderLabel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(StepWidthLabel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(BottomBorderLabel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(StepWidthTextField)
                            .addComponent(BottomBorderTextField)))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(16, 16, 16)
                        .addComponent(TopBorderTextField)))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(CalculateButton, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(DeleteButton, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(AddButton, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(48, 48, 48))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(15, 15, 15)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(TopBorderLabel)
                    .addComponent(TopBorderTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(AddButton))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(StepWidthLabel)
                    .addComponent(BottomBorderTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(DeleteButton))
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(BottomBorderLabel)
                    .addComponent(StepWidthTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(CalculateButton))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(DataTableScrollPanel, javax.swing.GroupLayout.PREFERRED_SIZE, 122, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void AddButtonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_AddButtonMouseClicked
        // Check if all fields field
        String topBorderFieldText =  TopBorderTextField.getText();
        String bottomBordeFieldText =  BottomBorderTextField.getText();
        String stepWidthFieldText =  StepWidthTextField.getText();
        if (stringIsNullOrEmpty(topBorderFieldText) || 
            stringIsNullOrEmpty(bottomBordeFieldText) ||
            stringIsNullOrEmpty(stepWidthFieldText)) {
            return;
        }
        // Try to convert
        double topBorder;
        double bottomBorder;
        double stepWidth;
        try {
            topBorder = Double.parseDouble(topBorderFieldText);
            bottomBorder = Double.parseDouble(bottomBordeFieldText);
            stepWidth = Double.parseDouble(stepWidthFieldText);
        } catch (NumberFormatException e) {
            return;
        }
        // Step must be greater then zero
        if (stepWidth <= 0) {
            return;
        }
        // Add data to table
        ((DefaultTableModel)DataTable.getModel())
                .addRow(new Double[]{topBorder, bottomBorder, stepWidth});
    }//GEN-LAST:event_AddButtonMouseClicked

    private void DeleteButtonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_DeleteButtonMouseClicked
        // Check if row selected
        int selectedRow = DataTable.getSelectedRow();
        if (selectedRow < 0) {
            return;
        }
        // Remove row
        ((DefaultTableModel)DataTable.getModel()).removeRow(selectedRow);
    }//GEN-LAST:event_DeleteButtonMouseClicked

    private void CalculateButtonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_CalculateButtonMouseClicked
        // Check if row selected
        int selectedRow = DataTable.getSelectedRow();
        if (selectedRow < 0) {
            return;
        }
        // Check if selected row not empty
        DefaultTableModel model = (DefaultTableModel) DataTable.getModel(); 
        String topBorderText =  model.getValueAt(selectedRow, 0).toString();
        String bottomBordeText = model.getValueAt(selectedRow, 1).toString();
        String stepWidthText =  model.getValueAt(selectedRow, 2).toString();
        if (stringIsNullOrEmpty(topBorderText) || 
            stringIsNullOrEmpty(bottomBordeText) ||
            stringIsNullOrEmpty(stepWidthText)) {
            return;
        }
        // Try to convert
        double topBorder;
        double bottomBorder;
        double stepWidth;
        try {
            topBorder = Double.parseDouble(topBorderText);
            bottomBorder = Double.parseDouble(bottomBordeText);
            stepWidth = Double.parseDouble(stepWidthText);
        } catch (NumberFormatException e) {
            return;
        }
        // Calculate result
        double result = calculateFunction(topBorder, bottomBorder, stepWidth);
        // Set result to table
        model.setValueAt(result, selectedRow, 3);
    }//GEN-LAST:event_CalculateButtonMouseClicked
         
    private double calculateFunction(double topBorder, double bottomBorder, double stepWidth) {
        // Ensure that the step width is positive
        if (stepWidth <= 0) {
            throw new IllegalArgumentException("Step width must be positive");
        }

        double sign = 1.0;
        // If the top border is less than the bottom border, swap them and invert the sign of the result
        if (topBorder < bottomBorder) {
            double temp = topBorder;
            topBorder = bottomBorder;
            bottomBorder = temp;
            sign = -1.0;
        }

        double sum = 0.0;
        // Integrate using the trapezoidal rule
        for (double x = bottomBorder; x < topBorder; x += stepWidth) {
            double nextX = Math.min(x + stepWidth, topBorder);
            // Calculate the area of the trapezoid between x and nextX
            double area = (nextX - x) * (Math.exp(-x) + Math.exp(-nextX)) / 2.0;
            sum += area;
        }
        return sign * sum;
    }

    
    private boolean stringIsNullOrEmpty(String str) {
         return str == null || str.trim().isEmpty();
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton AddButton;
    private javax.swing.JLabel BottomBorderLabel;
    private javax.swing.JTextField BottomBorderTextField;
    private javax.swing.JButton CalculateButton;
    private javax.swing.JTable DataTable;
    private javax.swing.JScrollPane DataTableScrollPanel;
    private javax.swing.JButton DeleteButton;
    private javax.swing.JLabel StepWidthLabel;
    private javax.swing.JTextField StepWidthTextField;
    private javax.swing.JLabel TopBorderLabel;
    private javax.swing.JTextField TopBorderTextField;
    // End of variables declaration//GEN-END:variables
}
