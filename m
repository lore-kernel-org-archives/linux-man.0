From: Andreas Dilger <adilger-xsfywfwIY+M@public.gmane.org>
Subject: Re: mount(8) manpage and filesystem-specific options
Date: Wed, 26 Nov 2008 13:05:26 -0700
Message-ID: <20081126200526.GX3186@webber.adilger.int>
References: <20081126041558.GA9251@infradead.org>
 <20081126105444.GO2961@nb.net.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <util-linux-ng-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20081126105444.GO2961-sHeGUpI7y9L/9pzu0YdTqQ@public.gmane.org>
Content-disposition: inline
Sender: util-linux-ng-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Karel Zak <kzak-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, util-linux-ng-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Nov 26, 2008  11:54 +0100, Karel Zak wrote:
> On Tue, Nov 25, 2008 at 11:15:58PM -0500, Christoph Hellwig wrote:
> > Currently the mount(8) manpages which is contained inside util-linux
> > has a list of mount options for various filesystem.  Now the filesystems
> > are in the kernel tree and can change options without affecting the
> > mount binary, and of course do so frequently.  This means these options
> > are frequently out of date.  All these options also make the manpage
> 
>  Yes, you're right.
> 
> > quite large and harder to read.  What do peope think about adding a
> > (section 4?) manpage for every common filesystem in the man-pages
> 
>  Something like this is on my wish list for long time ;-)

I see on my system that there are already mount.nfs(8) and mount.cifs(8)
man pages, but this is because /sbin/mount.{nfs,cifs} are separate binaries.

I DO think that it makes sense to have separate mount.{fstype} man pages
to clean up the mount(8) man page.  I've also thought that this page is
a huge mess.

<aside>
I never know what man section to put a new man page in, because the
descriptions of the section numers isn't given in the man(1) man page
itself, nor in any document in SEE ALSO.
</aside> 

>  The FS specific options are already documented in the kernel
>  Documentation/ directory. I have no strong opinion about it, but I
>  think the best solution is to maintain this docs on one place only.
>  The place should be in the kernel tree otherwise developers will
>  ignore the docs... (it's pretty simple to reject kernel patches
>  without proper Documentation/ update).

I would be happy do just put the mount.ext{2,3,4}(4) man pages into
linux/Documentation/filesystems/{man?} and have the ext{2,3,4} docs
refer to them for the mount options.

Cheers, Andreas
--
Andreas Dilger
Sr. Staff Engineer, Lustre Group
Sun Microsystems of Canada, Inc.

--
To unsubscribe from this list: send the line "unsubscribe util-linux-ng" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
