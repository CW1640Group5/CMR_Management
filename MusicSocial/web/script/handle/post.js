$(document).ready(function() {
    $('.statusField button[type=submit]').click(function(e) {
        e.preventDefault();
        var $fileItems = $(this).parent().prevAll('.ajax-file-upload-statusbar');
        if ($fileItems.length === 0) { //post text
            var contentEl = $(this).parent().prevAll('#statusField');
            $.ajax({
                url: "home",
                type: $(this).parents('form').attr('method'),
                data: {act: this.value, text: contentEl.val()},
                dataType: "JSON",
                success: function(result, textStatus, jqXHR) {
                    contentEl.val("");
                    $.ajax({
                        dataType: 'JSON',
                        url: "home",
                        type: 'POST',
                        data: {act: 'getAPost', postId: result.postId},
                        success: function(aPostData, textStatus, jqXHR) {
                            var post = $('#postTmpl').tmpl(aPostData);
                            post.insertBefore('#wall .post-wrapper:first');
                            var content = post.eq(0).find('.post-text p');
                            content.html( htmlDecode(content.html()) );
                            organizePost(content);
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            alert(textStatus);
                        }
                    });
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log('error post', textStatus);
                }
            });
        }
        // do nothing
    });
});