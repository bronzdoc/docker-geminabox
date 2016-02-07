#!/usr/bin/env bash

/bin/bash -c -l "rvm gemset use geminabox \
                 && rackup -o 0.0.0.0 -p 9292"
