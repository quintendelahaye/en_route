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