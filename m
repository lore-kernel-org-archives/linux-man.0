From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: dlopen(3) and RTLD_NODELETE
Date: Fri, 15 Mar 2013 07:39:23 +0100
Message-ID: <CAKgNAkge90n18PN5LW3Ff1x9vFiYsJ9G36UOP+v44GR6UJ8R+w@mail.gmail.com>
References: <CACKs7VDM8w7U1g0pQZjTK=_uLFq22kwoPG8WA-Hd4X=jhXTXgg@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACKs7VDM8w7U1g0pQZjTK=_uLFq22kwoPG8WA-Hd4X=jhXTXgg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Stefan,

On Thu, Mar 14, 2013 at 11:44 AM, Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Michael (and list!),
>
> I was trying to detect some memory leaks in some shared libraries
> (plugins) that are loaded and unloaded during a normal run in our
> application, and needed a way to ensure that valgrind could find the
> symbols from libraries after they were unloaded. The best bet for that
> was the RTLD_NODELETE flag to dlopen(), which results in the shared
> library not getting unloaded. There's a small caveat, though:
> destructors (functions marked with "__attribute__((destructor))") are
> not called when calling dlclose() - that's the behavior I'm seeing on
> the ancient glibc we use (2.3.3).
>
> As far as I read the current manpage, this information is not clearly
> stated - the fact that static variables are not reinitialized when
> reloading the library is at most a hint that constructors/destructors
> won't follow the normal workflow either. I think adding some
> clarifications about this makes sense. What do you think?

What you say sounds reasonable, but I'd like to verify. Are you able
to provide a very simple program for testing this, and a demo script
of how to demonstrate it?

Thanks,

Michael


> diff --git a/man3/dlopen.3 b/man3/dlopen.3
> index b1f21be..92950fa 100644
> --- a/man3/dlopen.3
> +++ b/man3/dlopen.3
> @@ -159,9 +159,10 @@ references in subsequently loaded libraries.
>  Do not unload the library during
>  .BR dlclose ().
>  Consequently, the library's static variables are not reinitialized
> -if the library is reloaded with
> +(and constructor routines are not called) if the library is reloaded
> +with
>  .BR dlopen ()
> -at a later time.
> +at a later time. Also, destructor routines are not called.
>  This flag is not specified in POSIX.1-2001.
>  .\" (But it is present on Solaris.)
>  .TP
>
> Thanks,
> Stefan.



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
