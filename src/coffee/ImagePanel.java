/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package coffee;

import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Image;
import javax.swing.ImageIcon;

/**
 *
 * @author abhinav
 */
public class ImagePanel extends javax.swing.JPanel {

    private Image BackGroundimage;

    public ImagePanel() {

    }

    public Image getImage() {
        return BackGroundimage;
    }

    public void setImage(Image image, int Width, int Height) {
        this.BackGroundimage = image;
        Dimension size = new Dimension(Width, Height);
        this.setPreferredSize(size);
        this.setMinimumSize(size);
        this.setMaximumSize(size);
        this.setSize(size);
        this.setOpaque(false);
    }

    @Override
    public void paintComponent(Graphics g) {
        if (this.BackGroundimage != null) {
            g.drawImage(BackGroundimage, 0, 0, this.getWidth(), this.getHeight(), null);
        }
    }

    void setIcon(ImageIcon i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}