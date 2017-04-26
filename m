From: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/5] {ioctl_}userfaultfd.2: initial updates for 4.11
Date: Wed, 26 Apr 2017 10:43:40 +0300
Message-ID: <20170426074339.GE16837@rapoport-lnx>
References: <1493137748-32452-1-git-send-email-rppt@linux.vnet.ibm.com>
 <428a9209-e712-7067-ab11-9c35cddcd89e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <428a9209-e712-7067-ab11-9c35cddcd89e-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Apr 26, 2017 at 09:23:45AM +0200, Michael Kerrisk (man-pages) wrote:
> Hello Mike,
> 
> On 04/25/2017 06:29 PM, Mike Rapoport wrote:
> > Hello Michael,
> > 
> > These patches are some kind of brief highlights of the changes to the
> > userfaultfd pages.
> 
> Thanks for the patches. All merged. A few tweaks made,
> and pushed to Git.
> 
> > The changes to userfaultfd functionality are also described at update to
> > Documentation/vm/userfaultfd.txt [1].
> > 
> > In general, there were three major additions:
> > * hugetlbfs support
> > * shmem support
> > * non-page fault events
> > 
> > I think we should add some details about using userfaultfd with different
> > memory types, describe meaning of each feature bits and add some text about
> > the new events.
> 
> Agreed.
> 
> > I haven't updated 'struct uffd_msg' yet, and I hesitate whether it's
> > description belongs to userfaultfd.2 or ioctl_userfaultfd.2
> 
> My guess is userfaultfd.2. But, maybe I missed something.
> What suggests to you that it could be ioctl_userfaultfd.2 instead?

I've started to add relatively elaborate descriptions of UFFD_EVENT_* to
ioctl_userfaultfd.2 and I've found that I write a lot about struct uffd_msg
fields, but the structure itself is described at userfaultfd.2.
Now, when I'm thinking about it, maybe it would be better to put the
detailed descriptions of the events in userfaultfd.2 and only brief notes
in ioctl_userfaultfd.2.
 
> > As for the userfaultfd.7 we've discussed earlier, I believe it would
> > repeat Documentation/vm/userfaultfd.txt in way, so I'm not really sure it
> > is required.
> 
> The thing about kernel Doc files is they are a lot less visible.
> It would be best I think to have the user-space visible
> API fully described in man pages...

I agree with the point about the visibility, I just don't know if
userfaultfd.7 would be required or we'll have all the necessary bits in
{ioctl_}userfaultfd.2. I'm going to add more content to the man2 pages and
then we'll see if we need man7 as well.
 
> Cheers,
> 
> Michael
> 
> 
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5a02026d390ea1bb0c16a0e214e45613a3e3d885
> > 
> > Mike Rapoport (5):
> >   userfaultfd.2: describe memory types that can be used from 4.11
> >   ioctl_userfaultfd.2: describe memory types that can be used from 4.11
> >   ioctl_userfaultfd.2: update UFFDIO_API description
> >   userfaultfd.2: add Linux container migration use-case to NOTES
> >   usefaultfd.2: add brief description of "non-cooperative" mode
> > 
> >  man2/ioctl_userfaultfd.2 | 46 ++++++++++++++++++++++++++++++++++++++--------
> >  man2/userfaultfd.2       | 25 ++++++++++++++++++++++---
> >  2 files changed, 60 insertions(+), 11 deletions(-)
> > 
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
