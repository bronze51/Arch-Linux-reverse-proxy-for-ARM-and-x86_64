# Arch-Linux-reverse-proxy-for-ARM-and-x86_64
Arch Linux reverse proxy for ARM/Raspberry Pi and x86_64, incl WSL

## Background
I have 2 Raspberry Pis, each running Arch Linux (https://archlinuxarm.org/), and several PCs running Arch (incl. Arch on WSL). (Because of the quarantine) I decided to reduce the load on the Arch servers and cache updated packages locally (on a RPi), for Arch running on RPi and PC.
## Instructions
I applied the instructions from the Arch wiki for [Dynamic reverse proxy cache using nginx](https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Dynamic_reverse_proxy_cache_using_nginx), modifying the linked nginx pacman cache config.

As packages for Arch Linux on RPi and Arch Linux on x86_64 cannot be interchanged, I modified the location directives by matching the query with either `/armv7h/` or `/archlinux/`. This match would determine the architecture of the system making the pacman query, `/armv7h/` for RPi and `/archlinux/` for x86_64. Inside these location directive blocks, processing would continue as described in the wiki section referenced above. 

Please see my nginx.conf in this folder as an example.
## Caution
1. Update the server_name
2. Update the proxy_pass directive with preferred mirrors that have the same $request_uri structure
3. Overtime you may find your preferred mirrors may need to be updated
4. If you add a http mirror, it may redirect to https. Note that these instructions do not handle redirections well.
## Further work
1. Handle redirections.
2. Automatically update the mirrors.
