"use strict";

new Vue({
    el: '#auth-form',
    data: {
        email: 'fernando@baroni.tech'
    },
    methods: {
        authenticate: function(event) {
            this.$http.post(
                    '/api/auth',
                    {email: this.email}).then(
                        (response) => {
                            alert(response.body.good); 
                        },
                        (error) => {
                            alert(response.body.bad); 
                        }
                    );
        }
    }
});
