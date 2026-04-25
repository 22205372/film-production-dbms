package ui;

import db.DBConnection;

import javax.swing.*;
import java.awt.*;
import java.sql.*;

public class FilmScreen extends JFrame {

    JTextField idField = new JTextField();
    JTextField titleField = new JTextField();
    JTextField genreField = new JTextField();
    JTextField budgetField = new JTextField();

    JTextArea display = new JTextArea();

    public FilmScreen() {

        setTitle("Film Management");
        setSize(600, 500);
        setLayout(new GridLayout(8,2));

        JButton addBtn = new JButton("Add");
        JButton updateBtn = new JButton("Update");
        JButton deleteBtn = new JButton("Delete");
        JButton viewBtn = new JButton("View");

        add(new JLabel("Film ID")); add(idField);
        add(new JLabel("Title")); add(titleField);
        add(new JLabel("Genre")); add(genreField);
        add(new JLabel("Budget")); add(budgetField);

        add(addBtn);
        add(updateBtn);
        add(deleteBtn);
        add(viewBtn);

        add(new JScrollPane(display));

        addBtn.addActionListener(e -> insertFilm());
        updateBtn.addActionListener(e -> updateFilm());
        deleteBtn.addActionListener(e -> deleteFilm());
        viewBtn.addActionListener(e -> viewFilms());

        setVisible(true);
    }

    void insertFilm() {
        try (Connection conn = DBConnection.connect()) {
            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO films(title, genre, budget) VALUES (?, ?, ?)"
            );
            ps.setString(1, titleField.getText());
            ps.setString(2, genreField.getText());
            ps.setDouble(3, Double.parseDouble(budgetField.getText()));
            ps.executeUpdate();

            JOptionPane.showMessageDialog(this, "Film Added");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    void updateFilm() {
        try (Connection conn = DBConnection.connect()) {
            PreparedStatement ps = conn.prepareStatement(
                    "UPDATE films SET title=?, genre=?, budget=? WHERE film_id=?"
            );
            ps.setString(1, titleField.getText());
            ps.setString(2, genreField.getText());
            ps.setDouble(3, Double.parseDouble(budgetField.getText()));
            ps.setInt(4, Integer.parseInt(idField.getText()));
            ps.executeUpdate();

            JOptionPane.showMessageDialog(this, "Film Updated");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    void deleteFilm() {
        try (Connection conn = DBConnection.connect()) {
            PreparedStatement ps = conn.prepareStatement(
                    "DELETE FROM films WHERE film_id=?"
            );
            ps.setInt(1, Integer.parseInt(idField.getText()));
            ps.executeUpdate();

            JOptionPane.showMessageDialog(this, "Film Deleted");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    void viewFilms() {
        try (Connection conn = DBConnection.connect()) {
            ResultSet rs = conn.createStatement().executeQuery("SELECT * FROM films");

            display.setText("");

            while (rs.next()) {
                display.append(
                        rs.getInt("film_id") + " - " +
                                rs.getString("title") + " - " +
                                rs.getString("genre") + "\n"
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}