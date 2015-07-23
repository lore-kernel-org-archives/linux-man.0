From: Daniel Borkmann <daniel-FeC+5ew28dpmcu3hnIyYJQ@public.gmane.org>
Subject: Re: Draft 3 of bpf(2) man page for review
Date: Thu, 23 Jul 2015 15:39:41 +0200
Message-ID: <55B0EE9D.7000600@iogearbox.net>
References: <55AFE46F.3090800@gmail.com> <55AFED75.2030208@plumgrid.com> <55AFF8BF.3050204@gmail.com> <55B0B461.1020201@iogearbox.net> <55B0CECA.2010105@gmail.com> <55B0E252.2010207@iogearbox.net> <55B0EDD7.8020407@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B0EDD7.8020407-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexei Starovoitov <ast-uqk4Ao+rVK5Wk0Htik3J/w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Silvan Jegen <s.jegen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Walter Harms <wharms-fPG8STNUNVg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 07/23/2015 03:36 PM, Michael Kerrisk (man-pages) wrote:
...
>> Ok, I guess we could revisit/clarify that at a later point in time. I'd add
>> a TODO comment to the source or the like, as this also is related to the 2nd
>> below use case (aggregation/accounting), where an array is typically used.
>
> Okay. FIXME added.

Great.

[...]
>> I'd maybe only mention in addition that in log_level=0 case, we also must not
>> provide a log_buf and log_size, otherwise we get EINVAL.
>
> I changed the text to:
>
>         *  log_level  verbosity  level  of the verifier.  A value of zero
>            means that the verifier will not provide a log; in this  case,
>            log_buf must be a NULL pointer, and log_size must be zero.

Ok.

[...]
> Thanks for clearing that up -- I added the following sentence
>
>      JIT compiler for eBPF is currently available for the x86-64, arm64,
>      and s390 architectures.
>
> Okay?

Yep.

Thanks,
Daniel
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
