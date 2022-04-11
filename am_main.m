%% INITIAL PARAMETERS
           fs = 16E3;                              % sampling frequency (Hz)
           fc = 8E3;                               % carrier frequency (Hz)
           duration = 10E3;                         % pure tone duration (ms)
           amplitude = 1;                          % pure tone amplitude
           frequency = 2E3;                        % pure tone frequency (Hz)
           phase = 0;                              % pure tone phase (rad/sec)
           fade_duration = 250;                    % fade-in and fade-out duration (ms)
           fade_window = @(N)( hanning(N).^2 );    % fade-in and fade-out window function handle
        
%% DIALOGUE BOX

   %        params = inputdlg({
    %'Signal file save path',...
   % 'Sampling Rate for stimulus signal file (Hz)',...
   % 'Pure-tone onset time (s)',...
   % 'Pure-tone duration (duration of each pulse) (ms)',...
   % 'ISI: time between pure-tone pulses (ms)',...
   % 'Number of pure-tone pulses',...
   % 'Time after last pure-tone pulse until end of signal (ms)',...
   % 'Tone ramp type ("linear" or "sinSquared")',...
   % 'Tone ramp time (ms)',...
   % 'Pure-tone stimulus amplitude (dB) (comma separated list)'},...
   % 'Stimulus Parameters (frequencies defined in calibration file)',...
   % [1 120],defPinput);

%% GENERATING THE AMPLITUDE MODULATED PLOT
           % generate a amplitude modulated tone
           [ tone, time ] = am_generator( fs, fc, duration, amplitude, frequency, phase, fade_duration, fade_window );
           % plot generated tones
           figure( 'Position', [ 10 10 600 800 ], 'PaperPositionMode', 'auto', 'color', 'w');    
           
           % plot the pure tone
           subplot( 2,1,1 );
           plot( time, tone );
           xlim( [ min(time) max(time) ] );
           ylim( [ min(tone)-0.25*max(tone) 1.25*max(tone) ] );
           xlabel( 'Time (s)' );
           ylabel( 'Amplitude' );
           title( sprintf('Amplitude Modulated Tone: %0.0f Hz',frequency) );
           set( gca, 'box', 'off' ); 
%% SAVING THE .SIGNAL FILE