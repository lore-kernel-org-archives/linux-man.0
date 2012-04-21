From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fchmodat: split kernel/C library documents
Date: Sun, 22 Apr 2012 07:09:13 +1200
Message-ID: <CAKgNAkiUxv7_xFv3FzbYNeHagUrC3LZXbZTz-k5sWip_NO2hsw@mail.gmail.com>
References: <1331692947-15879-1-git-send-email-vapier@gentoo.org>
 <CAKgNAkiACOdmvpr+tyVx-j=twG2Dtp1rNn=km4jR7vvc53K24g@mail.gmail.com> <201204211401.02304.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201204211401.02304.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mike,

On Sun, Apr 22, 2012 at 6:01 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wro=
te:
> On Sunday 15 April 2012 07:15:27 Michael Kerrisk (man-pages) wrote:
>> Take a look at
>> http://www.kernel.org/doc/man-pages/todo.html#migrate_to_kernel_sour=
ce,
>> which covers what your patch is trying to do. In general, I'm not in=
 favor
>> of patches like this; rather, I try to have a single page where
>> differences (if any) between the system call and libc wrapper are
>> noted. Thus, I'd propose the patch below instead. Seem okay?
>
> i like having dedicated man pages when things are different as the no=
tes
> section tends to get missed at the bottom. =A0but this change is bett=
er than
> nothing.

(Current way of doing things is a design compromise.)

>> --- a/man2/fchmodat.2
>> +++ b/man2/fchmodat.2
>>
>> +This page documents the interface provided by the
>> +glibc wrapper function for the
>
> not to be pedantic, but this isn't glibc specific. =A0fchmodat() is a=
 POSIX
> interface, so every C library will have this difference.

Yes, it's worth being clearer on that. I applied the patch below.

Cheers,

Michael


--- a/man2/fchmodat.2
+++ b/man2/fchmodat.2
@@ -143,11 +143,9 @@ See
 for an explanation of the need for
 .BR fchmodat ().

-This page documents the interface provided by the
-glibc wrapper function for the
-.BR fchmodat ()
-system call.
-The underlying system call does
+The GNU C library wrapper function implements the POSIX-specified
+interface described in this page.
+This interface differs from the underlying Linux system call, which do=
es
 .I not
 have a
 .I flags



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
