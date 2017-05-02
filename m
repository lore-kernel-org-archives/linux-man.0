From: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH man-pages 3/5] ioctl_userfaultfd.2: add BUGS section
Date: Tue, 2 May 2017 12:32:59 +0300
Message-ID: <20170502093252.GB5910@rapoport-lnx>
References: <1493617399-20897-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1493617399-20897-4-git-send-email-rppt@linux.vnet.ibm.com>
 <345c064d-83fe-3e40-c5cb-5d4b6e5cdff4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <345c064d-83fe-3e40-c5cb-5d4b6e5cdff4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, May 01, 2017 at 08:33:50PM +0200, Michael Kerrisk (man-pages) wrote:
> Hi Mike,
> 
> I've applied this, but have a question.
> 
> On 05/01/2017 07:43 AM, Mike Rapoport wrote:
> > The features handshake is not quite convenient.
> > Elaborate about it in the BUGS section.
> > 
> > Signed-off-by: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> > ---
> >  man2/ioctl_userfaultfd.2 | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/man2/ioctl_userfaultfd.2 b/man2/ioctl_userfaultfd.2
> > index e12b9de..50316de 100644
> > --- a/man2/ioctl_userfaultfd.2
> > +++ b/man2/ioctl_userfaultfd.2
> > @@ -650,6 +650,15 @@ operations are Linux-specific.
> >  .SH EXAMPLE
> >  See
> >  .BR userfaultfd (2).
> > +.SH BUGS
> > +In order to detect available userfault features and
> > +enable certain subset of those features
> 
> I changed "certain" to "some". ("certain subset" here also
> would sound like "some particular subset" of those features.)
> Okay?
 
Yes, sure.

> > +the usefault file descriptor must be closed after the first
> > +.BR UFFDIO_API
> > +operation that queries features availability and re-opened before
> > +the second
> > +.BR UFFDIO_API
> > +call that actually enables the desired features.
> >  .SH SEE ALSO
> >  .BR ioctl (2),
> >  .BR mmap (2),
> 
> Cheers,
> 
> Michael
> 
> 
> 
> -- 
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
