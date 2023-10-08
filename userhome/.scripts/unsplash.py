#!/bin/python3
import requests
import os

baseURL = "https://api.unsplash.com"

envname = "UNSPLASH_CLIENT_ID"
if not (envname in os.environ):
    exit(f"Please add {envname} to your environment")
clientId = os.environ[envname]

path = "~/.var/backgrounds/"
if not os.path.isdir(os.path.expanduser(path)):
    os.makedirs(os.path.expanduser(path))

payload = {
    "client_id": clientId,
    "orientation": "landscape",
    "query": "wallpaper dark"
}

response = requests.get(f"{baseURL}/photos/random", params=payload).json()
url = response["urls"]["raw"]
slug = response["slug"]

filename = f"{path}{slug}.jpg"

print(f"downloading {url} as {filename}...")

with open(os.path.expanduser(filename), "wb+") as file:
    file.write(requests.get(url).content)

print("Finished downloading, setting the image as the desktop-backgroud and giving it a download in return :)")
os.system(f"feh --bg-fill {filename}")
requests.get(response["links"]["download_location"], params={"client_id": clientId})
