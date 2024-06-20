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
- Max 1 peering per node
- Wireguard port is 20000 + last 4 of your ASN
- DN42 Dual-stack nodes
    - Multi-Protocol BGP
    - Extended Next Hop
- DN42 IPv6-only nodes
    - No IPv4 channel configured

Reach out to me on IRC (colby@hackint) or email (check the registry) to peer!

# External Services
- Looking Glass ([Clearnet](https://lg.dn42.derix.dev/), [DN42](https://lg.derix.dn42/))
- Uptime Monitor ([Clearnet](https://uptime.dn42.derix.dev/status/dn42))
- Metrics Monitor (coming soon)
- Anycasted authoritive DNS server for derix.dn42 (ns.derix.dn42)
- Anycasted DNS64 resolver & NAT64 gateway
    - NAT64 prefix: `fd93:6001:6ed9:6464::/96`
    - DNS64 resolver: `fd93:6001:6ed9:ffff::1`
    - No clearnet access

# Network Design
My DN42 network consists of two distinct types of nodes - those which are dual-stack (KVM-based), and IPv6-only (OpenVZ-based). Due to compromises in OpenVZ, IPv4 is not available on such nodes.

Babel (with automatic costs based on latency) over Wireguard is used as an IGP, and external routes are exchanged via iBGP.

Ansible is used to configure all nodes, and the configuration is available on [GitHub](https://github.com/Colbyjdx/dn42-ansible). This site is also generated from the Ansible inventory using Hugo, and the source is available on [GitHub](https://github.com/Colbyjdx/dn42-homepage).
