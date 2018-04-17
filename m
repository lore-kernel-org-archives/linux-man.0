From: Andrey Ignatov <rdna@fb.com>
Subject: Re: [PATCH bpf-next v3 7/8] bpf: add documentation for eBPF helpers
 (51-57)
Date: Tue, 17 Apr 2018 10:55:29 -0700
Message-ID: <20180417175529.GA68667@rdna-mbp.dhcp.thefacebook.com>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-8-quentin.monnet@netronome.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180417143438.7018-8-quentin.monnet@netronome.com>
Sender: netdev-owner@vger.kernel.org
To: Quentin Monnet <quentin.monnet@netronome.com>
Cc: daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org, oss-drivers@netronome.com, linux-doc@vger.kernel.org, linux-man@vger.kernel.org, Lawrence Brakmo <brakmo@fb.com>, Yonghong Song <yhs@fb.com>, Josef Bacik <jbacik@fb.com>
List-Id: linux-man@vger.kernel.org

Quentin Monnet <quentin.monnet@netronome.com> [Tue, 2018-04-17 07:36 -0700]:
> Add documentation for eBPF helper functions to bpf.h user header file.
> This documentation can be parsed with the Python script provided in
> another commit of the patch series, in order to provide a RST document
> that can later be converted into a man page.
> 
> The objective is to make the documentation easily understandable and
> accessible to all eBPF developers, including beginners.
> 
> This patch contains descriptions for the following helper functions:
> 
> Helpers from Lawrence:
> - bpf_setsockopt()
> - bpf_getsockopt()
> - bpf_sock_ops_cb_flags_set()
> 
> Helpers from Yonghong:
> - bpf_perf_event_read_value()
> - bpf_perf_prog_read_value()
> 
> Helper from Josef:
> - bpf_override_return()
> 
> Helper from Andrey:
> - bpf_bind()
> 
> v3:
> - bpf_perf_event_read_value(): Fix time of selection for perf event type
>   in description. Remove occurences of "cores" to avoid confusion with
>   "CPU".
> - bpf_bind(): Remove last paragraph of description, which was off topic.
> 
> Cc: Lawrence Brakmo <brakmo@fb.com>
> Cc: Yonghong Song <yhs@fb.com>
> Cc: Josef Bacik <jbacik@fb.com>
> Cc: Andrey Ignatov <rdna@fb.com>
> Signed-off-by: Quentin Monnet <quentin.monnet@netronome.com>
> 
> fix patch 7: Yonghong and Andrey
> ---
>  include/uapi/linux/bpf.h | 178 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 178 insertions(+)
> 
> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> index dd79a1c82adf..350459c583de 100644
> --- a/include/uapi/linux/bpf.h
> +++ b/include/uapi/linux/bpf.h
> + *
> + * int bpf_bind(struct bpf_sock_addr_kern *ctx, struct sockaddr *addr, int addr_len)
> + * 	Description
> + * 		Bind the socket associated to *ctx* to the address pointed by
> + * 		*addr*, of length *addr_len*. This allows for making outgoing
> + * 		connection from the desired IP address, which can be useful for
> + * 		example when all processes inside a cgroup should use one
> + * 		single IP address on a host that has multiple IP configured.
> + *
> + * 		This helper works for IPv4 and IPv6, TCP and UDP sockets. The
> + * 		domain (*addr*\ **->sa_family**) must be **AF_INET** (or
> + * 		**AF_INET6**). Looking for a free port to bind to can be
> + * 		expensive, therefore binding to port is not permitted by the
> + * 		helper: *addr*\ **->sin_port** (or **sin6_port**, respectively)
> + * 		must be set to zero.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.

Acked-by: Andrey Ignatov <rdna@fb.com>
for bpf_bind() helper.

-- 
Andrey Ignatov
