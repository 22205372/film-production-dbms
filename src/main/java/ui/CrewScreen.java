package ui;

import db.DBConnection;

import javax.swing.*;
import java.awt.*;
import java.sql.*;

public class CrewScreen extends JFrame {

    JTextField idField = new JTextField();
    JTextField firstNameField = new JTextField();
    JTextField lastNameField = new JTextField();
    JTextField roleField = new JTextField();
    JTextField salaryField = new JTextField();

    JTextArea display = new JTextArea();

    public CrewScreen() {

        setTitle("Crew Management");
        setSize(500, 500);
        setLayout(new GridLayout(8,2));

        JButton addBtn = new JButton("Add");
        JButton deleteBtn = new JButton("Delete");
        JButton viewBtn = new JButton("View");

        // Form Fields
        add(new JLabel("Crew ID (for delete)")); add(idField);
        add(new JLabel("First Name")); add(firstNameField);
        add(new JLabel("Last Name")); add(lastNameField);
        add(new JLabel("Role")); add(roleField);
        add(new JLabel("Salary")); add(salaryField);

        // Buttons
        add(addBtn);
        add(deleteBtn);
        add(viewBtn);

        // Display Area
        add(new JScrollPane(display));

        // Button Actions
        addBtn.addActionListener(e -> insertCrew());
        deleteBtn.addActionListener(e -> deleteCrew());
        viewBtn.addActionListener(e -> viewCrew());

        setVisible(true);
    }

    // 🔹 INSERT
    void insertCrew() {
        try (Connection conn = DBConnection.connect()) {

            String sql = "INSERT INTO crew(first_name, last_name, role, salary) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, firstNameField.getText());
            ps.setString(2, lastNameField.getText());
            ps.setString(3, roleField.getText());
            ps.setDouble(4, Double.parseDouble(salaryField.getText()));

            ps.executeUpdate();

            JOptionPane.showMessageDialog(this, "Crew added successfully!");

        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, "Error inserting crew");
            e.printStackTrace();
        }
    }

    // 🔹 DELETE
    void deleteCrew() {
        try (Connection conn = DBConnection.connect()) {

            String sql = "DELETE FROM crew WHERE crew_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, Integer.parseInt(idField.getText()));

            int rows = ps.executeUpdate();

            if (rows > 0) {
                JOptionPane.showMessageDialog(this, "Crew deleted!");
            } else {
                JOptionPane.showMessageDialog(this, "Crew ID not found!");
            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, "Error deleting crew");
            e.printStackTrace();
        }
    }

    // 🔹 VIEW
    void viewCrew() {
        try (Connection conn = DBConnection.connect()) {

            String sql = "SELECT * FROM crew";
            ResultSet rs = conn.createStatement().executeQuery(sql);

            display.setText("");

            while (rs.next()) {
                display.append(
                        "ID: " + rs.getInt("crew_id") +
                                " | Name: " + rs.getString("first_name") + " " + rs.getString("last_name") +
                                " | Role: " + rs.getString("role") +
                                " | Salary: " + rs.getDouble("salary") + "\n"
                );
            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, "Error loading crew data");
            e.printStackTrace();
        }
    }
}