(function(){

var Settings = (function(){

    function Settings(){

    }

    Settings.base = "http://localhost";
    Settings.path = "/2013-2014/RMDII/oefenen_eindExamens/2DEV1_KristienVanwilderode_RMD2_EXAMEN";
    Settings.API = Settings.base + Settings.path + "/api";

    return Settings;

})();

/*globals Settings:true*/

var Comment = Backbone.Model.extend({
    defaults: {
        approved: 0
    },

    urlRoot: Settings.API + "/comments"
});

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


/*globals Comment:true*/
/*globals Settings:true*/

var Comments = Backbone.Collection.extend({
    model: Comment,
    url: Settings.API + "/comments"
});

/* globals Settings:true */
/* globals Comments:true */
/* globals AdminCommentsView:true */

var Admin = Backbone.View.extend({
    tagName: 'div',
    className: 'admin',
    template: tpl.admin,

    initialize: function(){
        _.bindAll.apply(_, [this].concat(_.functions(this)));
        this.loadComments();
    },

    loadComments: function(){
        this.comments = new Comments();
        this.comments.fetch();
        this.adminCommentsView = new AdminCommentsView({collection: this.comments});
    },

    render: function(){
        this.$el.html(this.template);
        this.$el.append(this.adminCommentsView.render().$el);
        return this;
    }

});

/* globals Settings:true */
/* globals Comment:true */

var AdminCommentView = Backbone.View.extend({
    tagName: 'div',
    template: tpl.admincomment,


    initialize: function(){
        _.bindAll.apply(_, [this].concat(_.functions(this)));
        this.model.on("sync reset", this.render);
    },

    render: function(){
        this.$el.html(this.template(this.model.toJSON()));
        return this;
    }

});

/* globals Settings:true */
/* globals Comment:true */
/* globals AdminCommentView:true */

var AdminCommentsView = Backbone.View.extend({
    tagName: 'ul',
    className: 'scomments',
    template: tpl.admincomments,

    events:{
        "click .approve": "approveClicked",
        "click .deny": "denyClicked"
    },

    approveClicked: function(e){
        e.preventDefault();
        console.log("approved");
        this.approvedId = ($(e.target)).parent().attr("approved-id");
        this.comment = new Comment({id: this.approvedId});
        this.comment.set("approved", 1);
        this.comment.save();
        this.collection.fetch();
    },

    denyClicked: function(e){
        e.preventDefault();
        console.log("denied");
        this.approvedId = ($(e.target)).parent().attr("approved-id");
        this.comment = new Comment({id: this.approvedId});
        this.comment.set("approved", 0);
        this.comment.save();
        this.collection.fetch();
    },

    initialize: function(){
        _.bindAll.apply(_, [this].concat(_.functions(this)));
        this.collection.on("sync reset", this.render);
    },

    renderAdminComment: function(admincomment){
        var adminCommentView = new AdminCommentView({model: admincomment});
        admincomment.view = adminCommentView;
        this.$el.append(adminCommentView.render().$el);
    },

    render: function(){
        this.$el.html(this.template());
        this.collection.each(function(admincomment){
            this.renderAdminComment(admincomment);
        }, this);
        return this;
    }

});

/* globals Settings:true */
/* globals CommentsView:true */
/* globals Comments:true */

var Client = Backbone.View.extend({
    tagName: 'div',
    className: 'client',
    template: tpl.client,

    initialize: function(){
        _.bindAll.apply(_, [this].concat(_.functions(this)));
        this.loadComments();
    },

    loadComments: function(){
        this.comments = new Comments();
        this.comments.fetch();
        this.commentsView = new CommentsView({collection: this.comments});
    },

    render: function(){
        this.$el.html(this.template);
        this.$el.append(this.commentsView.render().$el);
        return this;
    }

});

/* globals Settings:true */
/* globals Comment:true */

var CommentView = Backbone.View.extend({
    tagName: 'li',
    template: tpl.comment,

    initialize: function(){
        _.bindAll.apply(_, [this].concat(_.functions(this)));
        this.model.on("sync reset", this.render);
    },

    render: function(){
        this.$el.html(this.template(this.model.toJSON()));
        return this;
    }

});

/* globals Settings:true */
/* globals Comment:true */
/* globals CommentView:true */

var CommentsView = Backbone.View.extend({
    tagName: 'section',
    className: 'approved_comments',
    template: tpl.comments,
    events: {
        "click #add": "addClicked"
    },

    initialize: function(){
        _.bindAll.apply(_, [this].concat(_.functions(this)));
        this.collection.on("sync reset", this.render);
    },

    addClicked: function(e){
        e.preventDefault();
        this.comment = new Comment();
        this.comment.set("comment", ($(e.target)).parent().find("#comment").val());
        this.comment.save();
        this.collection.add(this.comment);
    },

    renderComment: function(comment){
        var commentView = new CommentView({model: comment});
        comment.view = commentView;
        this.$el.append(commentView.render().$el);
    },

    render: function(){
        this.$el.html(this.template());
        this.collection.each(function(comment){
            if(comment.attributes.approved === "1"){
                this.renderComment(comment);
            }
        }, this);
        return this;
    }

});

Handlebars.registerHelper("format_approved", function(boolean){
    if(boolean === "0"){
        return "denied";
    }else{
        return "approved";
    }
});

/* globals AppRouter:true */

var router = new AppRouter();
Backbone.history.start();

})();