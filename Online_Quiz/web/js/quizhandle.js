/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function previousQuestion(quesId, quizId, takeId) {
    window.location = `quizhandle?quiz_id=${quizId}&index_quiz=${parseInt(quesId) - 1}&quiz_take=${takeId}`;

}

function nextQuestion(quesId, quizId, takeId) {
    window.location = `quizhandle?quiz_id=${quizId}&index_quiz=${parseInt(quesId) + 1}&quiz_take=${takeId}`;
}

$(document).ready(function () {
//    $.ajax({
//        url: "/Online_Quiz/learning/quizloadquestion",
//        type: 'get',
//        data: {
//            quiz_id: '4',
//            index_quiz: '6'
//        },
//        success: function (result) {
//            let question = result.reduce((obj, item) => Object.assign(obj, {[item.id]: item}), {});
////            $('#quiz_size').append(`${4}${'\\'}${result.length}`);
//        }});

//    $.ajax({
//        url: "/Online_Quiz/learning/quiztake",
//        type: 'get',
//        data: {
//            quiz_id: findGetParameter('quiz_id'),
//            index_quiz: findGetParameter('index_quiz'),
//            quiz_choice: choice
//        }});

    $('input[name="choice"]').click(function () {
        let choice = $('input[name="choice"]:checked').val();
        $.ajax({
            url: "/Online_Quiz/learning/quizloadanswer",
            type: 'get',
            data: {
                quiz_id: findGetParameter('quiz_id'),
                index_quiz: findGetParameter('index_quiz'),
                quiz_take: findGetParameter('quiz_take'),
                quiz_choice: choice
            }});
//            success: function (result) {
//                let question = result.reduce((obj, item) => Object.assign(obj, {[item.id]: item}), {});
////            $('#quiz_size').append(`${4}${'\\'}${result.length}`);
//            }});
    });

    var x = setInterval(function () {
        $.ajax({
            url: "/Online_Quiz/learning/quizhandle",
            type: 'POST',
            data: {
                quiz_take: findGetParameter('quiz_take')
            },
            success: function (result) {
                let minutes = Math.floor(result / 60);
//                let seconds = Math.floor((result % (1000 * 60)) / 1000);
                $('#timer').html(`${minutes}mins`);
                if (result < 0) {
                    clearInterval(x);
                    $('#timer').html(`EXPIRED`);
                }

            }
        });


    }, 1000)




    function findGetParameter(parameterName) {
        var result = null,
                tmp = [];
        location.search
                .substr(1)
                .split("&")
                .forEach(function (item) {
                    tmp = item.split("=");
                    if (tmp[0] === parameterName)
                        result = decodeURIComponent(tmp[1]);
                });
        return result;
    }

})