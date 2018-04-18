From: Martin KaFai Lau <kafai@fb.com>
Subject: Re: [PATCH bpf-next v3 6/8] bpf: add documentation for eBPF helpers
 (42-50)
Date: Wed, 18 Apr 2018 16:42:04 -0700
Message-ID: <20180418234202.abrxhspxegdkhunv@kafai-mbp>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
 <20180417143438.7018-7-quentin.monnet@netronome.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180417143438.7018-7-quentin.monnet@netronome.com>
Sender: netdev-owner@vger.kernel.org
To: Quentin Monnet <quentin.monnet@netronome.com>
Cc: daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org, oss-drivers@netronome.com, linux-doc@vger.kernel.org, linux-man@vger.kernel.org, Kaixu Xia <xiakaixu@huawei.com>, Sargun Dhillon <sargun@sargun.me>, Thomas Graf <tgraf@suug.ch>, Gianluca Borello <g.borello@gmail.com>, Chenbo Feng <fengc@google.com>
List-Id: linux-man@vger.kernel.org

On Tue, Apr 17, 2018 at 03:34:36PM +0100, Quentin Monnet wrote:
[...]
> @@ -965,6 +984,17 @@ union bpf_attr {
>   * 	Return
>   * 		0 on success, or a negative error in case of failure.
>   *
> + * int bpf_skb_under_cgroup(struct sk_buff *skb, struct bpf_map *map, u32 index)
> + * 	Description
> + * 		Check whether *skb* is a descendant of the cgroup2 held by
> + * 		*map* of type **BPF_MAP_TYPE_CGROUP_ARRAY**, at *index*.
> + * 	Return
> + * 		The return value depends on the result of the test, and can be:
> + *
> + * 		* 0, if the *skb* failed the cgroup2 descendant test.
> + * 		* 1, if the *skb* succeeded the cgroup2 descendant test.
> + * 		* A negative error code, if an error occurred.
> + *
[...]
> + * int bpf_xdp_adjust_head(struct xdp_buff *xdp_md, int delta)
> + * 	Description
> + * 		Adjust (move) *xdp_md*\ **->data** by *delta* bytes. Note that
> + * 		it is possible to use a negative value for *delta*. This helper
> + * 		can be used to prepare the packet for pushing or popping
> + * 		headers.
> + *
> + * 		A call to this helper is susceptible to change data from the
> + * 		packet. Therefore, at load time, all checks on pointers
> + * 		previously done by the verifier are invalidated and must be
> + * 		performed again.
> + * 	Return
> + * 		0 on success, or a negative error in case of failure.
> + *
LGTM. Thanks!

Acked-by: Martin KaFai Lau <kafai@fb.com>
