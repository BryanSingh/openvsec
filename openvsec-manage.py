#!/usr/bin/env python

from subprocess import call
import os
import yaml
import argparse

parser = argparse.ArgumentParser(description="Manage VMs that are built for specific roles and theaters")
parser.add_argument('action', help='action to perform: up/down/destroy/status')
parser.add_argument('theater', help='theater to act on')

args = parser.parse_args()

if args.action not in ['up', 'down', 'destroy', 'status']:
    print "!! Invalid action:", args.action
    print
    parser.print_help()
    exit(1)

with open('sample-roles.yml', 'r') as rolefile:
    roles = yaml.load(rolefile)

if args.theater not in roles:
    print "!! Invalid role. These roles were found:", ', '.join(roles)
    print
    exit(1)

os.chdir("../theaters/%s" % args.theater)
if roles[args.theater]['type'] == 'one-user-per-vm':
    for user in roles[args.theater]['users']:
        os.environ['OPENVSEC_USERNAME'] = user
        os.environ['OPENVSEC_IP'] = roles[args.theater]['users'][user]
        if args.action == "up":
            call(["vagrant", "up"])
        elif args.action == "down":
            call(["vagrant", "down"])
        elif args.action == "destroy":
            call(["vagrant", "destroy"])
        elif args.action == "status":
            call(["vagrant", "status"])



