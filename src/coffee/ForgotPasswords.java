/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coffee;

import java.awt.Dimension;
import java.awt.Frame;
import java.awt.Toolkit;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

/**
 *
 * @author Anusha
 */
public class ForgotPasswords extends javax.swing.JFrame {
Connection conn;
    ResultSet rs;
    PreparedStatement pst;
    /**
     * Creates new form Login
     */
    public ForgotPasswords() {
         super("ForgotPassword");
        initComponents();
        conn = dbconnect.connectdb();
      //   FrameInit();
//         setExtendedState(JFrame.MAXIMIZED_HORIZ);
//         setVisible(true);
//         setResizable(false);
    }
//     private void FrameInit()
//    {
//        Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
//        this.setSize(dim);             ///This will let frame initialise in full screen
//    }
    
    public void Search(){
    String al=txtuname.getText();
    
    String sql="select * from forgotpassword where username='"+al+"'";
    try{
        pst=conn.prepareStatement(sql);
            rs=pst.executeQuery();
    if(rs.next()){
        txtname.setText(rs.getString(3));
        txtques.setToolTipText(rs.getString(4));
      
        rs.close();
        pst.close();
    }
    else{
        JOptionPane.showMessageDialog(null,"Incorrect Username");
    }
    }catch(Exception e){
        JOptionPane.showMessageDialog(null,e);
    }
}
    
