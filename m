From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] ld.so.8: Document LD_AUDIT
Date: Fri, 19 Dec 2008 16:20:31 -0500
Message-ID: <cfd18e0f0812191320o54724999l622b1b3ea59755da@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

[Was: Re: [PATCH] ld.so.8: Document LD_AUDIT and LD_POINTER_GUARD]

Hi Petr,

On Sun, Dec 7, 2008 at 1:28 PM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
> I was using existing comments, mailing list posts, and mainly the glibc
> source code as a reference. I'm not sure if LD_AUDIT is 100% compatible
> with Solaris but aside of the header names, it appears to be, based on
> quick comparison.

Yes, it looks very close to me as well -- though there are certainly
seem to be some differences, such as the absence of la_objfilter() for
glibc, and the addition of LA_SYMB_STRUCTCALL).  I've done a little
playing around with the API, and things seem to work as expected from
reading the Solaris docs.

> Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
>
> diff --git a/man8/ld.so.8 b/man8/ld.so.8
> index 6ca9a8c..69827f9 100644
> --- a/man8/ld.so.8
> +++ b/man8/ld.so.8
> @@ -1,5 +1,9 @@
>  .\" This is in the public domain
> -.TH LD.SO 8 2008-10-27 "GNU" "Linux Programmer's Manual"
> +.\"
> +.\" 2008-12-07 Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
> +.\"    Document LD_AUDIT and LD_POINTER_GUARD
> +.\"
> +.TH LD.SO 8 2008-12-07 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  ld.so, ld-linux.so* \- dynamic linker/loader
>  .SH SYNOPSIS
> @@ -177,13 +181,25 @@ Version of
>  for a.out binaries only.
>  Old versions of ld\-linux.so.1 also supported
>  .BR LD_ELF_PRELOAD .
> -.\" FIXME
> -.\" Document LD_AUDIT ("Install audit libraries for glibc")
> -.\" new in glibc 2.4
> -.\" ignored in set-user-ID and set-group-ID programs
> -.\"
> -.\" For some info, see Solaris Linker and Libraries Guide,
> -.\" "Runtime Linker Auditing Interface"
> +.TP
> +.B LD_AUDIT
> +(glibc since 2.4)
> +A colon-separated list of additional,

Why the word "additional" here?

> user-specified, ELF shared libraries

The word "libraries" is interesting.  The glibc sources imply that
multiple auditing libraries is supported, but a brief play with this
led to crashes for me.  (That could easily be because I'm doing things
wrong.)  Did you try this, or see an example anywhere?

> +to be loaded before all others in a separate linker namespace.
> +.B LD_AUDIT
> +is ignored for set-user-ID/set-group-ID binaries.
> +
> +The dynamic linker will notify the audit
> +libraries at so-called auditing checkpoints, like loading a new library,
> +resolving a symbol or calling a symbol from another shared object, by
> +calling an appropriate function within the audit library (the functions
> +start all with an
> +.B la_
> +prefix and are prototyped in
> +.BR "<link.h> " and " <bits/link.h>").

(.I for filenames, not .B)

> +The auditing interface is compatible with Solaris as described in its
> +.IR "Linker and Libraries Guide" ,
> +chapter Runtime Linker Auditing Interface.
>  .TP
>  .B LD_BIND_NOT
>  (glibc since 2.1.95)

I've tweaked your patch somewhat.  What do you think of the version below?

Cheers,

Michael

--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -177,13 +177,47 @@ Version of
 for a.out binaries only.
 Old versions of ld\-linux.so.1 also supported
 .BR LD_ELF_PRELOAD .
-.\" FIXME
-.\" Document LD_AUDIT ("Install audit libraries for glibc")
-.\" new in glibc 2.4
-.\" ignored in set-user-ID and set-group-ID programs
-.\"
-.\" For some info, see Solaris Linker and Libraries Guide,
-.\" "Runtime Linker Auditing Interface"
+.TP
+.B LD_AUDIT
+(glibc since 2.4)
+A colon-separated list of user-specified, ELF shared libraries
+to be loaded before all others in a separate linker namespace
+(i.e., one that does not intrude upon the normal symbol bindings that
+would occur in the process).
+These libraries can be used to audit the operation of the dynamic linker.
+.B LD_AUDIT
+is ignored for set-user-ID/set-group-ID binaries.
+
+The dynamic linker will notify the audit
+libraries at so-called auditing checkpoints\(emfor example,
+loading a new library, resolving a symbol,
+or calling a symbol from another shared object\(emby
+calling an appropriate function within the audit library.
+The following functions may be supplied in the audit library:
+.IR la_version (),
+.IR la_activity (),
+.IR la_objsearch (),
+.IR la_objopen (),
+.IR la_preinit (),
+.IR la_symbind32 (),
+.IR la_symbind64 (),
+.IR la_objclose (),
+.IR la_<platform>_pltenter ()
+(e.g.,
+.IR la_i86_gnu_pltenter ()),
+and
+.IR la_<platform>_pltexit ()
+(e.g.,
+.IR la_i86_gnu_pltexit ()).
+These functions are prototyped in
+.IR <link.h>
+and
+.IR <bits/link.h> .
+The auditing interface is largely compatible with that provided on Solaris,
+as described in its
+.IR "Linker and Libraries Guide" ,
+in the chapter
+.IR "Runtime Linker Auditing Interface" .
 .TP
 .B LD_BIND_NOT
 (glibc since 2.1.95)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
