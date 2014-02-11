var route = Ember.Route.extend({
  model: function() {
    return this.store.find('task');
  },
  afterModel: function(tasks, transition) {
    if (tasks.get('length') === 0) {
      this.transitionTo('getting_started');
    } else if (transition.targetName == "tasks.index") {
      if($(document).width() > 700) {
        this.transitionTo('task', tasks.get('firstObject'));
      } else {
        if (window.navigator.standalone) {
          this.transitionTo('mobileTasks');
        } else {
          this.transitionTo('addToHomeScreen');
        }
      }
    }
  }
});

module.exports = route;
