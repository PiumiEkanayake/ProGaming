package com.ProGaming.Servlet;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.ArrayList;

public class SessionCounter implements HttpSessionListener {

	private static List<String> sessions = new ArrayList<>();
	public static final String COUNTER = "session-counter";

	/** Invokes when a session is created */
	public void sessionCreated(HttpSessionEvent event) {

		HttpSession session = event.getSession();
		sessions.add(session.getId());
		session.setAttribute(SessionCounter.COUNTER, this);
	}

	/** Invokes when a session is destroyed */
	public void sessionDestroyed(HttpSessionEvent event) {

		HttpSession session = event.getSession();
		sessions.remove(session.getId());
		session.setAttribute(SessionCounter.COUNTER, this);
	}

	/** This method returns the number of active sessions */
	public static int getActiveSessionNumber() {
		return sessions.size();
	}
}