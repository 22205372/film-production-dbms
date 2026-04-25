package ui;

import javax.swing.*;
import java.awt.*;

public class Dashboard extends JFrame {

    public Dashboard() {
        setTitle("Dashboard");
        setSize(400,300);
        setLayout(new GridLayout(4,1));

        JButton filmsBtn = new JButton("Manage Films");
        JButton actorsBtn = new JButton("Manage Actors");
        JButton crewBtn = new JButton("Manage Crew");

        add(filmsBtn);
        add(actorsBtn);
        add(crewBtn);

        filmsBtn.addActionListener(e -> new FilmScreen());
        actorsBtn.addActionListener(e -> new ActorScreen());
        crewBtn.addActionListener(e -> new CrewScreen());

        setVisible(true);
    }
}