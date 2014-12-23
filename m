From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Incorrect documentation for tgkill syscall when tgid==-1
Date: Tue, 23 Dec 2014 16:31:14 +0100
Message-ID: <54998AC2.70202@gmail.com>
References: <20141219020553.GA23392@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141219020553.GA23392-C3MtFaGISjmo6RMmaWD+6Sb1p8zYI1N1@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Rich,

On 12/19/2014 03:05 AM, Rich Felker wrote:
> The man page for tgkill claims:
> 
>        "If tgid is specified as -1, tgkill() is equivalent to tkill()."
> 
> However, the kernel source contains:
> 
>         /* This is only valid for single tasks */
>         if (pid <= 0 || tgid <= 0)
>                 return -EINVAL;
> 
> and I confirmed that passing -1 results in EINVAL. This discrepency
> should be fixed in the documentation.

Sigh. Text along those lines has been there since the pages added
in 2003.

> Since there's therefore no way to achieve the same behavior as tkill
> using the tgkill syscall, I'd also like to request a removal of the
> text claiming tkill is obsolete. tgkill does not solve the race
> condition it claims to solve (this is documented to some extent in the
> relevant git commits to musl libc, and I intend to write more on the
> issue later) nor is it needed to solve the race (tkill works just as
> well if used correctly).

I guess the relevant bug here is

    http://sourceware.org/bugzilla/show_bug.cgi?id=12889

right?

I'm a little puzzled. In that bug report, you say:

     (The tgkill syscall was designed to eliminate a similar race
     condition in tkill, but it only succeeded in eliminating races
     where the tid gets reused in a different process, and does not
     help if the same tid gets assigned to a new thread in the
     same process.)

Is it not the case that tgkill() solves *some* of the race conditions
that tkill() is vulnerable to (i.e., TID recycled in a different 
process), and therefore is an improvement on tkill() (i.e., renders
it obsolete)?

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
