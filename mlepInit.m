% This script sets up the environment for MLE+.
% It should be modified to the actual settings of the computer,
% including path to BCVTB, EnergyPlus, etc.
% Run this script once before using any MLE+ functions.
% Generally, this is only necessary on Windows machines.  On
% Linux/MacOS, the default settings often work.
%
% (C) 2015 by Truong X. Nghiem (truong.nghiem@gmail.com)

% Last update: 2015-10-20 by Truong X. Nghiem

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
elseif ismac
    % Mac
    MLEPSETTINGS = struct(...
        'version', 2,...   % Version of the protocol
        'program', '/Applications/EnergyPlus-8-4-0/runenergyplus',...   % Path to the program to run EnergyPlus
        'bcvtbDir', '/Users/truong/software/bcvtb',...   % Path to BCVTB installation
        'execcmd', 'system'...   % Use Java or the system command to execute E+
    );

    MLEPSETTINGS.env = {...
        {'ENERGYPLUS_DIR', '/Applications/EnergyPlus-8-4-0'},...  % Path to the EnergyPlus
    };
elseif isunix
    % Unix - Linux
    MLEPSETTINGS = struct(...
        'version', 2,...   % Version of the protocol
        'program', '/usr/bin/runenergyplus',...   % Path to the program to run EnergyPlus
        'bcvtbDir', '/usr/local/bcvtb',...   % Path to BCVTB installation
        'execcmd', 'system'...   % Use Java or the system command to execute E+
    );

    MLEPSETTINGS.env = {...
        {'ENERGYPLUS_DIR', '/usr/local/EnergyPlus-8-4-0'},...  % Path to the EnergyPlus
    };    
else
    error('Unsupported platform.');
end