From: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH man-pages 1/5] ioctl_userfaultfd.2: update description of
 shared memory areas
Date: Tue, 2 May 2017 12:31:11 +0300
Message-ID: <20170502093110.GA5910@rapoport-lnx>
References: <1493617399-20897-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1493617399-20897-2-git-send-email-rppt@linux.vnet.ibm.com>
 <7ec5dfc0-9d84-e142-bfaa-d96383acbee9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7ec5dfc0-9d84-e142-bfaa-d96383acbee9-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, May 01, 2017 at 08:33:31PM +0200, Michael Kerrisk (man-pages) wrote:
> Hello Mike,
> 
> I've applied this patch, but  have a question.
> 
> On 05/01/2017 07:43 AM, Mike Rapoport wrote:
> > Signed-off-by: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> > ---
> >  man2/ioctl_userfaultfd.2 | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> > 
> > diff --git a/man2/ioctl_userfaultfd.2 b/man2/ioctl_userfaultfd.2
> > index 889feb9..6edd396 100644
> > --- a/man2/ioctl_userfaultfd.2
> > +++ b/man2/ioctl_userfaultfd.2
> > @@ -181,8 +181,17 @@ virtual memory areas
> >  .TP
> >  .B UFFD_FEATURE_MISSING_SHMEM
> >  If this feature bit is set,
> > -the kernel supports registering userfaultfd ranges on tmpfs
> > -virtual memory areas
> > +the kernel supports registering userfaultfd ranges on shared memory areas.
> > +This includes all kernel shared memory APIs:
> > +System V shared memory,
> > +tmpfs,
> > +/dev/zero,
> > +.BR mmap(2)
> > +with
> > +.I MAP_SHARED
> > +flag set,
> > +.BR memfd_create (2),
> > +etc.
> >  
> >  The returned
> >  .I ioctls
> 
> Does the change in this patch represent a change that occurred in
> Linux 4.11? If so, I think this needs to be said explicitly in the text.

The patch only extends the description of UFFD_FEATURE_MISSING_SHMEM. The
feature is indeed available from 4.11, but that is said a few lives above
(line 136 in ioctl_userfaultfd.2)
 
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
