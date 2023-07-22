/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dataAccessClasses;

import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

/**
 *
 * @author Giga P34
 */
public class Books {
    private Connection db;
    static private Books books = null;
    static private DateTimeFormatter yearOnly = new DateTimeFormatterBuilder()
            .appendPattern("yyyy")
            .parseDefaulting(ChronoField.MONTH_OF_YEAR, 1)
            .parseDefaulting(ChronoField.DAY_OF_MONTH, 1)
            .toFormatter();
    private Books() {
        db = Database.getDBConnection();
    }

    public static Books getBooks() {
        if (books == null) {
            books = new Books();
        }
        return books;
    }

    public String getBook() {
        String result = "";
        try {
            Statement stmt = db.createStatement();
            stmt.execute("SELECT * FROM books;");
            ResultSet rs = stmt.getResultSet();
            while (rs.next()) {
                result
                        += rs.getInt("book_id") + "<"
                        + rs.getString("book_name") + "<"
                        + rs.getString("book_author") + "<"
                        + rs.getDate("book_year").toLocalDate().getYear() + ">";
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return "";
        }
        return result;
    }

    public boolean addBook(String book) {
        String[] tokens = book.split("<");
        if (tokens.length != 3) {
            return false;
        }
        try {
            PreparedStatement stmt = db.prepareStatement(
                    "INSERT INTO books (book_name, book_author, book_year)"
                    + "VALUES (?,?,?);");
            stmt.setString(1, tokens[0]);
            stmt.setString(2, tokens[1]);
            stmt.setDate(3, Date.valueOf(LocalDate.parse(tokens[2], yearOnly)));
            stmt.execute();
        } catch (Exception ex) {
            System.out.println("Exception in addBook:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean updateBook(String book) {
        String[] tokens = book.split("<");
        if (tokens.length != 4) {
            return false;
        }
        try {
            PreparedStatement stmt = db.prepareStatement("UPDATE books SET "
                    + "book_name = ?,"
                    + "book_author = ?,"
                    + "book_year = ? "
                    + "WHERE book_id = ?;");
            stmt.setString(1, tokens[1]);
            stmt.setString(2, tokens[2]);
            stmt.setDate(3, Date.valueOf(LocalDate.parse(tokens[3], yearOnly)));
            stmt.setInt(4, Integer.parseInt(tokens[0]));
            stmt.execute();
        } catch (Exception ex) {
            System.out.println("Exception in updateBook:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean removeBook(String book) {
        String[] tokens = book.split("<");
        if (tokens.length != 4) {
            return false;
        }
        try {
            PreparedStatement stmt = db.prepareStatement("DELETE FROM books "
                    + "WHERE book_id = ?;");
            stmt.setInt(1, Integer.parseInt(tokens[0]));
            stmt.execute();
        } catch (Exception ex) {
            System.out.println("Exception in removeBook:" + ex.getMessage());
            return false;
        }
        return true;
    }
}
