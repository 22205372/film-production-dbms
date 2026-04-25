package ui;

import db.DBConnection;

import javax.swing.*;
import java.awt.*;
import java.sql.*;

public class ActorScreen extends JFrame {

    JTextField idField = new JTextField();
    JTextField nameField = new JTextField();
    JTextArea display = new JTextArea();

    public ActorScreen() {

        setTitle("Actor Management");
        setSize(400,400);
        setLayout(new GridLayout(6,2));

        JButton addBtn = new JButton("Add");
        JButton deleteBtn = new JButton("Delete");
        JButton viewBtn = new JButton("View");

        add(new JLabel("Actor ID")); add(idField);
        add(new JLabel("First Name")); add(nameField);

        add(addBtn);
        add(deleteBtn);
        add(viewBtn);

        add(new JScrollPane(display));

        addBtn.addActionListener(e -> insertActor());
        deleteBtn.addActionListener(e -> deleteActor());
        viewBtn.addActionListener(e -> viewActors());

        setVisible(true);
    }

    void insertActor() {
        try (Connection conn = DBConnection.connect()) {
            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO actors(first_name) VALUES (?)"
            );
            ps.setString(1, nameField.getText());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    void deleteActor() {
        try (Connection conn = DBConnection.connect()) {
            PreparedStatement ps = conn.prepareStatement(
                    "DELETE FROM actors WHERE actor_id=?"
            );
            ps.setInt(1, Integer.parseInt(idField.getText()));
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    void viewActors() {
        try (Connection conn = DBConnection.connect()) {
            ResultSet rs = conn.createStatement().executeQuery("SELECT * FROM actors");

            display.setText("");
            while (rs.next()) {
                display.append(rs.getInt("actor_id") + " - " + rs.getString("first_name") + "\n");
            }
        } catch (Exception e) { e.printStackTrace(); }
    }
}