    public void Retrive(){
        String a1=txtuname.getText();
        String a2=txtans.getText();
        String sql="select * from forgotpassword where answer='"+a2+"'";
        try{
            pst=conn.prepareStatement(sql);
            rs=pst.executeQuery();
            if(rs.next()){
                txtpass.setText(rs.getString(6));
            }
        }catch(Exception e){
            JOptionPane.showMessageDialog(null,e);
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

        btnsearch = new javax.swing.JButton();
        jPanel1 = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        txtuname = new javax.swing.JTextField();
        txtname = new javax.swing.JTextField();
        txtans = new javax.swing.JTextField();
        txtpass = new javax.swing.JTextField();
        txtques = new javax.swing.JComboBox<>();
        btnretrieve = new javax.swing.JButton();
        btnback = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setPreferredSize(new java.awt.Dimension(870, 782));
        getContentPane().setLayout(null);

        btnsearch.setFont(new java.awt.Font("Times New Roman", 1, 18)); // NOI18N
        btnsearch.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconandpictures/search.png"))); // NOI18N
        btnsearch.setText("SEARCH");
        btnsearch.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnsearchActionPerformed(evt);
            }
        });
        getContentPane().add(btnsearch);
        btnsearch.setBounds(660, 110, 150, 50);

        jPanel1.setLayout(null);

        jLabel3.setFont(new java.awt.Font("Times New Roman", 1, 20)); // NOI18N
        jLabel3.setText("Username");
        jPanel1.add(jLabel3);
        jLabel3.setBounds(80, 90, 90, 30);

        jLabel4.setFont(new java.awt.Font("Times New Roman", 1, 20)); // NOI18N
        jLabel4.setText("Name");
        jPanel1.add(jLabel4);
        jLabel4.setBounds(80, 160, 90, 30);

        jLabel5.setFont(new java.awt.Font("Times New Roman", 1, 20)); // NOI18N
        jLabel5.setText("Your Security Question");
        jPanel1.add(jLabel5);
        jLabel5.setBounds(80, 240, 210, 30);

        jLabel6.setFont(new java.awt.Font("Times New Roman", 1, 20)); // NOI18N
        jLabel6.setText("Answer");
        jPanel1.add(jLabel6);
        jLabel6.setBounds(80, 330, 90, 30);

        jLabel7.setFont(new java.awt.Font("Times New Roman", 1, 20)); // NOI18N
        jLabel7.setText("Password");
        jPanel1.add(jLabel7);
        jLabel7.setBounds(80, 400, 90, 30);

        jLabel8.setFont(new java.awt.Font("Comic Sans MS", 1, 30)); // NOI18N
        jLabel8.setForeground(new java.awt.Color(0, 153, 153));
        jLabel8.setText("FORGOT PASSWORD");
        jPanel1.add(jLabel8);
        jLabel8.setBounds(160, 10, 330, 40);

        txtuname.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txtuname.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtunameActionPerformed(evt);
            }
        });
        jPanel1.add(txtuname);
        txtuname.setBounds(310, 90, 200, 30);

        txtname.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txtname.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtnameActionPerformed(evt);
            }
        });
        jPanel1.add(txtname);
        txtname.setBounds(310, 160, 200, 30);

        txtans.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        jPanel1.add(txtans);
        txtans.setBounds(310, 320, 200, 30);

        txtpass.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        jPanel1.add(txtpass);
        txtpass.setBounds(310, 400, 200, 30);

        txtques.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txtques.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "What is your school name?", "What is your mother's name?", "What is your father's name?", "What is your pet name?" }));
        txtques.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtquesActionPerformed(evt);
            }
        });
        jPanel1.add(txtques);
        txtques.setBounds(310, 240, 200, 30);

        btnretrieve.setFont(new java.awt.Font("Times New Roman", 1, 20)); // NOI18N
        btnretrieve.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconandpictures/bag (1).png"))); // NOI18N
        btnretrieve.setText("Retrive");
        btnretrieve.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnretrieveActionPerformed(evt);
            }
        });
        jPanel1.add(btnretrieve);
        btnretrieve.setBounds(190, 490, 130, 40);

        btnback.setFont(new java.awt.Font("Times New Roman", 1, 20)); // NOI18N
        btnback.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconandpictures/back-arrow.png"))); // NOI18N
        btnback.setText("Back");
        btnback.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnbackActionPerformed(evt);
            }
        });
        jPanel1.add(btnback);
        btnback.setBounds(390, 490, 120, 40);

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconandpictures/white-hd-wallpaper-1920x1080.jpg"))); // NOI18N
        jLabel2.setText("jLabel2");
        jPanel1.add(jLabel2);
        jLabel2.setBounds(0, 0, 620, 580);

        getContentPane().add(jPanel1);
        jPanel1.setBounds(30, 40, 620, 580);

        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/iconandpictures/Background.png"))); // NOI18N
        jLabel1.setText("jLabel1");
        jLabel1.setToolTipText("");
        getContentPane().add(jLabel1);
        jLabel1.setBounds(-840, 0, 1710, 750);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void txtquesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtquesActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtquesActionPerformed

    private void txtnameActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtnameActionPerformed
         // TODO add your handling code here:
    }//GEN-LAST:event_txtnameActionPerformed

    private void txtunameActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtunameActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtunameActionPerformed

    private void btnbackActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnbackActionPerformed
        setVisible(false);
        Login ob=new Login();
        ob.setVisible(true);  // TODO add your handling code here:
    }//GEN-LAST:event_btnbackActionPerformed

    private void btnsearchActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnsearchActionPerformed
       Search(); // TODO add your handling code here:
    }//GEN-LAST:event_btnsearchActionPerformed

    private void btnretrieveActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnretrieveActionPerformed
       Retrive(); // TODO add your handling code here:
    }//GEN-LAST:event_btnretrieveActionPerformed

    /**
     * @param args the command line arguments
     */
//    public static void main(String args[]) {
//        /* Set the Nimbus look and feel */
//        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
//        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
//         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
//         */
//        try {
//            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
//                if ("Nimbus".equals(info.getName())) {
//                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
//                    break;
//                }
//            }
//        } catch (ClassNotFoundException ex) {
//            java.util.logging.Logger.getLogger(ForgotPasswords.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (InstantiationException ex) {
//            java.util.logging.Logger.getLogger(ForgotPasswords.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (IllegalAccessException ex) {
//            java.util.logging.Logger.getLogger(ForgotPasswords.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
//            java.util.logging.Logger.getLogger(ForgotPasswords.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        }
//        //</editor-fold>
//        //</editor-fold>
//        //</editor-fold>
//        //</editor-fold>
//
//        /* Create and display the form */
//        java.awt.EventQueue.invokeLater(new Runnable() {
//            public void run() {
//                new ForgotPasswords().setVisible(true);
//            }
//        });
//    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnback;
    private javax.swing.JButton btnretrieve;
    private javax.swing.JButton btnsearch;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JTextField txtans;
    private javax.swing.JTextField txtname;
    private javax.swing.JTextField txtpass;
    private javax.swing.JComboBox<String> txtques;
    private javax.swing.JTextField txtuname;
    // End of variables declaration//GEN-END:variables
}
