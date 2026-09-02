% clear all; close all; clc;
% 
% ri = [80; 60; 3000];
% vi = [-2; -2; -10];

gz = 1.63;
g = [0; 0; -gz];

t0f = 0;
t1f = 0;
thf = 0;
tvf = 0;
dPsi = 0;

amax = 2.486;
thetamax = deg2rad(20);
ah = amax*sin(thetamax);
av = amax*cos(thetamax);
wi = vi(3);
wf = 0;
zf = 0;
tvs = 5;

t0 = 0;
t1 = 0;
th = 0;
tv = 0;

i = 0;

figure();
t0plot = animatedline('Color', 'b', 'Marker', 'o');
t1plot = animatedline('Color', 'r', 'Marker', 'o');
thplot = animatedline('Color', 'k', 'Marker', 'o');
tvplot = animatedline('Color', 'g', 'Marker', 'o');
title('Guidance Parameters Calculation');
ylabel('t_0, t_1, t_h, t_v (s)');
xlabel('Iterations');
grid on;
legend('t_0', 't_1', 't_h', 't_v');
linkdata on;

while 1
    % calculate r0 and v0
    r0 = ri + t0*vi + 0.5*t0^2*g;
    v0 = vi + t0*g;
    
    counter = 0;
    
    % calculate t1 and th
    while 1
        th_k = real((t1/2) + sqrt(t1^2/4 + sqrt((t1*v0(1) + 2*r0(1))^2 + (t1*v0(2) + 2*r0(2))^2) / ah));
        
        A1 = ah^2*th^2 - v0(1)^2 - v0(2)^2;
        B1 = -2 * ((th*v0(1) + 2*r0(1))*v0(1) + (th*v0(2) + 2*r0(2))*v0(2));
        C1 = -((th*v0(1) + 2*r0(1))^2 + (th*v0(2) + 2*r0(2))^2);
    
        t1_k = real((-B1 + sqrt(B1^2 - 4*A1*C1)) / (2*A1));
        
        t1_k1 = 0.9 * t1 + 0.1 * t1_k;
        th_k1 = 0.9 * th + 0.1 * th_k;

        if (abs(th_k - th) < 1e-3) && (abs(t1_k - t1) < 1e-3)
            th = th_k1;
            t1 = t1_k1;
            % thf = th;
            % t1f = t1;
            break
        end
    
        th = th_k1;
        t1 = t1_k1;
    end
    
    if counter == 0
        psig = atan2(t1*v0(2) + 2*r0(2), t1*v0(1) + 2*r0(1)) + dPsi;
        Rz = [cos(psig) sin(psig) 0; -sin(psig) cos(psig) 0; 0 0 1];
        counter = 1;
    end
    
    Av = 0.5 * amax * (1 - amax/gz);
    Bv = (1 - amax/gz)*av*th + amax*wf/gz;
    Cv = -(0.5/gz) * (av^2*th^2 - 2*wf*av*th + wf^2 - wi^2) + (0.5*av*th^2) + (ri(3) - zf);
    
    Q = Av*tvs^2 + Bv*tvs + Cv;
    
    if Q >= 0
        tv = (-Bv - sqrt(Bv^2 - 4*Av*Cv)) / (2*Av);
        P = ((wi - wf) + (amax - gz)*tv + (av - gz)*th) / gz;
    
        if P >= 0
            t0 = P;
        else
            t0 = 0;
            tv = -(wi - wf + (av - gz)*th) / (amax - gz);
        end
    else
        tv = tvs;
        
        Ah = 0.5 * av * (1 - av/gz);
        Bh = -(av/gz) * ((amax - gz)*tvs - wf);
        Ch = 0.5 * amax * (1 - amax/gz)*tvs^2 + amax/gz*wf*tvs - 0.5/gz*(wf^2 - wi^2) + (ri(3) - zf);
    
        th = (-Bh - sqrt(Bh^2 - 4*Ah*Ch)) / (2*Ah);
    
        vg0 = Rz * v0;
    
        t1 = (2 * vg0(1) + sqrt(ah^2*th^2 - 2*vg0(1)*ah*th + vg0(1)^2)) / (2*ah);
        dPsi = vg0(2) / (ah*th);
        psig = atan2(t1*v0(2) + 2*r0(2), t1*v0(1) + 2*r0(1)) + dPsi;
        Rz = [cos(psig) sin(psig) 0; -sin(psig) cos(psig) 0; 0 0 1];
    
        P = ((wi - wf) + (amax - gz)*tv + (av - gz)*th) / gz;
    
        if P >= 0
            t0 = P;
        else
            t0 = 0;
            tv = -(wi - wf + (av - gz)*th) / (amax - gz);
        end
    end

    i = i + 1;
    addpoints(t1plot, i, t1);
    addpoints(t0plot, i, t0);
    addpoints(thplot, i, th);
    addpoints(tvplot, i, tv);
    drawnow;
    
    if (abs(th - thf) < 1e-5) && (abs(t1 - t1f) < 1e-5) && (abs(t0 - t0f) < 1e-5) && (abs(tv - tvf) < 1e-5)
        thf = th;
        t1f = t1;
        t0f = t0;
        tvf = tv;
        break
    end
    
    thf = th;
    t1f = t1;
    t0f = t0;
    tvf = tv;
end

psi1 = (atan2(-((t1 + th)*v0(2) + 2*r0(2)), -((t1 + th)*v0(1) + 2*r0(1))) - dPsi);
psi2 = (atan2(t1*v0(2) + 2*r0(2), t1*v0(1) + 2*r0(1)) - dPsi);

u1 = [cos(psi1)*sin(thetamax); sin(psi1)*sin(thetamax); cos(thetamax)];
u2 = [cos(psi2)*sin(thetamax); sin(psi2)*sin(thetamax); cos(thetamax)];

xh = r0(1) + v0(1)*th + 0.5*ah*t1*(2*th - t1)*cos(psi1) + 0.5*ah*(th - t1)^2 * cos(psi2)
yh = r0(2) + v0(2)*th + 0.5*ah*t1*(2*th - t1)*sin(psi1) + 0.5*ah*(th - t1)^2 * sin(psi2)