package com.ProGaming.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.ProGaming.model.Game;
import com.ProGaming.util.DBConnectionUtil;

public class GameDAOImpl implements GameDAO {

	/** Initialize logger */
	public static final Logger log = Logger.getLogger(GameDAOImpl.class.getName());

	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private Statement s;

	/**
	 * Adds a game to the database
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection
	 *	@throws ArrayIndexOutOfBoundsException
	 *             - Throws when an illegal index is accessed             
	 *  @throws NullPointerException
	 *             - Service is not available    
	 *             
	 *  @return boolean
	 *  			-Status of the update                   
	 *          
	 */             
	public boolean addGame(Game g1) {

		boolean flag = false;

		try {

			con = DBConnectionUtil.OpenConnection();

			ps = con.prepareStatement("Insert into game (gName,gDes,gInst,gImg,gLink) values (?,?,?,?,?)");
			ps.setString(1, g1.getgName());
			ps.setString(2, g1.getgDes());
			ps.setString(3, g1.getgInst());
			ps.setString(4, g1.getgImg());
			ps.setString(5, g1.getgLink());
			ps.executeUpdate();

			// Returns the game ID of the inserted game
			ps = con.prepareStatement("Select gID from game where gName = '" + g1.getgName() + "'");
			rs = ps.executeQuery();
			if (rs.next()) {
				g1.setgID(rs.getInt(1)); // Set the game id to the game object
			}
			// Insert the returned id and the category ids to the game_category table
			ps = con.prepareStatement("Insert into game_category values(?,?)");

			// Stores the game categories in an array
			int[] arr = g1.getgCat();

				// Insert one by one to the table
				for (int i = 0; i < arr.length; i++) {
					ps = con.prepareStatement("Insert into game_category values(?,?)");
					ps.setInt(1, g1.getgID());
					ps.setInt(2, arr[i]);
					ps.executeUpdate();
				}
			
			flag = true;

		} catch (SQLException | ArrayIndexOutOfBoundsException | NullPointerException ex) {

			log.log(Level.SEVERE, ex.getMessage());

		}
		return flag;
	}

	/**
	 * This method retrieves a list of games from the database
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection  
	 *           
	 *  @throws NullPointerException
	 *             - Service is not available    
	 *             
	 *  @return ArrayList<Game>
	 *  			-Array of Game list will return                  
	 *          
	 */ 
	public ArrayList<Game> listGame() {

		ArrayList<Game> g = new ArrayList<Game>();

		try {

			con = DBConnectionUtil.OpenConnection();
			s = con.createStatement();
			rs = s.executeQuery("select * from game");

			while (rs.next()) {

				Game game = new Game();
				game.setgID(rs.getInt(1));
				game.setgName(rs.getString(2));
				game.setgDes(rs.getString(4));
				game.setgImg(rs.getString(5));
				game.setgLink(rs.getString(6));

				g.add(game);
			}
		}
		catch (SQLException | NullPointerException e) {

			log.log(Level.SEVERE, e.getMessage());
		}

		return g;
	}

	/**
	 * This method displays a game based on the provided id
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection 
	 * @throws ArrayIndexOutOfBoundsException
	 *             - Throws when an illegal index is accessed             
	 *  @throws NullPointerException
	 *             - Service is not available    
	 *             
	 *  @return Game object
	 *  			-returns a game                  
	 *          
	 */
	public Game getGame(int id) {

		Game g2 = new Game();
		try {
			ArrayList<Integer> arr = new ArrayList<>();
			con = DBConnectionUtil.OpenConnection();
			s = con.createStatement();
			rs = s.executeQuery("select * from game where gID =" + id);
			if (rs.next()) {

				g2.setgID(rs.getInt(1));
				g2.setgName(rs.getString(2));
				g2.setgDes(rs.getString(3));
				g2.setgInst(rs.getString(4));
				g2.setgImg(rs.getString(5));
				g2.setgLink(rs.getString(6));

			}
			s = con.createStatement();
			rs = s.executeQuery("select * from game_category where gID =" + id);
			
			

			while (rs.next()) {
				arr.add(rs.getInt("cat_id"));
			}
			// Converting arraylist to int array
			int[] cat = new int[arr.size()];
		
			int var = 0;
			for (Integer c : arr) {
				cat[var] = c;
				var++;
			}
			
			g2.setgCat(cat);

		} catch (SQLException | ArrayIndexOutOfBoundsException | NullPointerException e) {

			log.log(Level.SEVERE, e.getMessage());

		}
		return g2;
	}
	
	/**
	 * This method updates the details of the game
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection 
	 * @throws ArrayIndexOutOfBoundsException
	 *             - Throws when an illegal index is accessed             
	 *  @throws NullPointerException
	 *             - Service is not available    
	 *  @param game object           
	 *  @return boolean
	 *  			returns the status of the update                
	 *          
	 */

