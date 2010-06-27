From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Doubts with sysfs(2)
Date: Sun, 27 Jun 2010 15:54:10 +0200
Message-ID: <AANLkTilFc81wcLlG_ELqjDb8xz1RZC_Y3Okh5ncCrOxH@mail.gmail.com>
References: <1277635872.25713.4.camel@cowboy>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1277635872.25713.4.camel@cowboy>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dave.bueso-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: tdyas-plZrL8KR64B+CIkdHa1UOg@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Dave,

On Sun, Jun 27, 2010 at 12:51 PM, Davidlohr Bueso <dave.bueso-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
>
> I recently ran into the sysfs(2) call and noticed that the manpage does
> not specify what header file(s) to include to use it. Now, is this
> because of the lack of libc/glibc support (hence no wrapper available)?
>
> If so, I think we should add this problem in the BUGS section of the
> page, and put something like:
>
> syscall(SYS_sysfs, number);
>
> Any comments would be appreciated.

sysfs() is obsolete. Probably nothing uses it any more, and nothing
new should, so explaining how to use it seems redundant. What I did do
was clarify that it is obsolete. The change below is for
man-pages-3.26.

Cheers,

Michael


--- a/man2/sysfs.2
+++ b/man2/sysfs.2
@@ -90,12 +90,12 @@ is invalid.
 .SH "CONFORMING TO"
 SVr4.
 .SH NOTES
-On Linux with the
-.I proc
-file system mounted on
+This System-V derived system call is obsolete; don't use it.
+On systems with
 .IR /proc ,
-the same information can be derived from
-.IR /proc/filesystems .
+the the same information can be obtained via
+.IR /proc/filesystems ;
+use that interface instead.
 .SH BUGS
 There is no libc or glibc support.
 There is no way to guess how large \fIbuf\fP should be.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
