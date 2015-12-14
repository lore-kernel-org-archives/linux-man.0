From: Nicholas Mc Guire <der.herr-kA1LtwSENNE@public.gmane.org>
Subject: Re: [PATCH] getdirentries: Add a simple example rather than just
 referencing
Date: Mon, 14 Dec 2015 10:48:41 +0000
Message-ID: <20151214104841.GA21533@osadl.at>
References: <1447153987-1742-1-git-send-email-der.herr@hofr.at>
 <566B1B6B.9010904@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <566B1B6B.9010904-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Dec 11, 2015 at 07:52:27PM +0100, Michael Kerrisk (man-pages) wrote:
> Hello Nicholas,
> 
> On 11/10/2015 12:13 PM, Nicholas Mc Guire wrote:
> > The manpage of getdirentries basically just repeats the limited information
> > from dirent.h and does not explain the content of the returned buffer.
> 
> Agreed that an example in the page would be helpful.
> 
> > Further it refers the reader to "the Linux library source code for details", 
> > which is not really that helpful - a simple example including the need to
> > check available fields, and showing that the returned buffer contains 
> > struct direntries would simplify things.
> 
> There's a number of problems with the example program, starting with
> 
> $ cc -Wall  h.c
> h.c: In function ?main?:
> h.c:31:17: warning: format ?%llu? expects argument of type ?long long unsigned int?, but argument 3 has type ?int? [-Wformat=]
>                  );
> 
> Also, the program won't compile at all if _DIRENT_HAVE_D_TYPE happens 
> to be undefined.
> 
> There's also a rendering issue for the code when placed into a man page:
> the backslashes must be doubled (e.g., "\\n")
>
thanks for the feedback - looks like this needs some rework - will go 
fix things up and try a second - hopefully more useful version.

thx!
hofrat
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
