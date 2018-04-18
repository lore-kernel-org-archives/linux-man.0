From: Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: [PATCH bpf-next v3 8/8] bpf: add documentation for eBPF helpers
 (58-64)
Date: Wed, 18 Apr 2018 15:34:48 +0200
Message-ID: <20180418153448.574c6814@redhat.com>
References: <20180417143438.7018-1-quentin.monnet@netronome.com>
        <20180417143438.7018-9-quentin.monnet@netronome.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180417143438.7018-9-quentin.monnet@netronome.com>
Sender: netdev-owner@vger.kernel.org
To: Quentin Monnet <quentin.monnet@netronome.com>
Cc: brouer@redhat.com, daniel@iogearbox.net, ast@kernel.org, netdev@vger.kernel.org, oss-drivers@netronome.com, linux-doc@vger.kernel.org, linux-man@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>
List-Id: linux-man@vger.kernel.org

On Tue, 17 Apr 2018 15:34:38 +0100
Quentin Monnet <quentin.monnet@netronome.com> wrote:

> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> index 350459c583de..3d329538498f 100644
> --- a/include/uapi/linux/bpf.h
> +++ b/include/uapi/linux/bpf.h
> @@ -1276,6 +1276,50 @@ union bpf_attr {
>   * 	Return
>   * 		0 on success, or a negative error in case of failure.
>   *
> + * int bpf_redirect_map(struct bpf_map *map, u32 key, u64 flags)
> + * 	Description
> + * 		Redirect the packet to the endpoint referenced by *map* at
> + * 		index *key*. Depending on its type, his *map* can contain
                                                    ^^^

"his" -> "this"

> + * 		references to net devices (for forwarding packets through other
> + * 		ports), or to CPUs (for redirecting XDP frames to another CPU;
> + * 		but this is only implemented for native XDP (with driver
> + * 		support) as of this writing).
> + *
> + * 		All values for *flags* are reserved for future usage, and must
> + * 		be left at zero.
> + * 	Return
> + * 		**XDP_REDIRECT** on success, or **XDP_ABORT** on error.
> + *

"XDP_ABORT" -> "XDP_ABORTED"

I don't know if it's worth mentioning in the doc/man-page; that for XDP
using bpf_redirect_map() is a HUGE performance advantage, compared to
the bpf_redirect() call ?

-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer
