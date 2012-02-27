From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fsync.2 updates
Date: Mon, 27 Feb 2012 14:08:37 +1300
Message-ID: <CAKgNAkh2yH=37w+PMfj4P1FD7=4XkdZ4caYLwNEvE71xsqrxiA@mail.gmail.com>
References: <20111104061203.GA1300@infradead.org> <20120101024916.GA16572@gaara.hadrons.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120101024916.GA16572-v62vTE6/wQGgM1MOaoewpti2O/JbrIOy@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Guillem,

On Sun, Jan 1, 2012 at 3:49 PM, Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org> wro=
te:
> Hi!
>
> On 2011-11-04 6:12:04, Christoph Hellwig wrote:
>> - fsync works on any fd and does not require a writeable one,
>> =A0 correct the EBADF error code explanation.
>
> The problem is, while this is true for Linux, that's not a safe porta=
ble
> assumption to make on POSIX in general as that behaviour is not
> specified and as such is implementation specific, some Unix systems
> do actually fail on read-only file descriptors, for example:
>
> =A0<http://h30097.www3.hp.com/docs/base_doc/DOCUMENTATION/V50_HTML/MA=
N/MAN2/0033____.HTM>
> =A0<http://publib.boulder.ibm.com/infocenter/aix/v6r1/index.jsp?topic=
=3D/com.ibm.aix.basetechref/doc/basetrf1/fsync.htm>
>
> So if this part of the patch gets applied it would be nice to add a
> note stating this is Linux specific behaviour, and that other systems
> might still fail on such condition.

Good catch! I applied the patch below.

Cheers,

Michael


--- a/man2/fsync.2
+++ b/man2/fsync.2
@@ -139,6 +139,12 @@ to a value greater than 0.
 .\" -1: unavailable, 0: ask using sysconf().
 .\" glibc defines them to 1.
 .SH NOTES
+On some UNIX systems (but not Linux),
+.I fd
+must be a
+.I writable
+file descriptor.
+
 In Linux 2.2 and earlier,
 .BR fdatasync ()
 is equivalent to

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
