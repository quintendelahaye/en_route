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