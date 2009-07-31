From: Corrado Zoccolo <czoccolo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: wrong description for readahead(2)
Date: Fri, 31 Jul 2009 10:18:38 +0200
Message-ID: <4e5e476b0907310118g1702b935tdfca3e12d0b05565@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

It says
> readahead() blocks until the specified data has been read.
but reading the kernel source code, it simply calls
force_page_cache_readahead (the same called by fadvise/madvise), that
just post a prefetch, and it may block only when the I/O queue is
full.

posix_fadvise (with POSIX_FADV_WILLNEED flag) description says, instead:
       POSIX_FADV_WILLNEED initiates a non-blocking read of the
specified region into
       the page cache.  The amount of data read may be decreased by the kernel
       depending on virtual memory load.  (A few megabytes will usually be fully
       satisfied, and more is rarely useful.)

-- 
__________________________________________________________________________

dott. Corrado Zoccolo                          mailto:czoccolo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
PhD - Department of Computer Science - University of Pisa, Italy
--------------------------------------------------------------------------
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
