#!/usr/bin/env python3

import sys
import time
import psutil
import subprocess


POLL_MILLISECONDS = 100


def get_idletime():
    return int(subprocess.check_output(["xprintidle"]))


def kill_all(pid):
    parent = psutil.Process(pid)
    for child in parent.children(recursive=True):
        child.kill()
    parent.kill()


def main():
    last_idletime = 0
    p = subprocess.Popen(sys.argv[1:])

    while p.poll() is None:
        # process is alive

        current_idletime = get_idletime()

        if current_idletime < last_idletime:
            kill_all(p.pid)
            p.wait()
            break

        last_idletime = current_idletime
        time.sleep(POLL_MILLISECONDS / 1000.)


if __name__ == "__main__":
    main()
