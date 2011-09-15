From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: small bug in unlink(2) manpage
Date: Thu, 15 Sep 2011 20:38:54 +0200
Message-ID: <CAKgNAkiaKNxr_2n03icCA1RPyQzBMrKLCcU4WztHy5_ZNbyqvA@mail.gmail.com>
References: <20110811081742.GA26403@vcursdoc.atcomputing.nl>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110811081742.GA26403-2gAsihd9xRjpBEjGIDjKf0nExbqEVREo@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hendrik Jan Thomassen <hjt-I2/4/b2VdYhUecB6AVeNQA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Hendrik,

On Thu, Aug 11, 2011 at 10:17 AM, Hendrik Jan Thomassen
<hjt-I2/4/b2VdYhUecB6AVeNQA@public.gmane.org> wrote:
>
> This is a report about a small bug in the manpage for the
> unlink(2) system call. I found the bug in my Ubuntu 10.10
> distribution; its Colophon says: "This =A0page =A0is =A0part =A0of
> release =A03.23 =A0of the Linux man-pages project".
>
> The bug is also present in the on-line manpages at
> =A0 =A0http://www.kernel.org/doc/man-pages/online_pages.html
>
> The current version of the page says (under ERRORS):
>
>> EBUSY (not on Linux)
>> =A0The =A0file pathname cannot be unlinked because it is being
>> =A0used by the system or another process and the
>> =A0implementation considers this an error.
>
> But if you look in the kernel source file =A0 fs/namei.c
> at routine =A0may_delete() =A0you'll see two occasions where
> an EBUSY is generated. So the above "not on Linux" is wrong.
>
> I suggest that this '(not on Linux)' be removed. It may
> also improve the page if the commentary is reworded to give a
> better description of the two situations. Something along
> the lines of:
>> The file pathname cannot be unlinked because it is being used
>> by the system, e.g. if some (relative) rootdir is mounted upon it,
>> or because the NFS client software created it to represent an
>> active but otherwise nameless inode ("NFS silly renamed").
>
> Just FYI: the NFS silly rename (you'll find this term mentioned
> in the kernel source code) is described at:
> =A0 =A0 =A0 =A0http://nfs.sourceforge.net/#section_d
> under section D2. The reason I found this manpage bug is because
> I stumbled upon one of these silly renamed files, and an strace
> of the rm-command revealed the EBUSY return errno.
>
> I am not a native English speaker, so my text can certainly
> be improved upon.

Thanks very much for this report. For man-pages-3.33, I applied the
change below.

Cheers,

Michael

--- a/man2/unlink.2
+++ b/man2/unlink.2
@@ -69,11 +69,14 @@ did not allow search permission.
 (See also
 .BR path_resolution (7).)
 .TP
-.BR EBUSY " (not on Linux)"
+.BR EBUSY
 The file
 .I pathname
 cannot be unlinked because it is being used by the system
-or another process and the implementation considers this an error.
+or another process;
+for example, it is a mount point
+or the NFS client software created it to represent an
+active but otherwise nameless inode ("NFS silly renamed").
 .TP
 .B EFAULT
 .I pathname

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
