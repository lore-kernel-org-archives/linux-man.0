From: Akihiro Suda <suda.kyoto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sched_setattr.2: callee's affinity matters, not caller's one.
Date: Sun, 10 Jan 2016 19:18:07 +0900
Message-ID: <CAG8fp8SM_XcMgSEFZxB6E1s1n0bb6iQvY5cigqqoUVwDnB5rMQ@mail.gmail.com>
References: <CAG8fp8Sn2rRBxHPvpgU-k_XGDfEkZsKcopm8k9udajm_xGzARA@mail.gmail.com>
	<56901BC5.4060708@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56901BC5.4060708-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Michael,

OK, and thanks!


2016-01-09 5:27 GMT+09:00 Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> Hello Akihiro,
>
> On 01/02/2016 02:04 PM, Akihiro Suda wrote:
>> Hi, all
>>
>> sched_setattr.2 says:
>>
>>  EPERM  The caller's CPU affinity mask does not include all CPUs in
>> the system (see sched_setaffinity(2)).
>>
>>
>> But it seems that callee's affinity matters, not caller's one.
>> http://lxr.free-electrons.com/source/kernel/sched/core.c?v=4.3#L3888
>
> I agree with you. But I think we can word a little more precisely,
> since "callee" isn't so clear. I applied the patch below. Thanks!
>
> Cheers,
>
> Michael
>
> -- a/man2/sched_setattr.2
> +++ b/man2/sched_setattr.2
> @@ -341,7 +341,8 @@ are invalid.
>  The caller does not have appropriate privileges.
>  .TP
>  .B EPERM
> -The caller's CPU affinity mask
> +The CPU affinity mask of the thread specified by
> +.I pid
>  does not include all CPUs in the system
>  (see
>  .BR sched_setaffinity (2)).
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