	public boolean updateGame(Game g5) {

		boolean flag = false;

		try {

			con = DBConnectionUtil.OpenConnection();

			// Checks whether the image has also been updated
			if (g5.getgImg().isEmpty() || g5.getgImg() == null) {
				
				// This is executed only when the image is not updated
				// Updates the rest of the columns excluding the image name
				ps = con.prepareStatement("Update game Set gName = ? , gDes = ? ,gInst = ? , gLink = ? where gID = " + g5.getgID());
				ps.setString(1, g5.getgName());
				ps.setString(2, g5.getgDes());
				ps.setString(3, g5.getgInst());
				ps.setString(4, g5.getgLink());

			} else {
				// This is executed only when the image is updated
				// Updates the rest of the columns including the image name
				ps = con.prepareStatement("Update game Set gName = ? , gDes = ? ,gInst = ? ,gImg = ?, gLink = ? where gID = "+ g5.getgID());
				ps.setString(1, g5.getgName());
				ps.setString(2, g5.getgDes());
				ps.setString(3, g5.getgInst());
				ps.setString(4, g5.getgImg());
				ps.setString(5, g5.getgLink());

			}

			ps.executeUpdate();

			// Delete the relevant record in game_category table
			ps = con.prepareStatement("Delete from game_category where gID = " + g5.getgID());
			ps.executeUpdate();
			// Stores the game categories in an array
			int[] arr = g5.getgCat();
			// Insert one by one to the table
			for (int i = 0; i < arr.length; i++) {
				ps = con.prepareStatement("Insert into game_category values(?,?)");
				ps.setInt(1, g5.getgID());
				ps.setInt(2, arr[i]);
				ps.executeUpdate();
			}

			flag = true;

		} catch (SQLException | ArrayIndexOutOfBoundsException | NullPointerException ex) {

			log.log(Level.SEVERE, ex.getMessage());

		}
		return flag;
	}
	
	/**
	 * This method deletes the game based on the provided id
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection            
	 *  @throws NullPointerException
	 *             - Service is not available    
	 *  @param game id          
	 *  @return boolean
	 *  			returns the status of the delete               
	 *          
	 */

	public boolean deleteGame(int id) {

		boolean flag = false;

		try {

			con = DBConnectionUtil.OpenConnection();
			ps = con.prepareStatement("delete from game where gID = " + id);
			ps.executeUpdate();

			flag = true;

		} catch (SQLException | NullPointerException ex) {

			ex.printStackTrace();

		}
		return flag;
	}
	
	/**
	 * This method displays a list of games based on the given category name
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection  
	 *           
	 *  @throws NullPointerException
	 *             - Service is not available    
	 *             
	 *  @return ArrayList<Game>
	 *  			-Array of Game list will return                  
	 *          
	 */ 
	public ArrayList<Game> getGamesbyCat(String cat) {

		ArrayList<Game> g = new ArrayList<Game>();

		try {

			con = DBConnectionUtil.OpenConnection();
			s = con.createStatement();
			if (cat.equals("New") || cat.equals("All Game")) {
				rs = s.executeQuery("select g.gID,g.gName,g.gImg from game g order by g.gAddedDate DESC");
			} else {
				rs = s.executeQuery("select g.gID,g.gName,g.gImg from game g, category c, game_category gc where g.gID = gc.gID and c.cat_id = gc.cat_id and c.name = '"+ cat + "' order by g.gAddedDate DESC");
			}
			while (rs.next()) {

				Game game = new Game();
				game.setgID(rs.getInt(1));
				game.setgName(rs.getString(2));
				game.setgImg(rs.getString(3));
				g.add(game);
			}

		}

		catch (SQLException | NullPointerException e) {

			log.log(Level.SEVERE, e.getMessage());

		}

		return g;

	}

	/**
	 * This method displays the total number of games in the database
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection            
	 *  @throws NullPointerException
	 *             - Service is not available    
	 *         
	 *  @return int
	 *  			returns the number of games             
	 *          
	 */
	public int countGame() {

		try {
			con = DBConnectionUtil.OpenConnection();
			s = con.createStatement();
			rs = s.executeQuery("Select count(gID) from Game");
			int total = 0;
			if (rs.next()) {
				total = rs.getInt(1);
			}

			return total;
		} catch (SQLException e) {
			log.log(Level.SEVERE, e.getMessage());
		}

		return 0;

	}

	/**
	 * This method displays the number of games added each month
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection  
	 *           
	 *  @throws NullPointerException
	 *             - Service is not available    
	 *             
	 *  @return ArrayList<String>
	 *  			-Arraylist of total no.of games and their respective month will return                  
	 *          
	 */ 
	public ArrayList<String> getGamebyMonth() {

		ArrayList<String> al = new ArrayList<>();
		try {
			con = DBConnectionUtil.OpenConnection();
			s = con.createStatement();
			rs = s.executeQuery("select monthname(gAddedDate), count(gID) from game group by monthname(gAddedDate)");

			while (rs.next()) {
				String month = rs.getString(1);
				int c = rs.getInt(2);
				String count = Integer.toString(c);
				al.add(month);
				al.add(count);
			}
			
			return al;
			
		} catch (SQLException | NullPointerException e) {
			log.log(Level.SEVERE, e.getMessage());
		}

		return al;

	}

	/**
	 * This method displays the games based on the search input
	 * 
	 * @throws SQLException
	 *             - Thrown when database access error occurs or this method is
	 *             called on a closed connection  
	 *           
	 *  @throws NullPointerException
	 *             - Service is not available    
	 *             
	 *  @return ArrayList<Game>
	 *  			-Arraylist of related games will return                  
	 *          
	 */ 
	public ArrayList<Game> searchGame(String name) {

		ArrayList<Game> g = new ArrayList<>();

		try {

			con = DBConnectionUtil.OpenConnection();
			s = con.createStatement();
			rs = s.executeQuery("select * from game where gName like '" + name + "%'");
			
			while (rs.next()) {

				Game g2 = new Game();
				g2.setgID(rs.getInt(1));
				g2.setgName(rs.getString(2));
				g2.setgDes(rs.getString(3));
				g2.setgInst(rs.getString(4));
				g2.setgImg(rs.getString(5));
				g2.setgLink(rs.getString(6));
				g.add(g2);
			}

			return g;
			
		} catch (SQLException | NullPointerException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
		return g;
	}
}
