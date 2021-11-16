#!/bin/bash
gunzip -c $1 | docker load
