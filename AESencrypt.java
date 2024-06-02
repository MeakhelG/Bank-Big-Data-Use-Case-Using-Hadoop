import java.security.Key;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.hadoop.hive.ql.exec.UDF;

public class AESencrypt extends UDF {
    private static final String ALGO = "AES"; 
    private static final byte[] keyValue =
        new byte[] { 'a', 'c', 'a', 'd', 'g', 'i', 'l', 'd', 'a', 'c', 'a', 'd', 'g', 'i', 'l', 'd' };

    public static String encrypt (String Data) throws Exception {
        Key key = generateKey();
        Cipher c = Cipher.getInstance (ALGO);
        c.init (Cipher.ENCRYPT_MODE, key);
        byte[] encVal = c.doFinal (Data.getBytes());
        String encryptedValue = Base64.getEncoder().encodeToString (encVal); 
        return encryptedValue;
    }

    public static String decrypt (String encryptedData) throws Exception { 
        Key key = generateKey();
        Cipher c = Cipher.getInstance (ALGO);
        c.init (Cipher.DECRYPT_MODE, key);
        byte[] decodedValue = Base64.getDecoder().decode (encryptedData.getBytes());
        byte[] decValue = c.doFinal (decodedValue);
        String decryptedValue = new String (decValue); 
        return decryptedValue;
    }
    
    private static Key generateKey() throws Exception {
        Key key = new SecretKeySpec (keyValue, ALGO); 
        return key;
    }

    public String evaluate (String input) throws Exception { 
        if (input == null) {
            return null;
        }
        return encrypt (input);
    }
}
