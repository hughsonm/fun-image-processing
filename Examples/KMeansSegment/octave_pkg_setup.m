required_pkgs = {'image', 'statistics'};

for ii = 1:length(required_pkgs)
    req_pkg = required_pkgs{ii};
    printf("Checking for package named %s\n", req_pkg);
    if(0 == length(pkg('list', req_pkg)))
        printf("\tIt does not exist. Installing %s\n", req_pkg);
        pkg('install', '-forge', req_pkg)
        printf("\tDone installing %s\n", req_pkg);
    end
    printf("Loading %s\n", req_pkg);
    pkg('load', req_pkg)
end