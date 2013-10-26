From: Rodrigo Campos <rodrigo-aOqSs0FX/Gu4Tu3zPC53fQ@public.gmane.org>
Subject: Re: [PATCH v2] futex.2: Fix link to Rusty's futex example library
Date: Sat, 26 Oct 2013 22:34:10 +0100
Message-ID: <20131026213410.GB9456@sdfg.com.ar>
References: <1380056659-24306-1-git-send-email-rodrigo@sdfg.com.ar>
 <1380567043-10102-1-git-send-email-rodrigo@sdfg.com.ar>
 <526AE89E.9080604@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <526AE89E.9080604-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Oct 26, 2013 at 10:54:38AM +1300, Michael Kerrisk (man-pages) wrote:
> On 01.10.2013 07:50, Rodrigo Campos wrote:
> > When I asked to webmaster-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Konstantin Ryabitsev answered that the
> > ".nl." is "an obsolete scheme and really should be changed to just
> > ftp.kernel.org". So this patch does just this change.
> > 
> > I also did a git grep for "\..*\.kernel.org" and didn't find anything wierd.
> > Just an example using ftp.us.kernel.org in man3/getaddrinfo_a.3 where other
> > domains used in the example also don't work. I'm not sure we want to fix this,
> > but if we want, we should probably do it in a separate patch.
> 
> Applied. Thanks & sorry for the delay.

Np, thanks a lot! :-)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
