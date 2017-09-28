From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] getpid.2: Add a NOTE concerning the RETURN VALUE of
 getpid(2)
Date: Thu, 28 Sep 2017 09:20:57 +0200
Message-ID: <6571ff78-5138-36a9-b8f0-2a68185fa12d@gmail.com>
References: <CAF+p1HsmP6FSO7FTuuzAWtHW_kk75iy9M43oxcJD-ZMiFazOvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAF+p1HsmP6FSO7FTuuzAWtHW_kk75iy9M43oxcJD-ZMiFazOvQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shivansh Rai <shivansh-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Shivansh

On 09/27/2017 01:28 PM, Shivansh Rai wrote:
> The following information is not available in the latest version of the 
> man-page (man-pages-4.13) for getpid(2) (quoting from "kernel/sys.c#L829") -
> 
> sys_getpid - return the thread group id of the current process
> Note, despite the name, this returns the tgid not the pid.  The tgid and
> the pid are identical unless CLONE_THREAD was specified on clone() in
> which case the tgid is the same in all threads of the same group.
> 
> This patch applies against: man-pages-4.13
> Relevant commit: 4a22f16636259f503847b0805e04824171b270fc  (cc'd Stephen 
> Rothwell)
> 
> @@ -59,6 +59,14 @@
>   .BR pid_namespaces (7)),
>   .BR getppid ()
>   returns 0.
> +Despite the name
> +.BR getpid ()
> +returns the thread group ID of the current process. The TGID and the
> +PID are identical unless
> +.BR CLONE_THREAD
> +was specified on
> +.BR clone (2)
> +in which case the TGID is same in all threads of the same group.
>   .\"
>   .SS C library/kernel differences
>   From glibc version 2.3.4 up to and including version 2.24,

I'm not sure I understand the intent of your patch. This is how
things are on Linux:

In a multithreaded process (created at the kernel level using 
clone(V+CLONE_NEWTHREAD), each thread has a unique (kernel)
thread ID (TID).

All of those threads have the same thread group ID (TGID).

 From the user-space perspective, the TGID is the same thing as the PID
(i.e., TID is not the same as PID).

In this sense, the text you propose to add seems rather confusing for
user space. But, maybe I have misunderstood your point. If so, let
me know.

Thanks,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
