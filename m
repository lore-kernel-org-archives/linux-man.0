From: Ingo Schwarze <schwarze-mcycREo4Un4@public.gmane.org>
Subject: Re: [patch] stpcpy.3, stpncpy.3: Correct history
Date: Wed, 7 May 2014 22:33:00 +0200
Message-ID: <20140507203300.GM3365@iris.usta.de>
References: <20140224003705.GB28413@iris.usta.de>
 <5363A48C.7060709@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5363A48C.7060709-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Michael,

Michael Kerrisk (man-pages) wrote on Fri, May 02, 2014 at 03:58:36PM +0200:

> the patch seems more or less okay to me, but given that The AmigaDOS
> compiler is the merely the oldest instance you could find, I'd prefer
> a slightly more open wording.
> How would this be:
> 
> [[
> --- a/man3/stpcpy.3
> +++ b/man3/stpcpy.3
> @@ -76,9 +76,11 @@ function is thread-safe.
>  .SH CONFORMING TO
>  This function was added to POSIX.1-2008.
>  Before that, it was not part of
> -the C or POSIX.1 standards, nor customary on UNIX systems, but was not a
> -GNU invention either.
> -Perhaps it came from MS-DOS.
> +the C or POSIX.1 standards, nor customary on UNIX systems.
> +It first appeared at least as early as 1986,
> +in the Lattice C AmigaDOS compiler,
> +then in the GNU fileutils and GNU textutils in 1989,
> +and in the GNU C library until 1992.
>  It is also present on the BSDs.
>  .SH BUGS
>  This function may overrun the buffer
> 
> ]]
> 
> ?

Yes, that seems a safer claim, and it reads very well.
I like your wording.

Thank you for looking into this,
  Ingo
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
