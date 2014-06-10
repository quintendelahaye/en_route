/* globals Settings:true */
/* globals Admin:true */
/* globals Client:true */

var AppRouter = Backbone.Router.extend({

    poll_id: 0,

    initialize: function(){
        _.bindAll.apply(_, [this].concat(_.functions(this)));
    },

    routes: {
        "": "client",
        "admin":  "admin",
        "client":  "client"
    },

    overview: function(){
        console.log("nothing to show");
    },

    admin: function(){
        console.log("admin");
        this.render();
        this.adminView = new Admin();
        $("#container").append(this.adminView.render().$el);
    },

    client: function(){
        console.log("client");
        this.render();
        this.clientView = new Client();
        $("#container").append(this.clientView.render().$el);
    },

    render: function(){
        $("#container").remove();
        $("body").append( "<div id='container'></div>");
    }
});
