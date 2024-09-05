// Louis Capps : Moffat Bay Assignment : User Bean
// This class file has eight variables, a getter method for each variable, and a setter method for each variable.

package moffat.beans;

public class User {
		// Initializing class variables
		private String fname;
		private String lname;
		private String phoneNumber;
		private String email;
		private String addressStreet;
		private String addressCity;
		private String addressState;
		private String addressZip;
		
		// Getter and Setter methods for each variable
		public String getFname() { return fname; }
		public void setFname(String fname) { this.fname = fname; }
		
		public String getLname() { return lname; }
		public void setLname(String lname) { this.lname = lname; }
		
		public String getPhoneNumber() { return phoneNumber; }
		public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

		public String getEmail() { return email; }
		public void setEmail(String email) { this.email = email; }
		
		public String getAddressStreet() { return addressStreet; }
		public void setAddressStreet(String addressStreet) { this.addressStreet = addressStreet; }
		
		public String getAddressCity() { return addressCity; }
		public void setAddressCity(String addressCity) { this.addressCity = addressCity; }
		
		public String getAddressState() { return addressState; }
		public void setAddressState(String addressState) { this.addressState = addressState; }
		
		public String getAddressZip() { return addressZip; }
		public void setAddressZip(String addressZip) { this.addressZip = addressZip; }
}
