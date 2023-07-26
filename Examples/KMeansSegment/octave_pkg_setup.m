if(0 == length(pkg('list', 'statistics')))
    printf("\tInstalling statistics");
    pkg('install', 'https://github.com/gnu-octave/statistics/archive/refs/tags/release-1.5.0.tar.gz');
end
pkg('load', 'statistics');

if(0 == length(pkg('list', 'image')))
    printf("\tInstalling image");
    pkg('install', '-forge', 'image');
end
pkg('load', 'image');

