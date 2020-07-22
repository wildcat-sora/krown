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