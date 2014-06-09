% This script sets up the environment for MLE+.
% It should be modified to the actual settings of the computer,
% including path to BCVTB, EnergyPlus, etc.
% Run this script once before using any MLE+ functions.
% Generally, this is only necessary on Windows machines.  On
% Linux/MacOS, the default settings often work.
%
% (C) 2011 by Truong X. Nghiem (nghiem@seas.upenn.edu)

% Last update: 2011-07-13 by Truong X. Nghiem

global MLEPSETTINGS

if ispc
    % Windows
    MLEPSETTINGS = struct(...
        'version', 2,...   % Version of the protocol
        'program', 'C:\bcvtb\bin\RunEPlus.bat',...   % Path to the program to run EnergyPlus
        'bcvtbDir', 'C:\bcvtb',...   % Path to BCVTB installation
        'execcmd', 'system'...   % Use the system command to execute E+
    );

    MLEPSETTINGS.env = {...
        {'ENERGYPLUS_DIR', 'C:\EnergyPlusV6-0-0'},...  % Path to the EnergyPlus
        {'PATH', 'C:\Program Files (x86)\Java\jre6\bin;C:\EnergyPlusV6-0-0'}...  % System path, should include E+ and JRE
    };
else
    % Mac and Linux
    MLEPSETTINGS = struct(...
        'version', 2,...   % Version of the protocol
        'program', '/Applications/EnergyPlus-8-1-0/runenergyplus',...   % Path to the program to run EnergyPlus
        'bcvtbDir', '/Users/truong/software/bcvtb',...   % Path to BCVTB installation
        'execcmd', 'java'...   % Use Java to execute E+
    );

    MLEPSETTINGS.env = {...
        {'ENERGYPLUS_DIR', '/Applications/EnergyPlus-8-1-0'},...  % Path to the EnergyPlus
    };
end