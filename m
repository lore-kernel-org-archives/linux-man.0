From: Quentin Monnet <quentin.monnet@netronome.com>
Subject: [RFC bpf-next v2 7/8] bpf: add documentation for eBPF helpers (51-57)
Date: Wed, 11 Apr 2018 16:45:12 +0100
Message-ID: <ae82c204-71cb-f575-c4b0-61e15cf94f7b@netronome.com>
References: <20180410144157.4831-1-quentin.monnet@netronome.com>
 <20180410144157.4831-8-quentin.monnet@netronome.com>
 <20180410175015.GA6762@rdna-mbp.dhcp.thefacebook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180410175015.GA6762@rdna-mbp.dhcp.thefacebook.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Andrey Ignatov <rdna@fb.com>
Cc: daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org, oss-drivers@netronome.com, linux-doc@vger.kernel.org, linux-man@vger.kernel.org, Lawrence Brakmo <brakmo@fb.com>, Yonghong Song <yhs@fb.com>, Josef Bacik <jbacik@fb.com>
List-Id: linux-man@vger.kernel.org

2018-04-10 10:50 UTC-0700 ~ Andrey Ignatov <rdna@fb.com>
> Quentin Monnet <quentin.monnet@netronome.com> [Tue, 2018-04-10 07:43 -0700]:
>> + * int bpf_bind(struct bpf_sock_addr_kern *ctx, struct sockaddr *addr, int addr_len)
>> + * 	Description
>> + * 		Bind the socket associated to *ctx* to the address pointed by
>> + * 		*addr*, of length *addr_len*. This allows for making outgoing
>> + * 		connection from the desired IP address, which can be useful for
>> + * 		example when all processes inside a cgroup should use one
>> + * 		single IP address on a host that has multiple IP configured.
>> + *
>> + * 		This helper works for IPv4 and IPv6, TCP and UDP sockets. The
>> + * 		domain (*addr*\ **->sa_family**) must be **AF_INET** (or
>> + * 		**AF_INET6**). Looking for a free port to bind to can be
>> + * 		expensive, therefore binding to port is not permitted by the
>> + * 		helper: *addr*\ **->sin_port** (or **sin6_port**, respectively)
>> + * 		must be set to zero.
>> + *
>> + * 		As for the remote end, both parts of it can be overridden,
>> + * 		remote IP and remote port. This can be useful if an application
>> + * 		inside a cgroup wants to connect to another application inside
>> + * 		the same cgroup or to itself, but knows nothing about the IP
>> + * 		address assigned to the cgroup.
> 
> The last paragraph ("As for the remote end ...") is not relevant to
> bpf_bind() and should be removed. It's about sys_connect hook itself
> that can call to bpf_bind() but also has other functionality (and that
> other functionality is described by this paragraph).

Thanks Andrey, I will remove this paragraph.

Quentin
