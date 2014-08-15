shuffle = function(array) {
    var m = array.length, t, i;

    // While there are remaining elements to shuffle
    while(m) {
        console.log("current loop:", m);

        // Pick a remaining element
        i = Math.floor(Math.random() * m--);
        console.log("random element:", i);

        // And swap it with the current element
        t = array[m];
        array[m] = array[i];
        array[i] = t;
    };

    return array;
};
