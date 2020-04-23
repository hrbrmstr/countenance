
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/countenance.svg?branch=master)](https://travis-ci.org/hrbrmstr/countenance)  
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-3.2.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

# countenance

Tools to Work with the Pi-Hole API

## Description

Named after a primary synonym for ‘pihole’, tools are provided to access
the Pi-Hole API.

## What’s Inside The Tin

The following functions are implemented:

  - `pi_fwd_dest`: Get forward destinations (i.e. upstream DNS)
  - `pi_host`: Get or set PIHOLE\_HOST value
  - `pi_key`: Get PIHOLE\_API\_KEY value
  - `pi_over_time_10m`: Get recent 10 min time series counts
  - `pi_queries`: Get query types distribution
  - `pi_query_types`: Get query types distribution
  - `pi_recent`: Get recent blocked
  - `pi_summary`: Get summary stats
  - `pi_test`: Test connectivity to/get info about a Pi-Hole
  - `pi_top_clients`: Get top clients
  - `pi_top_items`: Get top items

## Installation

``` r
remotes::install_git("https://git.rud.is/hrbrmstr/countenance.git")
# or
remotes::install_git("https://git.sr.ht/~hrbrmstr/countenance")
# or
remotes::install_gitlab("hrbrmstr/countenance")
# or
remotes::install_github("hrbrmstr/countenance")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(countenance)

# current version
packageVersion("countenance")
## [1] '0.1.0'
```

## countenance Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | ---: | ----------: | ---: | -------: | ---: |
| R    |       15 | 0.94 | 207 | 0.96 |         119 | 0.89 |       90 | 0.76 |
| Rmd  |        1 | 0.06 |   8 | 0.04 |          15 | 0.11 |       28 | 0.24 |

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
