$(document).ready(function() {
    $('.attach option[value=audio]').click(function() {
        var upload = $(this).closest('div').prevAll('.ajax-upload-dragdrop');
        if (upload.length > 0) { // there's aldready a upload
            return;
        }
        var self = this;
        $fileuploader = $('<div>', {id: 'filuploader', text: "Upload"});
        var textarea = $(this).closest('div').prevAll('textarea');
        $(this).closest('div').before($fileuploader);
        var uploadObj = $fileuploader.uploadFile({
            url: "theupload",
            multiple: true,
            autoSubmit: false,
            fileName: "file",
            showProgress: true,
            returnType: 'json',
//            showDone: false,
            formData: {act: "post-upload"},
            dynamicFormData: function() {
                var data = {text: textarea.val().trim()};
                return data;
            },
            onSuccess: function(files, data, xhr)
            {
                textarea.val("");
                var post = $('#postTmpl').tmpl(data);
                post.insertBefore('#wall .post-wrapper:first');
                var content = post.eq(0).find('.post-text p');
                content.html( htmlDecode( content.html() ) );
                organizePost(content);
            }
        });

        $postBtn = $(this).parent().prev();
        $postBtn.click(function() {
            var $fileItems = $(this).parent().prevAll('.ajax-file-upload-statusbar');
            if ($fileItems.length > 0) { //post upload
                uploadObj.startUpload();
            }
        });
    });

});