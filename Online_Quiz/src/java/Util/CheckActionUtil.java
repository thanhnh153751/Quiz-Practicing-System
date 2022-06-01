/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import Model.Action;
import java.util.List;

/**
 *
 * @author hongd
 */
public class CheckActionUtil {
    public boolean checkActionInList(List<Action> actions, String action_code){
        for (Action action : actions) {
            if (action.getAction_code().equals(action_code)) {
                return true;
            }
        }
        return false;
    }
}
