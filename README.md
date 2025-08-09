# fedora atomic (bootc) images for aarch64
This project is exploring building bootc images for aarch64, specifically targeting the Apple M series chips supported by the Asahi Linux kernel.

# Status

pre-alpha. Just exploring what is possible now that (2025) aarch64 github action runners are widely available and fedora publishes aarch64-tagged base images in their official repo. Most discussions out there seem to be from before these runners and images were available (2023-2024) without more recent updates. If someone has already built this let me know so I don't waste my time (i enjoy it) down this rabbit hole. 

Installation won't be like typical Fedora Atomic desktops based on how Asahi's installer works. Typically the Fedora Atomics don't support advanced partitioning or dualboot setups so that'll be interesting on these macs as well. 
