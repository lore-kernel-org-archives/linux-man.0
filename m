From: Hendrik Jan Thomassen <hjt-Hf+EfML1qzhUecB6AVeNQA@public.gmane.org>
Subject: small bug in unlink(2) manpage
Date: Thu, 11 Aug 2011 10:17:42 +0200
Message-ID: <20110811081742.GA26403@vcursdoc.atcomputing.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


This is a report about a small bug in the manpage for the
unlink(2) system call. I found the bug in my Ubuntu 10.10
distribution; its Colophon says: "This  page  is  part  of
release  3.23  of the Linux man-pages project".

The bug is also present in the on-line manpages at
    http://www.kernel.org/doc/man-pages/online_pages.html

The current version of the page says (under ERRORS):

> EBUSY (not on Linux)
>  The  file pathname cannot be unlinked because it is being
>  used by the system or another process and the
>  implementation considers this an error.

But if you look in the kernel source file   fs/namei.c
at routine  may_delete()  you'll see two occasions where
an EBUSY is generated. So the above "not on Linux" is wrong.

I suggest that this '(not on Linux)' be removed. It may
also improve the page if the commentary is reworded to give a
better description of the two situations. Something along
the lines of:
> The file pathname cannot be unlinked because it is being used
> by the system, e.g. if some (relative) rootdir is mounted upon it,
> or because the NFS client software created it to represent an
> active but otherwise nameless inode ("NFS silly renamed").

Just FYI: the NFS silly rename (you'll find this term mentioned
in the kernel source code) is described at:
	http://nfs.sourceforge.net/#section_d
under section D2. The reason I found this manpage bug is because
I stumbled upon one of these silly renamed files, and an strace
of the rm-command revealed the EBUSY return errno.

I am not a native English speaker, so my text can certainly
be improved upon.

Regards,
-- 
Hendrik-Jan Thomassen     <hjt-Hf+EfML1qzhUecB6AVeNQA@public.gmane.org>
AT Computing
Linux/UNIXperts,
opleiders & oplossers     Tel +31 24 352 72 82
Kerkenbos 1238            Tel cursussecretariaat: +31 24 352 72 72
6546 BE  Nijmegen         Fax +31 24 352 72 92
info-I2/4/b2VdYhUecB6AVeNQA@public.gmane.org       www.atcomputing.nl

'If you think education is expensive, then try ignorance.'

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
