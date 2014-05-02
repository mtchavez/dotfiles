import atexit
import os
import readline
import rlcompleter

# change autocomplete to tab
readline.parse_and_bind("tab: complete")

history_path = os.path.expanduser("~/.pyhistory")


def save_history(history_path=history_path):
    import readline
    readline.write_history_file(history_path)

if os.path.exists(history_path):
    try:
        readline.read_history_file(history_path)
    except Exception, e:
        print("Failed to load history file: %s\nReason: %s" % (history_path, e))

atexit.register(save_history)

# anything not deleted (sys and os) will remain in the interpreter session
del atexit, readline, rlcompleter, save_history, history_path
