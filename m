From: "Carlos O'Donell" <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] mallopt.3: Document M_ARENA_TEST, and M_ARENA_MAX.
Date: Mon, 31 Aug 2015 09:20:42 -0400
Message-ID: <55E454AA.6080409@redhat.com>
References: <55DB40AE.7080405@redhat.com> <55E2F1BD.8050609@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55E2F1BD.8050609-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 08/30/2015 08:06 AM, Michael Kerrisk (man-pages) wrote:
> diff --git a/man3/mallopt.3 b/man3/mallopt.3
> index c09e801..fd41bf0 100644
> --- a/man3/mallopt.3
> +++ b/man3/mallopt.3
> @@ -66,8 +66,8 @@ and since glibc 2.15 by default.
>  In some versions of the allocator there was no limit on the number
>  of created arenas (e.g., CentOS 5, RHEL 5).
>  
> -When running programs on newer glibc versions,
> -these applications may exhibit high contention when accessing arenas.
> +When employing newer glibc versions, applications may in
> +some cases exhibit high contention when accessing arenas.

OK.

>  In these cases, it may be beneficial to increase
>  .B M_ARENA_MAX
>  to match the number of threads.
> @@ -79,7 +79,7 @@ This is the limit, in number of arenas created, at which the system
>  configuration will be examined to evaluate a hard limit on the
>  number of created arenas.
>  The computed limit is implementation-defined
> -and is usually a multiple of the number of available cores.
> +and is usually a multiple of the number of available CPUs.

I like this. This is better than what I wrote, since a core is not
the right unit here, we are reading /sys/devices/system/cpu/online,
or /proc/stat or /proc/cpuinfo to compute the number of online cpus.

>  Once the limit is computed, the result is final and constrains
>  the total number of arenas.
>  See
 
Thanks for the commit and fixup! 

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
