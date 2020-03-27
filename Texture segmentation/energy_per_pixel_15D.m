function [energy_15D] = energy_per_pixel_15D(energy_out)

% energy_out = energy_out';

energy_15D(:,:,1) = energy_out(:,:,1);
%LE EL
energy_15D(:,:,2) = .5*energy_out(:,:,2) + 5*energy_out(:,:,6);
%LS SL
energy_15D(:,:,3) = .5*energy_out(:,:,3) + 5*energy_out(:,:,11);
%LW WL
energy_15D(:,:,4) = .5*energy_out(:,:,4) + 5*energy_out(:,:,16);
%LR RL
energy_15D(:,:,5) = .5*energy_out(:,:,5) + 5*energy_out(:,:,21);
%EE
energy_15D(:,:,6) = energy_out(:,:,7);
%ES SE
energy_15D(:,:,7) = .5*energy_out(:,:,8) + 5*energy_out(:,:,12);
%EW WE
energy_15D(:,:,8) = .5*energy_out(:,:,9) + 5*energy_out(:,:,17);
%ER RE
energy_15D(:,:,9) = .5*energy_out(:,:,10) + 5*energy_out(:,:,22);
%SS
energy_15D(:,:,10) = energy_out(:,:,13);
%SW WS
energy_15D(:,:,11) = .5*energy_out(:,:,14) + 5*energy_out(:,:,18);
%SR RS
energy_15D(:,:,12) = .5*energy_out(:,:,15) + 5*energy_out(:,:,23);
%WW
energy_15D(:,:,13) = energy_out(:,:,19);
%WR RW
energy_15D(:,:,14) = .5*energy_out(:,:,20) + 5*energy_out(:,:,24);
%RR
energy_15D(:,:,15) = energy_out(:,:,25);

% energy_15D = energy_15D';

end

