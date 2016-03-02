<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
        <link href="css/uploadfile.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <div class="modal fade" id="uploadAudioModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                    </div>
                    <div class="modal-body">
                        <!--                        <input type="text" name="music" value="i" />
                                                <select name="type">
                                                    <option value="0">By Title</option>
                                                    <option value="1">By Artist</option>
                                                </select>
                                                <ul id="searchSongResult"></ul>-->
                        <div id="fileuploader">Upload</div>
                        <div class="ajax-file-upload-green" id="startUpload">Start Upload</div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="row">
                <div class="col-lg-3"> 
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Music Social Network</a>
                    </div>
                </div>
                <div class="col-lg-6">              
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input id="search" type="search" class="form-control" placeholder="Search" >
                        </div>
                    </form>
                </div>
                <p class="navbar-brand">
                    Welcome ${account.getName()} 
                    <a href="login.jsp">Logout</a>
                </p>
                <div class="col-lg-2">
                    <!--                <form class="form-inline headerSignIn" role="form">
                                        <div class="form-group">
                                          <label class="sr-only" for="exampleInputEmail2">Email address</label>
                                          <input type="email" class="form-control" id="exampleInputEmail2" placeholder="Enter email">
                                        </div>
                                        <div class="form-group">
                                          <label class="sr-only" for="exampleInputPassword2">Password</label>
                                          <input type="password" class="form-control" id="exampleInputPassword2" placeholder="Password">
                                        </div>
                                        
                                DE LAI REMEMBERME          
                    <div class="checkbox">
                                          <label>
                                            <input type="checkbox"> Remember me
                                          </label>
                                        </div>
                    
                                        <button type="submit" class="btn btn-default">Sign in</button>
                                   </form>-->
                </div>

            </div>
        </div>
        <!--  Trang chinh bao gom menu va post-->
        <div class="container">
            <div class="row mainPost" >
                <div class="menuAcess list-group col-lg-3">
                    <a href="" class="list-group-item">My Music</a>
                    <a href="#" class="list-group-item">My Profile</a>
                    <a href="#" class="list-group-item">My News</a>
                    <a href="friend.jsp" class="list-group-item">Users</a>
                </div>
                <div class="col-lg-9 wallPost" id="wall">
                    <div class="statusField row">
                        <form action="home" method="post">
                            <h3> Enter Your Status Here</h3>
                            <div>
                                <textarea name="post_text" id="statusField" placeholder="What's on your mind?"></textarea>
                                <div class="comment-photo"></div>
                                <div class="comment-audio"></div>
                                <div>
                                    <button class="custom-btn" type="submit" name="act" value="post">Post</button>
                                    <select class="attach">
                                        <option value="photo">Photo</option>
                                        <option value="audio">Audio</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <c:forEach items="${listOfPost}" var="n">
                        <div class="post-wrapper row" id="${n.getPostId()}">
                            <div class="post-header clearfix">
                                <a href="#" class="post-avatar owner-avatar avatar">
                                    <img src="images/avatar/${n.getAvatar()}"/>
                                </a>
                                <div>
                                    <span class="post-name spanRow"><a href="#">${n.getName()}</a></span>
                                    <span class="post-time spanRow spanTime">${n.getTime()}</span>
                                </div>
                            </div>
                            <div class="post-text clearfix">
                                <p>${n.getContent()}</p>
                            </div>
                            <div class="post-photos">
                                <div class="post-photo"></div>
                            </div>
                            <div class="post-audios">
                                <div class="post-audio">
                                </div>
                            </div>
                            <div class="reply-wrapper">
                                <div class="reply-like">
                                    <span class="post-like like">
                                        <c:if test="${n.isIsLiked() == true}">
                                            <a href="#">Dislike</a>
                                        </c:if>
                                        <c:if test="${n.isIsLiked() == false}">
                                            <a href="#">Like</a>
                                        </c:if>
                                    </span>
                                    <span class="post-counting-like">${n.getCountingLike()}♥</span>
                                </div>
                                <div class="reply-comment">
                                    <ul class="comment-list">
                                        <c:forEach items="${n.getComments()}" var="i">
                                            <li class="comment-item">
                                                <a href="#" class="comment-avatar avatar">
                                                    <img src="images/avatar/${i.getAvatar()}"/>
                                                </a>
                                                <div>
                                                    <div class="comment-header">
                                                        <span class="comment-name spanRow"><a href="#">${i.getName()}</a></span>
                                                        <span class="comment-text">${i.getContent()}</span>
                                                    </div>
                                                    <div class="comment-photo"></div>
                                                    <div class="comment-audio"></div>
                                                    <div class="comment-footer">
                                                        <span class="comment-time spanTime">${i.getTime()}</span>
                                                        <span class="comment-like like">
                                                            <c:if test="${i.isIsLiked() == true}">
                                                                <a href="#">Dislike</a>
                                                            </c:if>
                                                            <c:if test="${i.isIsLiked() == false}">
                                                                <a href="#">Like</a>
                                                            </c:if>
                                                        </span>
                                                        <span class="comment-counting-like">${i.getCountingLike()}♥</span>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                        <li class="comment-item add-comment">
                                            <a href="#" class="comment-avatar owner-avatar avatar">
                                                <img src="images/avatar/${n.getAvatar()}"/>
                                            </a>
                                            <div>
                                                <textarea name="" placeholder="Write your thinking..."></textarea>
                                                <div class="comment-photo"></div>
                                                <div class="comment-audio"></div>
                                                <div>
                                                    <select class="attach">
                                                        <option value="photo">Photo</option>
                                                        <option value="audio">Audio</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div><!-- /.reply-wrapper -->
                        </div><!-- /.post-wrapper -->
                    </c:forEach>
                </div><!--/.wallPost#wall -->
            </div><!-- /.mainPost -->
        </div>
        <a id="next" href="#">next page?</a>
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="script/jquery-1.11.1.js"></script>
        <script src="script/bootstrap.js" type="text/javascript"></script>
        <script src="script/jquery.tmpl.js"></script>
        <script type="text/javascript" src="script/bookmarket.js"></script>
        <script type="text/javascript" src="script/timeLikeFacebook/jquery.timeago.js"></script>
        <script type="text/javascript" src="script/debug.js"></script>
        <script type="text/javascript" src="script/jquery.infinitescroll.js"></script>
        <script type="text/javascript" src="script/behaviors/manualTrigger.js"></script>
        <script src="script/fileupload/jquery.uploadfile.js" type="text/javascript"></script>
        <script src="script/fileupload/jquery.form.js" type="text/javascript"></script>

        <script id="postTmpl" type="text/x-jquery-tmpl">
            <div class="post-wrapper row" id="{{= postId}}">
            <div class="post-header clearfix">
            <a href="#" class="post-avatar owner-avatar avatar">
            <img src="images/avatar/{{= avatar}}"/>
            </a>
            <div>
            <span class="post-name spanRow"><a href="#">{{= name}}</a></span>
            <span class="post-time spanRow spanTime">{{= getTime(time.iMillis)}}</span>
            </div>
            </div>
            <div class="post-text clearfix">
            <p>{{= content}}</p>
            </div>
            <div class="post-photos">
            <div class="post-photo"></div>
            </div>
            <div class="post-audios">
            <div class="post-audio"></div>
            </div>
            <div class="reply-wrapper">
            <div class="reply-like">
            <span class="post-like like">
            {{if isLiked == true}}
            <a href="#">Dislike</a>
            {{else}}
            <a href="#">Like</a>
            {{/if}}
            </span>
            <span class="post-counting-like">{{= countingLike}}♥</span>
            </div>
            <div class="reply-comment">
            <ul class="comment-list">
            {{tmpl($data.comments) '#commentTmpl'}}
            <li class="comment-item add-comment">
            <a href="#" class="comment-avatar owner-avatar avatar">
            <img src="images/avatar/{{= avatar}}"/>
            </a>
            <div>
            <textarea name="" placeholder="Write your thinking..."></textarea>
            <select class="attach">
            <option value ="photo">Photo</option>
            <option value ="audio">Audio</option>
            </select>
            </div>
            </li>
            </ul>
            </div>
            </div>
            </div><!--/.postTmpl-->
        </script>
        <script id="commentTmpl" type="text/x-jquery-tmpl">
            <li class="comment-item">
            <a href="#" class="comment-avatar avatar">
            <img src="images/avatar/{{= avatar}}"/>
            </a>
            <div>
            <div class="comment-header">
            <span class="comment-name spanRow"><a href="#">{{= name}}</a></span>
            <span class="comment-text">{{= content}}</span>
            </div>
            <div class="comment-photo"></div>
            <div class="comment-audio"></div>
            <div class="comment-footer">
            <span class="comment-time spanTime">{{= getTime(time.iMillis)}}</span>
            <span class="comment-like like">
            {{if isLiked == true}}
            <a href="#">Dislike</a>
            {{else}}
            <a href="#">Like</a>
            {{/if}}
            </span>
            <span class="comment-counting-like">{{= countingLike}}♥</span>
            </div>
            </div>
            </li>
        </script><!--/#commentTmpl -->
        <script id="searchMusicTmp" type="text/x-jquery-tmpl">
            <li>{{= artistName}} | {{= title}} | <span>{{= fileName}}</span><button class="addSong">Add Song</button></li>
        </script>
        <script type="text/javascript">
            function updateTime() {
                $(".msn-time").each(function(index, el) {
                    $(el).timeago();
                    $(el).text($.timeago($(el).attr('title')));
                });
            }
            function getTime(jsonDate) {
                return new Date(jsonDate);
            }

            function getAudio(jsonAudio, tagName) {
                var pattern = '<' + tagName + '>(.*?)</' + tagName + '>';
                var regObj = new RegExp(pattern, 'g');
                var tokens = jsonAudio.match(regObj);
                if (tokens === null)
                    return null;
                return tokens.map(function(val) {
                    return val.replace(new RegExp('</?' + tagName + '>', 'g'), '');
                });
            }

            <%-- TODO
                - text, audio
                - Get text to .post-text
                - Get audio to .post-audios
            --%>
            function htmlDecode(value) {
                if (value) {
                    return $('<div />').html(value).text();
                } else {
                    return '';
                }
            }
            function organizePost(selector) {
                var content = selector || $('.post-text p');
                content.each(function(index, el) {
                    var $el = $(el);
                    var theContent = $el.html();
                    theContent = theContent.replace(/(?:\r\n|\r|\n)/g, '<br />');
//                    console.log('rough ' + index + ': ', theContent);
                    var postText = getAudio(theContent, 'text');
                    $el.html(postText);
                    var postAudio = getAudio(theContent, 'music');
//                    console.log('audio', postAudio);
                    if (postAudio !== null) {
                        var $audio = $('<audio>', {controls: true}),
                                $source = $('<source>', {src: 'music/' + postAudio});
                        $source.appendTo($audio);
                        $el.closest('.post-text').nextAll('.post-audios').find('.post-audio').append($audio);
                    }
                });
            }
            $(document).ready(function() {
                getTime();
                setInterval(function() {
                    updateTime();
                }, 5000);

                organizePost();

                $(document).on('keydown', '.add-comment textarea', function(e) {
                    if (e.keyCode === 13) {
                        var self = $(this);
                        e.preventDefault();
                        $.ajax({
                            dataType: 'json',
                            url: "comment",
                            type: 'POST',
                            data: {act: 'addComment', content: $(this).val(), postId: $(this).parents('.post-wrapper').attr('id')},
                            success: function(data, textStatus, jqXHR) {
                                self.val("");
                                $("#commentTmpl").tmpl(data).insertBefore(self.closest('.add-comment'));
                            },
                            error: function(jqXHR, textStatus, errorThrown) {
                                console.log('error', textStatus);
                            }
                        });
                    }
                });

                $('#wall').infinitescroll({
                    loading: {
                        finished: undefined,
                        finishedMsg: "<em>Congratulations, You're out of World cup.</em>",
                        msg: null,
                        msgText: "<em>Loading...</em>",
                        selector: null,
                        speed: 'slow',
                        start: undefined,
                        img: "images/app/ajax-loader.gif",
                        pageNumber: 2
                    },
                    navSelector: "#next:last",
                    nextSelector: "#next:last",
                    //                itemSelector: "#content p",
                    debug: true,
                    dataType: 'json',
                    template: $('#postTmpl'),
                    case: 'post',
                    // maxPage         : 7,
                    //		prefill			: true,
                    //		path: ["http://nuvique/infinite-scroll/test/index", ".html"]
                    path: function(index) {
                        return "index" + index + ".html";
                    }
                    // behavior	 : 'twitter',
                    // appendCallback	: false, // USE FOR PREPENDING
                    // pathParse     	: function( pathStr, nextPage ){ return pathStr.replace('2', nextPage ); }
                }, function(json, opts) {
                    // Get current page
                    var page = opts.state.currPage;
                    // Do something with JSON data, create DOM elements, etc ..
                });

                var activeComponent;
                $('#uploadAudioModal option').click(function() {
                    activeComponent = $(this).closest('.statusField').length !== 0 ? $(this).closest('.statusField') : 'baby I drink water';
                    console.log(activeComponent);
                    $.ajax({
                        dataType: 'json',
                        url: "song",
                        type: 'POST',
                        data: {act: 'searchMusic', music: 'i', type: '0'},
                        success: function(data, textStatus, jqXHR) {
                            console.log(data);
                            $('#searchMusicTmp').tmpl(data).appendTo('#searchSongResult');
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            alert(textStatus);
                        }
                    });
                });

                $('.modal-dialog').on('click', '.addSong', function(e) {
                    console.log(this);

                });

//            var searchSongPage = 2;
//            $('#wall').infinitescroll({
//                loading: {
//                    finished: undefined,
//                    finishedMsg: "<em>Congratulations, You're out of World cup.</em>",
//                    msg: null,
//                    msgText: "<em>Loading...</em>",
//                    selector: null,
//                    speed: 'slow',
//                    start: undefined,
//                    img: "images/app/ajax-loader.gif",
//                    pageNumber: searchSongPage
//                },
//                navSelector: "#next:last",
//                nextSelector: "#next:last",
//                //                itemSelector: "#content p",
//                debug: true,
//                dataType: 'json',
//                template: $('#postTmpl'),
//                case: 'post',
//                // maxPage         : 7,
//                //		prefill			: true,
//                //		path: ["http://nuvique/infinite-scroll/test/index", ".html"]
//                path: function(index) {
//                    return "index" + index + ".html";
//                }
//                // behavior	 : 'twitter',
//                // appendCallback	: false, // USE FOR PREPENDING
//                // pathParse     	: function( pathStr, nextPage ){ return pathStr.replace('2', nextPage ); }
//            }, function(json, opts) {
//                // Get current page
//                var page = opts.state.currPage;
//                // Do something with JSON data, create DOM elements, etc ..
//            });
            });
        </script>
        <script src="script/handle/post.js" type="text/javascript"></script>
        <script src="script/handle/attach.js" type="text/javascript"></script>
    </body>
</html>
