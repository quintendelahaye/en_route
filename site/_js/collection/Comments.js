/*globals Comment:true*/
/*globals Settings:true*/

var Comments = Backbone.Collection.extend({
    model: Comment,
    url: Settings.API + "/comments"
});