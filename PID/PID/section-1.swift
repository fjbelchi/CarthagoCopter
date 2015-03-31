// Playground - noun: a place where people can play

import UIKit

/*working variables*/
var lastTime = NSDate().timeIntervalSince1970 - 1
var Input = 20.0, Output = 0.0, Setpoint = 0.0
var errSum = 0.0, lastErr = 0.0
var kp = 1.0, ki = 0.0, kd = 0.0

func compute()
{
    /*How long since we last calculated*/
    let now = NSDate().timeIntervalSince1970;
    let timeChange = (now - lastTime);
    
    /*Compute all the working error variables*/
    let error = Setpoint - Input;
    errSum += (error * timeChange);
    let dErr = (error - lastErr) / timeChange;
    
    /*Compute PID Output*/
    Output = kp * error + ki * errSum + kd * dErr;
    
    /*Remember some variables for next time*/
    lastErr = error
    lastTime = now
}

func setTunings(Kp:Double, Ki:Double, Kd:Double)
{
    kp = Kp;
    ki = Ki;
    kd = Kd;
}

for (var i=0; i<10; i++) {
    compute()
    sleep(1)
    Output
    if(i == 1) {
        Input = 15
    }
    if (i == 3) {
        Input = 10
    }
    
    if (i == 5) {
        Input = 5
    }
    if (i == 7) {
        Input = 0
    }
}
