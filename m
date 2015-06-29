From: Tolga Dalman <tolga.dalman-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: What *is* the API for sched_getaffinity? Should sched_getaffinity
 always succeed when using cpu_set_t?
Date: Mon, 29 Jun 2015 23:40:37 +0200
Message-ID: <5591BB55.5080605@googlemail.com>
References: <51E42BFE.7000301@redhat.com> <51E4A0BB.2070802@gmail.com>
 <51E4A123.9070001@gmail.com> <51E6F3ED.8000502@redhat.com>
 <51E6F956.5050902@gmail.com> <51E714DE.6060802@redhat.com>
 <CAHGf_=oZW3kNA3V-9u+BZNs3tL3JKCsO2a0Q6f0iJzo=N4Wb8w@mail.gmail.com>
 <51E7B205.3060905@redhat.com>
 <20130722214335.D9AFF2C06F@topped-with-meat.com>
 <51EDB378.8070301@redhat.com> <558D6171.1060901@gmail.com>
 <558DB0A0.2040707@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <558DB0A0.2040707-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>
Cc: KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael,

given the approach is accepted by Carlos and Roland, I have
some minor textual suggestions for the patch itself.

On 06/26/2015 10:05 PM, Michael Kerrisk (man-pages) wrote:
> --- a/man2/sched_setaffinity.2
> +++ b/man2/sched_setaffinity.2
> @@ -223,6 +223,47 @@ system call returns the size (in bytes) of the
>  .I cpumask_t
>  data type that is used internally by the kernel to
>  represent the CPU set bit mask.
> +.SS Handling systems with more than 1024 CPUs

What if the system has exactly 1024 CPUs ?
Suggestion: systems with 1024 or more CPUs

> +The
> +.I cpu_set_t
> +data type used by glibc has a fixed size of 128 bytes,
> +meaning that the maximum CPU number that can be represented is 1023.
> +.\" FIXME . See https://sourceware.org/bugzilla/show_bug.cgi?id=15630
> +.\" and https://sourceware.org/ml/libc-alpha/2013-07/msg00288.html

No objection, although I have never really noticed external references
in man-pages (esp. web refs). Shouldn't these be generally avoided ?
(and yes, I have noticed the FIXME)

> +If the system has more than 1024 CPUs, then calls of the form:

1024 or more CPUs.

> +
> +    sched_getaffinity(pid, sizeof(cpu_set_t), &mask);
> +
> +will fail with the error
> +.BR EINVAL ,
> +the error produced by the underlying system call for the case where the
> +.I mask
> +size specified in
> +.I cpusetsize
> +is smaller than the size of the affinity mask used by the kernel.
> +.PP
> +The underlying system calls (which represent CPU masks as bit masks of type
> +.IR "unsigned long\ *" )
> +impose no restriction on the size of the mask.
> +To handle systems with more than 1024 CPUs, one must dynamically allocate the
> +.I mask
> +argument using
> +.BR CPU_ALLOC (3)

I would rewrite the sentence to avoid "one must".

> +and manipulate the mask using the "_S" macros described in

and manipulate the macros ending with "_S" as described in

> +.BR CPU_ALLOC (3).
> +Using an allocation based on the number of online CPUs:
> +
> +    cpu_set_t *mask = CPU_ALLOC(CPU_ALLOC_SIZE(
> +                                sysconf(_SC_NPROCESSORS_CONF)));
> +
> +is probably sufficient, although the value returned by the
> +.BR sysconf ()
> +call can in theory change during the lifetime of the process.
> +Alternatively, one can obtain a value that is guaranteed to be stable for

Like above, I would replace "one can obtain a value" by "a value can be obtained".

> +the lifetime of the process by proby for the size of the required mask using

s/proby/probing/.

> +.BR sched_getaffinity ()
> +calls with increasing mask sizes until the call does not fail with the error
> +.BR EINVAL .

I would replace "until the call does not fail with error ..." by "while the call succeeds".

Also, the sentence too long, IMHO.

Best regards
Tolga Dalman



--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
