From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: About thread-safety information in library functions' man-pages
Date: Sun, 14 Nov 2010 07:40:38 +0100
Message-ID: <AANLkTikVuuZ1N6C5T+GwbgQEH7EAxXPvqrmATZgcM-gE@mail.gmail.com>
References: <4C7C9EA6.90609@cn.fujitsu.com> <AANLkTimcJ4kSuB-vZSY2_CYDs12S0ODup9-Y9yj-uQrJ@mail.gmail.com>
 <4C8DEC85.8030007@cn.fujitsu.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4C8DEC85.8030007-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: pasky-AlSwsSmVLrQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Peng,

On Mon, Sep 13, 2010 at 11:19 AM, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> w=
rote:
> Hi Michael,
>
> Michael Kerrisk said the following on 2010-9-11 12:06:
>> By "formal" I mean that we could have a section "ATTRIBUTES" that
>> lists such attributes. That section could fall between VERSIONS and
>> CONFORMING TO (see man-pages(7)). To start with, you might write
>> patches that document just thread-safety, but later other pieces mig=
ht
>> get added as well (e.g., async-signal-safety).
>>
>> What do you think? If this sounds sensible, write one or two patches
>> in the style I suggest, and then we can discuss furtehr.
>>
>
> =A0I think your proposal is good. So, I make two patches in your styl=
e,
> they are 0001* and 0002*. The third patch is used to add description
> of "ATTRIBUTES" into man-pages(7).
>
> =A0What's your opinion? If you agree with me, I'll gradually make mor=
e
> patches.

Sorry for the very long delay in following up on this. I'm reflecting
on this a little more. My idea is that the ATTRIBUTES section might
eventually contain multiple subsections, but for now, we have just
"Multithreading", which mentions thread safety, cancellation safety,
and async-cancel-safety. And I think it might be better to place this
section just above (rather than just below) VERSIONS. So, I'd fine
tune things a little, with a patch something like this for
man-pages(7).

=3D=3D=3D
@@ -180,6 +180,7 @@
 .\" SECURITY,
 ENVIRONMENT
 FILES
+ATTRIBUTES         [Normally only in Sections 2, 3]
 VERSIONS           [Normally only in Sections 2, 3]
 CONFORMING TO
 NOTES
@@ -202,7 +203,7 @@

 The following list elaborates on the contents of each of
 the above sections.
-.TP 14
+.TP 10
 .B NAME
 The name of this manual page.
 See
@@ -316,6 +317,28 @@
 .\" section).
 .\" However, please include security information somewhere!
 .TP
+.B ATTRIBUTES
+A summary of various attributes of the function(s) documented on this =
page,
+broken into subsections.
+The following subsections are defined:
+.sp
+.RS
+.TP
+.B "Multithreading (see pthreads(7))"
+This subsection notes attributes relating to multithreaded application=
s:
+.RS
+.IP * 3
+Whether the function is thread-safe.
+.IP *
+Whether the function is a cancellation point.
+.IP *
+Whether the function is async-cancel-safe.
+.RE
+.IP
+Details of these attributes can be found in
+.BR pthreads (7).
+.RE
+.TP
 .B VERSIONS
 A brief summary of the Linux kernel or glibc versions where a
 system call or library function appeared,
=3D=3D=3D

Then for the individual pages, the patches might look like this:
=3D=3D=3D
--- a64l.3	2010-11-01 08:07:38.000000000 +0100
+++ a64l.3.attr	2010-11-14 07:34:42.000000000 +0100
@@ -56,6 +56,15 @@
 .fi
 .RE
 So 123 =3D 59*64^0 + 1*64^1 =3D "v/".
+.SH ATTRIBUTES
+.SS Multithreading (see pthreads(7))
+The
+.BR l64a ()
+function is not thread-safe.
+.LP
+The
+.BR a64l ()
+function is thread-safe.
 .SH "CONFORMING TO"
 POSIX.1-2001.
 .SH NOTES
=3D=3D=3D

How does that sound?

Now, before we apply a vast number of patches, it might be good to
build a list of pages and the kinds of changes that would be needed
for each (look at the latest pthreads(7) page in git for some starting
points on functions that fall into the various categories; possibly
your research has revealed additional information about the actual
details in glibc). Could you come up with such lists? (They don't need
to be complete or comprehensive, but it could be helpful to have a
picture of where we might start making changes.)

Thanks,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
