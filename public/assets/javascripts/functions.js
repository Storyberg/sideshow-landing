// remap jQuery to $
(function($){

/* trigger when page is ready */
$(document).ready(function (){
  $.backstretch("/assets/images/homepageBg.jpg");

  $("form").validator({
    inputTypes:{
      myField: {
        inputName: 'email',
        rules: {min:0, validEmail:true},
        message: 'Please enter a valid email address',
        valid: ' '}}
  });
});

})(window.jQuery);
