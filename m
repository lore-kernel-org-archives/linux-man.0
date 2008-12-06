From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [PATCH] open_wmemstream(3): Describe (as part of fmemopen.3)
Date: Sat, 6 Dec 2008 10:54:14 +0100
Message-ID: <20081206095414.GX10491@machine.or.cz>
References: <20081204232328.GJ10491@machine.or.cz> <cfd18e0f0812050953l4b0a6ca0mf2994623474b149f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0812050953l4b0a6ca0mf2994623474b149f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  Hi,

  thanks for all the comments.

On Fri, Dec 05, 2008 at 12:53:26PM -0500, Michael Kerrisk wrote:
> One thing that also is good to include is version information.
> Unfortunately the page was lacking a VERSIONS section, when it really
> should have had one.  I added the following:
> 
> diff --git a/man3/fmemopen.3 b/man3/fmemopen.3
> index 2b87b69..0d540b5 100644
> --- a/man3/fmemopen.3
> +++ b/man3/fmemopen.3
> @@ -160,6 +160,13 @@ pointer.
>  Otherwise, NULL is returned and the global variable
>  .I errno
>  is set to indicate the error.
> +.SH VERSIONS
> +.BR fmemopen ()
> +is available since glibc 2.2.
> +.BR open_memstream ()
> +is available since glibc 2.0.
> +.BR open_wmemstream ()
> +is available since glibc 2.4.
>  .SH "CONFORMING TO"
>  These functions are GNU extensions.
>  .\" Jan 06: But they appear to be going up for standardization by
> 
> Look right to you?

open_wmemstream() yes. fmemopen() is much much older (bear in mind that
there was old GNU stdio library before GNU libio, and it contained
fmemopen() too - I have no idea which libc version "Thu Aug 8 00:39:56
1991 +0000" is in, though) and same for open_memstream (Sun Jul 28
00:22:19 1991 +0000).

-- 
				Petr "Pasky" Baudis
People who take cold baths never have rheumatism, but they have
cold baths.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
