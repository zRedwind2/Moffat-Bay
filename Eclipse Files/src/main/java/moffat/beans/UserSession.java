package moffat.beans;

public class UserSession {
	
	private int accountID;
	private boolean loggedIn = false;
	
	public int getAccountID() { return accountID; }
	public void setAccountID(int accountID) { this.accountID = accountID; }
	
	public boolean getLoggedIn() { return loggedIn; }
	public void setLoggedIn(boolean loggedIn) { this.loggedIn = loggedIn; }
}