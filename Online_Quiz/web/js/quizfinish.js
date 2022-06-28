/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function Redirect(take_id, quiz_id){
    window.location = `/Online_Quiz/learning/review?quiz_take=${take_id}&quiz_id=${quiz_id}`;
}