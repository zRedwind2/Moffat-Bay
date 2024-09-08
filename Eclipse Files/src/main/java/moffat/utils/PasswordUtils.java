package moffat.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

public class PasswordUtils {

    // Generate a random salt
    public static byte[] generateSalt() {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[16];
        random.nextBytes(salt);
        return salt;
    }

    // Hash the password with the salt using SHA-256
    public static String hashPassword(String password, byte[] salt) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(salt); // Apply the salt
        byte[] hashedPassword = md.digest(password.getBytes());
        return Base64.getEncoder().encodeToString(hashedPassword); // Encode the hash to a String
    }

    // Verify the password (for login)
    public static boolean verifyPassword(String password, String storedHash, byte[] salt) throws NoSuchAlgorithmException {
        String hashedPassword = hashPassword(password, salt);
        return storedHash.equals(hashedPassword);
    }
}
