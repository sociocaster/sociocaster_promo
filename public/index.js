// Enable pusher logging - don't include this in production
//Pusher.logToConsole = true;

var pusher = new Pusher('493f2e115f71fc5eff1c', {
    cluster: 'ap1',
    encrypted: true
});

var channel = pusher.subscribe('sociocaster_promo_channel');

// Initialize Firebase
var config = {
    apiKey: "AIzaSyDDTRnFGfaP7vdQLbf5WtZUIvxA2tlFSYE",
    authDomain: "sociocaster-e0521.firebaseapp.com",
    databaseURL: "https://sociocaster-e0521.firebaseio.com",
    storageBucket: "sociocaster-e0521.appspot.com",
    messagingSenderId: "208954472182"
};
firebase.initializeApp(config);

function Obs() {


    riot.observable(this)


}

// make a new Car instance
var obs = new Obs()



var database = firebase.database();
var gifts = ['cordholders', 'cordholders', 'cordholders', 'cordholders', 'cordholders', 'cordholders', 'cordholders', 't-shirts', 'cordholders', 'cordholders', 'cordholders', 'mugs', 'cordholders', ]
var realtimeGifts = database.ref('gifts')
var realtimeParticipants = database.ref('participants')
var quota = {}
var participants = []


realtimeGifts.on('value', function (snapshot) {
    if (snapshot.val())
        quota = snapshot.val()
    console.log(quota)
    obs.trigger('quota_updated', quota)
})

realtimeParticipants.orderByChild('created_at').on('value', function (snapshot) {
    participants = []
    if (snapshot.val()) {

        snapshot.forEach((participantSnap) => {
            var participant = participantSnap.val()
            console.log(participantSnap.key + '=' + participant.name);
            participants.push(participant)
        });
    }
    console.log(participants)
    obs.trigger('participants_updated', participants)

})



channel.bind('like_event', function (data) {
    // console.log(data.name, data.fbid)
    var indexExists = participants.findIndex(function (elemenet) {
        return elemenet.fbid == data.fbid
    })
    if (indexExists < 0) {
        getgift: {
            var gift = gifts[Math.floor(Math.random() * gifts.length)]
            if (quota[gift] <= 0) break getgift

            var d = new Date();
            var n = d.getTime();

            var participant = {
                name: data.name,
                profile: 'https://facebook.com/' + data.fbid,
                gift: gift,
                fbid: data.fbid,
                created_at: -(n)
            }
            database.ref('participants/' + data.fbid).set(participant);

            obs.trigger('show_modal', participant)

            var modal = document.getElementById('modal_1')
            modal.checked = true


            var updates = {};
            updates['gifts/' + gift] = quota[gift] - 1
            database.ref().update(updates)
        }
    }
    else {
        console.log('already ')
    }

})




riot.mount('*', {
    obs: obs
})