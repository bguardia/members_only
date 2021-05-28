// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

function addLikeEvents(){
    var like_links = document.querySelectorAll("a[data-remote]")
    
    for(let i = 0; i < like_links.length; i++){
        let like_link = like_links[i];
        like_links[i].addEventListener("ajax:success", () => {
            toggleLike(like_link)
        });
    }

}

function toggleLike(el){
  
  let post_id = el.getAttribute("data-post-id");
  let els = document.querySelectorAll("[data-post-id='"+post_id+"']");

  els.forEach((element)=>{
    let like_icon = element.getElementsByTagName("i")[0];
    if(element.className.indexOf("unlike_link") >= 0){
      element.className = element.className.replace("unlike_link", "like_link");
      element.setAttribute("data-method", "post");
      element.setAttribute("href", "/posts/"+post_id+"/like")
      //element.setAttribute("data-params", "post_id="+post_id);
      like_icon.className = like_icon.className.replace("fas", "far");
    }else{
      element.className = element.className.replace("like_link", "unlike_link");
      element.setAttribute("data-method", "delete");
      element.setAttribute("href", "/posts/"+post_id+"/unlike");
      //element.setAttribute("data-params", "");
      like_icon.className = like_icon.className.replace("far", "fas");
  }});
  
}

window.addEventListener("turbolinks:load", () => {
    addLikeEvents()});

Rails.start()
Turbolinks.start()
ActiveStorage.start()
