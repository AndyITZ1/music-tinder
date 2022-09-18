function createDiv() {
    return document.createElement("div");
}


function createPost() {
    console.log("Print MEEEEEEE!!!");
    // Post
    const postWrapper = createDiv();
    postWrapper.className = "post";

    // Post Header 
    const postHeaderWrapper = createDiv();
    postHeaderWrapper.className = "post-header";
    postWrapper.appendChild(postHeaderWrapper);

    // Poster Image
    const posterImgWrapper = createDiv();
    posterImgWrapper.className = "poster-profile-img";
    // Poster's Image to be done later ***
    const posterImg = document.createElement("img");
    const posterProfImg = document.getElementById("profile-pic");
    posterImg.src = posterProfImg.src;
    posterImgWrapper.appendChild(posterImg);
    postHeaderWrapper.appendChild(posterImgWrapper);

    // Poster's Name
    const posterNameWrapper = createDiv();
    posterNameWrapper.className = "poster-name";
    postHeaderWrapper.appendChild(posterNameWrapper);
    const cPosterName = document.getElementsByClassName("dropbtn")[0];
    const posterName = document.createTextNode(cPosterName.textContent);
    posterNameWrapper.appendChild(posterName);

    // Post Body
    const postBodyWrapper = createDiv();
    postBodyWrapper.className = "post-body";
    postWrapper.appendChild(postBodyWrapper);

    // Post Title
    const postTitleWrapper = createDiv();
    postTitleWrapper.className = "post-title";
    postBodyWrapper.appendChild(postTitleWrapper)
    const postTitle = document.createElement("h1");
    const cTitle = document.getElementById("title");
    const postTitleText = document.createTextNode(cTitle.value);
    postTitle.appendChild(postTitleText);
    postTitleWrapper.appendChild(postTitle);

    // Post Text
    const postTextWrapper = createDiv();
    postTextWrapper.className = "post-text";
    postBodyWrapper.appendChild(postTextWrapper);
    const cPostText = document.getElementById("post-text");
    const postText = document.createTextNode(cPostText.value);
    postTextWrapper.appendChild(postText);

    // Post Footer
    const postFooterWrapper = createDiv();
    postFooterWrapper.className = "post-footer";
    postWrapper.appendChild(postFooterWrapper);

    // Comment Button
    const commentBtnWrapper = document.createElement("a");
    commentBtnWrapper.className = "comment-button";
    commentBtnWrapper.href = "#";
    postFooterWrapper.appendChild(commentBtnWrapper);

    
    const commIcon = document.createElement("img");
    commIcon.src = "/images/message.png";
    commIcon.alt = "Comment Button";
    commentBtnWrapper.appendChild(commIcon);

    const commTextWrapper = document.createElement("span");
    commTextWrapper.className = "comment-word";
    const commText = document.createTextNode("Comments");
    commTextWrapper.appendChild(commText);
    commentBtnWrapper.appendChild(commTextWrapper);

    // Like Button
    const likeBtnWrapper = createDiv();
    likeBtnWrapper.className = "like-button";
    postFooterWrapper.appendChild(likeBtnWrapper);

    const likeBtn = document.createElement("button");
    likeBtnWrapper.appendChild(likeBtn);
    
    const likeIcon = document.createElement("img");
    likeIcon.src = "/images/like.png";
    likeIcon.alt = "Like Button";
    likeBtn.appendChild(likeIcon);

    const likeTextWrapper = createDiv();
    likeTextWrapper.className = "like-word";
    const likeText = document.createTextNode("Like");
    likeTextWrapper.appendChild(likeText);
    likeBtn.appendChild(likeTextWrapper);

    // Share Button
    const shareBtnWrapper = createDiv();
    shareBtnWrapper.className = "share-button";
    postFooterWrapper.appendChild(shareBtnWrapper);

    const shareBtn = document.createElement("button");
    shareBtnWrapper.appendChild(shareBtn);
    
    const shareIcon = document.createElement("img");
    shareIcon.src = "/images/sharec.png";
    shareIcon.alt = "Share Button";
    shareBtn.appendChild(shareIcon);

    const shareTextWrapper = createDiv();
    shareTextWrapper.className = "share-word";
    const shareText = document.createTextNode("Share");
    shareTextWrapper.appendChild(shareText);
    shareBtn.appendChild(shareTextWrapper);

    // Adding Post to Post-Section
    const postSection = document.getElementsByClassName("post-section")[0];
    postSection.prepend(postWrapper);
}