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