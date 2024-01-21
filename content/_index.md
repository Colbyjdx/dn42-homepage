---
title: "COLBY-NET DN42 · AS4242422558"
description: "COLBY-NET DN42 - An experiment in global networking"
draft: "false"
---

# Node Map
{{< nodemap >}}

# Nodes
{{< nodetable >}}

# Peering
##### Peering preferences & info:
- Wireguard
- Link-local IPv6 address
- Reasonable latency
- Wireguard port is 20000 + last 4 of your ASN
- DN42 Dual-stack nodes
    - Multi-Protocol BGP
    - Extended Next Hop
- DN42 IPv6-only nodes
    - No IPv4 channel configured

Reach out to me on IRC (colby@hackint) to peer!

# External Services
- Looking Glass ([Clearnet](https://lg.dn42.derix.dev/), [DN42](https://lg.derix.dn42/))
- Uptime Monitor (coming soon)
- Metrics Monitor (coming soon)
- Authoritive DNS servers for derix.dn42 (ns1.derix.dn42\, ns2.derix.dn42)

# Network Design
My DN42 network consists of two distinct types of nodes - those which are dual-stack (KVM-based), and IPv6-only (OpenVZ-based). Due to compromises in OpenVZ, IPv4 is not available on such nodes.

Babel (with automatic costs based on latency) over Wireguard is used as an IGP, and external routes are exchanged via iBGP.

Ansible is used to configure all nodes, and the configuration is available on [GitHub](https://github.com/Colbyjdx/dn42-ansible). This site is also generated from the Ansible inventory using Hugo, and the source is available on [GitHub](https://github.com/Colbyjdx/dn42-homepage).