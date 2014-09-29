From: Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
Subject: Re: [PATCH 1/1] getrandom(2) : new man page
Date: Mon, 29 Sep 2014 11:52:31 -0400
Message-ID: <20140929155231.GB25243@thunk.org>
References: <1410614156-16175-1-git-send-email-xypron.glpk@gmx.de>
 <5429791D.6080903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5429791D.6080903-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Sep 29, 2014 at 05:22:05PM +0200, Michael Kerrisk (man-pages) wrote:
> 
> @Ted: could you please review the next version of 
> Heinrich's page?

Of course.  :-)

> 
> > +generators (i.e., DRBG's) or for other cryptographic uses.
> 
> Here, I assume DBRGs means "Deterministic Random Bit Generators".
> Best to write that in full, so that some readers are not left 
> puzzled by the acronym.

Both DRBG and NDRBG are defined in the NIST Special Publications (SP)
800-90A, 800-90B, and 800-90C.  Some of these are in draft forms, and
some of these are formal standards that have since been re-opened for
comments and possible revisions after the Snowden revelations.  You
can check out the NIST web site for more details.  It would probably
be a good idea to include URL's in the references section to the NIST
web pages for these documents.

> 
> Did you test whether SA_RESTART has an affect for getrandom()? 
> (For many system calls it is ignored.) I've not tested this,
> but reading the source suggests that it does.

I did test to make sure that SA_RESTART semantics were working
correctly in my development, but it would be good for someone else to
double chek this.  My reference of what happens with slow read(2)
calls when signals came in was a reference to the expectation that the
full system call restart semantics are supposed to be in place for the
getrandom(2) system call.

> > +.SH VERSIONS
> > +.BR getrandom ()
> > +was introduced in version 3.17.0 of the Linux kernel for the x86 and amd64 architecture,
> > +.\" FIXME . Patch is in next-20140913.
> > +and is expected to be delivered in 3.18.0 for other architectures.
> 
> Remove the ".0" at the end of the two previous kernel versions.

... and I suspect they will also show up in 3.17.N kernel releases.
Might be good to double check to see if they've showed in the stable
releases.

						- Ted
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
