%% INITIAL PARAMETERS
           signalSavePath = 'D:\Documents\projects\project1b\tone_generator\signals';
           fs = 96E3;                              % sampling frequency (Hz)
           duration = 1E3;                         % pure tone duration (ms)
           amplitude = 1;                          % pure tone amplitude
           frequency = 8E3;                        % pure tone frequency (Hz)
           phase = 0;                              % pure tone phase (rad/sec)
           fade_duration = 250;                    % fade-in and fade-out duration (ms)
           fade_window = @(N)( hanning(N).^2 );    % fade-in and fade-out window function handle
        
%% DIALOGUE BOX
 %{ 
%add noise 1000 hz bandpassed 
%am with and without noise
    definput = {signalSavePath,num2str(fs),num2str(duration),num2str(amplitude),...
    num2str(frequency),num2str(phase),num2str(fade_duration)};
    params = inputdlg({
    'Signal file save path',...
    'Sampling Frequency (Hz)',...
    'Pure-tone duration (duration of each pulse) (ms)',...
    'Pure-tone stimulus amplitude (dB)',...
    'Pure-tone frequency (Hz)',...
    'Phase',...
    'Ramp time(ms)'},...
    [1 120],definput);
    fs = 

    %}

%% GENERATING THE PURE TONE PLOT
           % generate a pure tone
           [ tone, time ] = tone_generator( fs, duration, amplitude, frequency, phase, fade_duration, fade_window );
           % plot generated tones
           figure( 'Position', [ 10 10 600 800 ], 'PaperPositionMode', 'auto', 'color', 'w');    
           
           % plot the pure tone
           subplot( 2,1,1 );
           plot( time, tone );
           xlim( [ min(time) max(time) ] );
           ylim( [ min(tone)-0.25*max(tone) 1.25*max(tone) ] );
           xlabel( 'Time (s)' );
           ylabel( 'Amplitude' );
           title( sprintf('Pure tone: %0.0f Hz',frequency) );
           set( gca, 'box', 'off' ); 
%% SAVING THE .SIGNAL FILE
