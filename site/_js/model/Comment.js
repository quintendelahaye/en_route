/*globals Settings:true*/

var Comment = Backbone.Model.extend({
    defaults: {
        approved: 0
    },

    urlRoot: Settings.API + "/comments"
});