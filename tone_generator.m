function [ tone, time ] = tone_generator( sampling_frequency, duration, amplitudes, frequencies, phases, fade_durations, fade_windows )
    % sampling period (s)
    sampling_period = 1/sampling_frequency;

    % time vector
    time = [ 0:sampling_period:duration*1E-3 ];

    % generate separate tone (as row vectors)
    tone = diag( amplitudes ) * cos( 2*pi*diag(frequencies)*repmat(time,length(frequencies),1) + repmat(phases.',1,length(time)) ); 
    
    % combine sinusoid components
    tone = sum( tone, 1 );

    % return if fade-in and fade-out is not needed
    if nargin==5 || ( islogical(fade_durations) && fade_durations==false ), return; end;

    % fade signal boundaries
    tone = fade( tone, sampling_frequency, fade_durations, fade_windows );


% EOF
