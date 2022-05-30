/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.util.Date;

/**
 *
 * @author Viet Dung
 */
public class CheckTimeToken {

    public long CheckTime(long time) {
        Date date = new Date();
        long timeout = date.getTime()/60000 - time;
        return timeout;
    }
    
}
