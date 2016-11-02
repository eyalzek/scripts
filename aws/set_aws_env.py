#!/usr/bin/env python
import argparse
from getpass import getpass
import gnomekeyring as gk

def unlock_keyring():
    passwd = getpass("Enter keyring password\n")
    gk.unlock_sync("AWS", passwd)

def get_items(env):
    item_ids = gk.list_item_ids_sync("AWS")
    items = [gk.item_get_info_sync("AWS", item_id) for item_id in item_ids]
    return [item.get_secret() for item in items if env in item.get_display_name()]

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("env", help="AWS env to load credentials for")
    args = parser.parse_args()
    unlock_keyring()
    env_vars = get_items(args.env)[0].replace(";", " ")
    gk.lock_sync("AWS")
    print("export %s && echo 'setting %s env'" % (env_vars, args.env))


if __name__ == "__main__":
    main()
