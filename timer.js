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
        if(timediff >= 600000) { //10 min = 600000
            lapdetails.value += 'time up';
            startstop();
        }
        timer.value = formattedtime(timediff);
        refresh = setTimeout('timecounter(' + starttime +');',10)
    }
    else {
        window.clearTimeout(refresh);
        stoptime = timediff;
    }
}

function marklap() {
    if(state == 1) {
        // if(lapdate != '') {
        //     var lapold = lapdate.split(':');
        //     var lapnow = timer.value.split(':');
        //     var laps = new Array();
        //     for (var i = 0; i < lapold.length; i++) {
        //         laps[i] = new Array();
        //         laps[i][0] = lapold[i]*1; // store old lap
        //         laps[i][1] = lapnow[i]*1; // store new lap
        //     }
        //     if(laps[1][1] < laps[1][0]) { // if new lap < old lap
        //         laps[1][1] += 60;
        //         laps[0][1] -= 1;
        //     }
        //     if(laps[2][1] < laps[2][0]) {
        //         laps[2][1] += 10;
        //         laps[1][1] -= 1;
        //     }
        //     var mzereos = (laps[0][1] - laps[0][0]) < 10?'0':'';
        //     var szeroes = (laps[1][1] - laps[1][0]) <10?'0':'';
        //     lapdetails.value += '\t+' + mzereos + (laps[0][1] - laps[0][0]) + ':' 
        //     + szeros + (laps[1][1] - laps[1][0]) + ':' 
        //        + (laps[2][1] - laps[2][0]) + '\n';
        // }
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