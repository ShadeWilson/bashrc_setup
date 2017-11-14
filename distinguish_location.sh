#!/bin/bash

# this may be a bit hacky but it works for me
# may need to be adjusted in future

# Way to tell if on cluster or not, so home is sourced correctly for each

distingiush_location() {
  case $(uname -p) in
    'x86_64')   HOME='/homes/'"$USER";; # if on cluster
    'unknown')  HOME='/h';; # if on git bash
    *)          HOME='/h';; # this could prob be improved, defaulting to /h
  
  cd # change to newly defined home directory
  
}


