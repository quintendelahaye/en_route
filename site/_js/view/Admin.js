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