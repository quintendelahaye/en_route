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