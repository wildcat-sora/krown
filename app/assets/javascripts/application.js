// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// 2020/7/9 "require_tree"にしているにもかかわらずjqueryが動作しないため、追記(順番大事)

//= require vue
// 順番が大事

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require data-confirm-modal


new Vue({
    el: '#app',
    data: {
        number: 0,
        x:0,
        y:0,
        z:0,
    },
    methods: {
        countUp: function(times){
            this.number += 1 * times
        },
        changeMousePosition: function(event,divideNumber){
            console.log(event);
            this.x = event.clientX;
            this.y = event.clientY;
            this.z = divideNumber;
        },
        myAlert(){
            alert('アラート');
        }
    }
})







