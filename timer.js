var timer;
var state = 0;
var stoptime = 0;
var lapcounter = 0;
var current;
var lapdate = ""
var lapdetails;

function timecounter(starttime){
    currentdate = new Date();
    lapdetails = document.getElementById('lapdetails');
    timer = document.getElementById('timer');

    var timediff = currentdate.getTime() - starttime;
    if(state == 0) {
        timediff = timediff + stoptime;
    }
    if(state == 1) {
        var time = document.getElementById('time');
        if(timediff >= time.value*60*1000) { //10 min = 600000
            lapdetails.value += 'time up';
            startstop();
        }
        timer.value = formattedtime(timediff);
        refresh = setTimeout(timecounter, 10, starttime)
    }
    else {
        window.clearTimeout(refresh);
        stoptime = timediff;
    }
}

function marklap() {
    if(state == 1) {
        lapdate = timer.value;
        lapdetails.value += (++lapcounter) + '. ' + timer.value + '\n';
    }
}

function startstop() {
    var startstop = document.getElementById('startstopbutton');
    var startdate = new Date();
    var starttime = startdate.getTime();
    if(state == 0) {
        startstop.value = 'Stop';
        state = 1;
        timecounter(starttime);
    }
    else {
        startstop.value = 'Start';
        state = 0;
        lapdate = '';
    }
}


function reset() {
    lapdetails.value = '';
    lapcounter = 0;
    stoptime = 0;
    lapdate = '';
    window.clearTimeout(refresh);
    if(state == 1){
        var resetdate = new Date();
        var resettime = resetdate.getTime();
        timecounter(resettime);
    }
    else {
        timer.value = "0:0:0";
    }
}

function formattedtime(unformatted) {
    var decisecond = Math.floor(unformatted/100) + ''; // accurate to tenth of second
    var second = Math.floor(unformatted/1000) ;
    var minute = Math.floor(unformatted/60000);
    decisecond = decisecond.charAt(decisecond.length - 1);
    second = second - 60*minute + '';
    return minute + ':' + second + ':' + decisecond;
}