From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Outdated scare text in snprintf man page
Date: Sun, 29 Jun 2014 08:29:18 +0200
Message-ID: <53AFB23E.40702@gmail.com>
References: <20140629034549.GX179@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140629034549.GX179-C3MtFaGISjmo6RMmaWD+6Sb1p8zYI1N1@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Rich,

On 06/29/2014 05:45 AM, Rich Felker wrote:
> The following text appears under BUGS in the snprintf man page:
> 
>        Linux libc4.[45] does not have a snprintf(), but provides a
>        libbsd that contains an snprintf() equivalent to sprintf(),
>        that is, one that ignores the size argument. Thus, the use of
>        snprintf() with early libc4 leads to serious security problems.
> 
> I've had people cite this as a reason to be wary of using snprintf,
> apparently unaware of what libc4 means. IMO it should just be removed;
> it's way too old to be relevant.

Thanks reporting this.

Yes, I agree. I removed this text, and indeed all of the other libc4 
and lib5 pieces in the page. Linux libc is ancient history, and those
pieces of text are more clutter than help.

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
