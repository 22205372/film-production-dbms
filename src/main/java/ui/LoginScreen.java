package ui;

import javax.swing.*;
import java.awt.*;

public class LoginScreen extends JFrame {

    public LoginScreen() {

        setTitle("Login");
        setSize(300, 200);
        setLayout(new GridLayout(3,2));

        JTextField username = new JTextField();
        JPasswordField password = new JPasswordField();
        JButton loginBtn = new JButton("Login");

        add(new JLabel("Username"));
        add(username);
        add(new JLabel("Password"));
        add(password);
        add(loginBtn);

        loginBtn.addActionListener(e -> {
            new Dashboard();
            dispose();
        });

        setVisible(true);
    }
}