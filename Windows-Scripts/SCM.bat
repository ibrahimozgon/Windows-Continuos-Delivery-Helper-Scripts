::::We use this for updating mercurial source control to last revision
::%1 repo location
::%2 branch name

cd %1
CALL hg revert --all
CALL hg update %2
CALL hg pull
CALL hg update %2