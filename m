From: =?ISO-8859-15?Q?Luk=E1=A8_Czerner?= <lczerner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 10/10] manpage: update FALLOC_FL_COLLAPSE_RANGE flag
 in fallocate
Date: Fri, 18 Apr 2014 11:45:35 +0200 (CEST)
Message-ID: <alpine.LFD.2.00.1404181140060.2128@localhost.localdomain>
References: <1392741594-20335-1-git-send-email-linkinjeon@gmail.com> <20140416060510.GA25651@infradead.org> <534FD9B5.3000207@gmail.com> <20140417225701.GY15995@dastard>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140417225701.GY15995@dastard>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Chinner <david-FqsqvQoI3Ljby3iVrkZq2A@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Namjae Jeon <linkinjeon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>, Linux-Fsdevel <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, 18 Apr 2014, Dave Chinner wrote:

> Date: Fri, 18 Apr 2014 08:57:01 +1000
> From: Dave Chinner <david-FqsqvQoI3Ljby3iVrkZq2A@public.gmane.org>
> To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Namjae Jeon <linkinjeon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
>     linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Theodore T'so <tytso-3s7WtUTddSA@public.gmane.org>,
>     Linux-Fsdevel <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Subject: Re: [PATCH v5 10/10] manpage: update FALLOC_FL_COLLAPSE_RANGE flag in
>      fallocate
> 
> On Thu, Apr 17, 2014 at 03:40:05PM +0200, Michael Kerrisk (man-pages) wrote:
> > On 04/16/2014 08:05 AM, Christoph Hellwig wrote:
> > > Michael, can you apply this now that we merged FALLOC_FL_COLLAPSE_RANGE
> > > into the kernel tree?
> > 
> > I've applied Namjae Jeon's patch (thanks Namjae!), and done a lot of
> > tweaking to generate the patch below.
> > 
> > Along the way I noticed that there is an inconsistency between XFS
> > and JFS that should be fixed (and so have added Dave and Ted to CC,
> > as well as linux-fsdevel@). 
> > 
> > If 'fd' does not refer to a regular file, then XFS fails with the 
> > error EINVAL (fs/xfs/xfs_file.c::xfs_file_fallocate()), but ext4 
> > fails with the error EOPNOTSUP
> > (fs/ext4/extents::ext4_collapse_range()). I suspect that EINVAL
> > is the right error for this case.
> 
> I think EINVAL is correct here - we support the syscall, just the
> type of file we are being asked to operate on is invalid.

I'd like to point out that do_fallocate() in vfs uses ENODEV in the
case it is not regular file nor directory.

Also I thought of the EOPNOTSUP to be the right way to go. For
example we do not support it on non-extent based files in ext4 so we
return EOPNOTSUP.

The same is for the case that we do not support the particular
fallocate mode.

So I am not really sure about what's the right error to use.

Thanks!
-Lukas

> 
> FWIW, the reason this check is in the filesystems is that there is
> no theoretical reason why we can't do things like preallocation for
> directories (e.g. to reduce fragmentation as they grow). It's just
> not implemented by any filesystem yet.
> 
> [ Hmmmm -  I just had a great idea - removing entire directory
> contents via punching blocks. No more "remove one dirent at a time"
> for rm -rf, just punch the directory from start to end and there
> goes millions of directory entries in a single syscall and a handful
> of transactions.  FALLOC_FL_DIR_PUNCH, anyone? ]
> 
> > I'd appreciate review on my revised patch, below.
> 
> Looks fine to me.
> 
> Cheers,
> 
> Dave.
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
