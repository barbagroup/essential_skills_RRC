# Required software for workshop

This workshop/material was designed for Linux or OSX operating systems.
The following installation requirements do not consider the case of a Windows OS.

# Python

- Anaconda Python Distribution (Python 3): https://www.continuum.io/downloads
  
- After install, open a terminal and execute the following:

`conda install jupyter ipython numpy sympy scipy matplotlib dask numba pytest`

`pip install line_profiler`

`conda install -c conda-forge xonsh`

# *nix

Using whichever linux package manager, open a terminal and install:

- `htop`
- `ack`
- `nano`
- `git`

If you are in a Linux OS an option is `sudo apt-get install htop ack nano git`. 

If you are in OSX you will need to install [homebrew](http://brew.sh/) 
and then you will execute`brew install htop ack nano git`.
