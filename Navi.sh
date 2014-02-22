#!/bin/bash
hcitool scan | grep -o '\([0-9a-fA-F]\{2\}:\)\{5\}[0-9a-fA-F]\{2\}'
