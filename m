From: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Subject: Re: Further work on bpf(2)
Date: Fri, 24 Jul 2015 15:28:56 +0200
Message-ID: <55B23D98.4010206@iogearbox.net>
References: <55B20151.50303@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B20151.50303-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 07/24/2015 11:11 AM, Michael Kerrisk (man-pages) wrote:
> Hello Alexei, Daniel
>
> Now that we have a version of the bpf(2) man page out the door, I'd
> like to see it refined, since there are a number of missing pieces.
> In particular:
>
> * The page lacks documentation of the BPF_MAP_TYPE_PROG_ARRAY
>    map type.
>
> * The page needs more info on the BPF_PROG_TYPE_SOCKET_FILTER
>    program type.
>
> * The page lacks documentation of the BPF_PROG_TYPE_SOCKET_FILTER
>    program type.
>
>      commit 2541517c32be2531e0da59dfd7efc1ce844644f5
>      Author: Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
>      Date:   Wed Mar 25 12:49:20 2015 -0700
>
>          tracing, perf: Implement BPF programs attached to kprobes
>
> * The page lacks documentation of the BPF_PROG_TYPE_SCHED_CLS
>    program type.
>
>      commit 96be4325f443dbbfeb37d2a157675ac0736531a1
>      Author: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
>      Date:   Sun Mar 1 12:31:46 2015 +0100
>
>          ebpf: add sched_cls_type and map it to sk_filter's verifier ops
>
>      commit e2e9b6541dd4b31848079da80fe2253daaafb549
>      Author: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
>      Date:   Sun Mar 1 12:31:48 2015 +0100
>
>          cls_bpf: add initial eBPF support for programmable classifiers
>
> * The page lacks documentation of the BPF_PROG_TYPE_SCHED_ACT
>    program type.
>
>      commit 94caee8c312d96522bcdae88791aaa9ebcd5f22c
>      Author: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
>      Date:   Fri Mar 20 15:11:11 2015 +0100
>
>          ebpf: add sched_act_type and map it to sk_filter's verifier ops
>
>      commit a8cb5f556b567974d75ea29c15181c445c541b1f
>      Author: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
>      Date:   Fri Mar 20 15:11:12 2015 +0100
>
>          act_bpf: add initial eBPF support for actions
>
> Between the two of you, could you propose some text for each of the
> above, ideally as man-page patches.
>
> There are also various other pieces of the page that need work,
> which I've marked with FIXMEs. Could you take a look at these please?

Ok, sure. We will sort this out and get back to you with a couple
of patches some time next week.

Thanks,
Daniel
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
