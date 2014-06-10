Handlebars.registerHelper("format_approved", function(boolean){
    if(boolean === "0"){
        return "denied";
    }else{
        return "approved";
    }
});