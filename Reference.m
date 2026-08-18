function [r, v, a] = Reference(t, ri, vi, t0, t1, th, tv, xh, yh, u1, u2)

gz = 1.63;
g = [0; 0; -gz];
amax = 2.486;
thetamax = deg2rad(20);
ah = amax*sin(thetamax);
av = amax*cos(thetamax);

if t < t0
    a = g;
    v = vi + t*g;
    r = ri + t*vi + 0.5*t^2*g;

elseif t < t0 + t1
    a = g - amax*u1;
    v = vi + t*g + amax*(t - t0)*u1;
    r = ri + t*vi + 0.5*t^2*g + 0.5*amax*(t - t0)^2*u1;

elseif t < t0 + th
    a = g - amax*u2;
    v = vi + t*g + amax*t1*u1 + amax*(t - t0 - t1)*u2;
    r = ri + t*vi + 0.5*t^2*g + amax*t1*(t - t0 - t1/2)*u1 + 0.5*amax*(t - t0 - t1)^2*u2;
    
else
    a = [0; 0; -gz + amax];
    v = [0; 0; vi(3) - t*gz + th*av + (t - t0 - th)*amax];
    r = [xh; yh; ri(3) + t*vi(3) + th*(t - t0 - th/2)*av + (t - t0 - th)^2*amax/2 - gz*t^2/2];
end