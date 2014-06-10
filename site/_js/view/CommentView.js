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