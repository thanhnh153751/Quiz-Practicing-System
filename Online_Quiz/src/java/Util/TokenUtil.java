/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.security.SecureRandom;
import java.util.Base64;

/**
 *
 * @author hongd
 */
public class TokenUtil {

    private static final SecureRandom secureRandom = new SecureRandom(); //threadsafe
    private static final Base64.Encoder base64Encoder = Base64.getUrlEncoder(); //Every char encode 6 bits of the data
    
    public static String tokenGenerate() {
        byte[] randomDigit = new byte[24]; 
        secureRandom.nextBytes(randomDigit);
        return base64Encoder.encodeToString(randomDigit);
    }
    
}
