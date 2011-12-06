#!/bin/sh
ls -al ~/ | awk '$10=="->"{ print $9 $10 $11}'
