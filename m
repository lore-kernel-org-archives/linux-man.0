From: Hugh Dickins <hughd-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] madvise.2: madvise(, , MADV_REMOVE) supports ext4, ocfs2
 and xfs as well
Date: Fri, 17 Oct 2014 14:52:15 -0700 (PDT)
Message-ID: <alpine.LSU.2.11.1410171408260.11102@eggly.anvils>
References: <20141007140337.10571.62743.stgit@unused-4-157.brq.redhat.com> <5441292E.5000008@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5441292E.5000008-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, hughd-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, 17 Oct 2014, Michael Kerrisk (man-pages) wrote:
> On 10/07/2014 04:03 PM, Jan Chaloupka wrote:
> > As from upstream commit:
> > 
> > commit 3f31d07571eeea18a7d34db9af21d2285b807a17
> > Author: Hugh Dickins <hughd-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> > Date:   Tue May 29 15:06:40 2012 -0700
> > 
> >     mm/fs: route MADV_REMOVE to FALLOC_FL_PUNCH_HOLE
> > 
> >     Now tmpfs supports hole-punching via fallocate(), switch madvise_remove()
> >     to use do_fallocate() instead of vmtruncate_range(): which extends
> >     madvise(,,MADV_REMOVE) support from tmpfs to ext4, ocfs2 and xfs.
> > 
> > madvise(,,MADV_REMOVE) support was extended by ext4, ocfs2 and xfs.
> > 
> > bug report: https://bugzilla.redhat.com/show_bug.cgi?id=1120294
> > 
> > Justification from Rafael Aquini:
> > Well, that code is committed in kernel since v3.5 (2012) and it surely is
> > the expected behaviour since. It seems to me that madvise(2) man page text
> > for MADV_REMOVE just got out-of-date in that regard.
> > 
> > This patch mentions this support in madvise.2 man page.
> 
> The intent of this patch seems correct, but I think the details
> need fixing. See below.

Yes, I should have sent you a man page update long ago:
sorry about that, and thank you to Jan for doing so.

> 
> 
> > Signed-off-by: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > ---
> >  man2/madvise.2 |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/man2/madvise.2 b/man2/madvise.2
> > index 032ead7..44698ec 100644
> > --- a/man2/madvise.2
> > +++ b/man2/madvise.2
> > @@ -98,12 +98,12 @@ either in reloading of the memory contents from the underlying mapped file
> >  or zero-fill-on-demand pages for mappings
> >  without an underlying file.
> >  .TP
> > -.BR MADV_REMOVE " (since Linux 2.6.16)"
> > +.BR MADV_REMOVE " (since Linux 3.5)"
> 
> I think the above should not change.

Agreed,

> 
> >  Free up a given range of pages
> >  and its associated backing store.
> >  Currently,
> >  .\" 2.6.18-rc5
> > -only shmfs/tmpfs supports this; other filesystems return with the
> > +only shmfs/tmpfs, ext4, ocfs2 and xfs supports this; other filesystems return with the
> 
> I think the above line should be:
> 
>     only shmfs/tmpfs and (since Linux 3.5) ext4, ocfs2 and xfs supports this;
>     other filesystems return with the
> 
> See what I mean? Could you fix and resubmit please?

Good suggestion in itself, but checking current kernel git indicates
that btrfs, ceph, cifs, f2fs and perhaps fuse now also support
FALLOC_FL_PUNCH_HOLE, and hence MADV_REMOVE.

You may have better things to do than update the madvise man page
every time another filesystem adds support for that fallocate mode!

Looking at the fallocate(2) page installed on my system, I see
"Not all file systems support FALLOC_FL_PUNCH_HOLE; if a file system
doesn't support the operation, an error is returned."

That looks like a less time-wasting wording; though I'm surprised
it says "an error", rather than specifying EOPNOTSUPP.

Jan, Michael, how about something like:

Originally, only shmfs/tmpfs supported this; but since Linux 3.5, any
file system which supports the fallocate(2) mode FALLOC_FL_PUNCH_HOLE
also supports the madvise(2) advice MADV_REMOVE.  Other file systems
return with the error EOPNOTSUPP.

Hugh
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
