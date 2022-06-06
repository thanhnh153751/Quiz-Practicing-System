

$(document).ready(function () {
    const editor = CKEDITOR.replace('editor1');

    $('#send').click(function () {
        let content = CKEDITOR.instances.editor1.getData();
        console.log(content);
    });

})


