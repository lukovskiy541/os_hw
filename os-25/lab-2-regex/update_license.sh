#!/bin/bash

grep -l "Version 1, February 1989" *.c | xargs sed -i 's/Version 1, February 1989/Version 2, June 1991/g'