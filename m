From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: Re: [PATCH man-pages 0/5] {ioctl_}userfaultfd.2: yet another update
Date: Tue, 2 May 2017 12:48:37 +0300
Message-ID: <20170502094836.GD5910@rapoport-lnx>
References: <1493617399-20897-1-git-send-email-rppt@linux.vnet.ibm.com>
 <352eee49-d6d1-3e82-a558-2341484c81f3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <352eee49-d6d1-3e82-a558-2341484c81f3@gmail.com>
Sender: owner-linux-mm@kvack.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-man@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Mon, May 01, 2017 at 08:34:07PM +0200, Michael Kerrisk (man-pages) wrote:
> Hi Mike,
> 
> On 05/01/2017 07:43 AM, Mike Rapoport wrote:
> > Hi Michael,
> > 
> > These updates pretty much complete the coverage of 4.11 additions, IMHO.
> 
> Thanks for this, but we still await input from Andrea
> on various points.
> 
> > Mike Rapoport (5):
> >   ioctl_userfaultfd.2: update description of shared memory areas
> >   ioctl_userfaultfd.2: UFFDIO_COPY: add ENOENT and ENOSPC description
> >   ioctl_userfaultfd.2: add BUGS section
> >   userfaultfd.2: add note about asynchronios events delivery
> >   userfaultfd.2: update VERSIONS section with 4.11 chanegs
> > 
> >  man2/ioctl_userfaultfd.2 | 35 +++++++++++++++++++++++++++++++++--
> >  man2/userfaultfd.2       | 15 +++++++++++++++
> >  2 files changed, 48 insertions(+), 2 deletions(-)
> 
> I've applied all of the above, and done some light editing.
> 
> Could you please check my changes in the following commits:
> 
> 5191c68806c8ac73fdc89586cde434d2766abb5c
> 265225c1e2311ae26ead116e6c8d2cedd46144fa

Both are Ok
Reviewed-by: Mike Rapoport <rppt@linux.vnet.ibm.com>
 
> Thanks,
> 
> Michael
> 
> -- 
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/
> 

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
