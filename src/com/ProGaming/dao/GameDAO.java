package com.ProGaming.dao;

import java.util.ArrayList;
import java.util.logging.Logger;

import com.ProGaming.model.Game;

public interface GameDAO {

	/** Initialize logger */
	public static final Logger log = Logger.getLogger(GameDAO.class.getName());

	/**
	 * Add Game for games table
	 * 
	 * @param gamer
	 */
	boolean addGame(Game g1);

	/**
	 * 
	 * Get all list of Games
	 * 
	 * @return ArrayList<GAME>
	 */
	ArrayList<Game> listGame();

	/**
	 * 
	 * Get a single Game
	 * 
	 * @param gameId
	 * @return game
	 */
	Game getGame(int id);

	/**
	 * 
	 * Update a single Game
	 * 
	 * @param game
	 * @return boolean
	 */
	boolean updateGame(Game g5);

	/**
	 * 
	 * Delete a single Game
	 * 
	 * @param gamer id
	 * @return boolean
	 */
	boolean deleteGame(int id);

	/**
	 * Gets list of Games by their category
	 * 
	 * @param category name
	 * @return ArrayList<GAME>
	 */
	ArrayList<Game> getGamesbyCat(String cat);

	/**
	 * Gets the total number of games
	 * 
	 * @return int total count of the games
	 */
	public int countGame();

	/**
	 * Gets the count of games in each month
	 * 
	 * @return ArrayList<String>
	 */
	public ArrayList<String> getGamebyMonth();

	/**
	 * 
	 * Searches for a game or related games from the database
	 * 
	 * @return ArrayList<GAME>
	 */
	public ArrayList<Game> searchGame(String name);

}
