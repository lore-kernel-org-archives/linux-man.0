From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ld.so - add environment placeholders
Date: Thu, 21 Apr 2016 14:20:19 +0200
Message-ID: <CAKgNAkjDuE9GKGW5t2AV=wJ-1cS4JKu7X4jj_xiSjQMZp+FnjQ@mail.gmail.com>
References: <CAOazyz0=jopXbWJBtBLgxF087nmHph4u3q9nG=5CjPSzKqD8Mg@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOazyz0=jopXbWJBtBLgxF087nmHph4u3q9nG=5CjPSzKqD8Mg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alon Bar-Lev <alon.barlev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Alon,

Long after the fact...

On 22 August 2011 at 21:21, Alon Bar-Lev <alon.barlev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Discussion is here[1].
>
> Apparently there is a hidden feature in ld.so, it support variable
> placeholders within environment.
>
> This is great for supporting mixed multilib environment.
>
> Example:
>
> export LD_LIBRARY_PATH=3D"${LD_LIBRARY_PATH}:/opt/my/\${LIB}"
>
> I believe this worth a documentation, as almost nobody knows this.
>
> ---
>  ENVIRONMENT
> +       ld.so understands the strings $ORIGIN, $LIB and $PLATFORM  (o=
r  equiva=E2=80=90
> +       lently   ${var})   in  some  of  the  environment  variables,=
  such  as
> +       LD_LIBRARY_PATH and LD_PRELOAD:
> +
> +              ORIGIN is expanded to the location of the binary which=
  is  cur=E2=80=90
> +              rently loaded.
> +
> +              LIB  is  expanded to lib, lib64 or any other multilib =
configura=E2=80=90
> +              tion based on the ld configuration.  Use when mixed  e=
nvironment
> +              (32bit and 64bit) searches for same libraries names.
> +
> +              PLATFORM is expanded to the running platform.
>
>         There are four important environment variables.
> ---
>
> Any test will do! as long as this feature gets documented.
>
> Signed-off-by: Alon Bar-Lev <alon.barlev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> [1] http://sourceware.org/ml/libc-alpha/2011-08/msg00089.html
>
> ---
>
> [Attached]
> I am not subscribed, so please CC me.

I applied the patch below. Thanks for the report, and sorry that it
fell on the floor long ago.

Cheers,

Michael

diff --git a/man8/ld.so.8 b/man8/ld.so.8
index b33f417..59c959e 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -162,6 +162,14 @@ Use
 instead of
 .B LD_LIBRARY_PATH
 environment variable setting (see below).
+The names
+.IR ORIGIN ,
+.IR LIB ,
+and
+.IR PLATFORM
+are interpreted as for the
+.BR LD_LIBRARY_PATH
+environment variable.
 .TP
 .BI \-\-inhibit\-rpath " list"
 Ignore RPATH and RUNPATH information in object names in
@@ -258,6 +266,31 @@ Similar to the
 .B PATH
 environment variable.
 This variable is ignored in secure-execution mode.
+
+Within the pathnames specified in
+.BR LD_LIBRARY_PATH ,
+the dynamic linker expands the strings
+.IR $ORIGIN ,
+.IR $LIB ,
+and
+.IR $PLATFORM
+(or the versions using curly braces around the names)
+as described above in
+.IR "Rpath token expansion" .
+Thus, for example,
+the following would cause a library to be searched for in either the
+.I lib
+or
+.I lib64
+subdirectory below the directory containing the program to be executed=
:
+
+    $ \fBLD_LIBRARY_PATH=3D'$ORIGIN/$LIB' prog\fP
+
+(Note the use of single quotes, which prevent expansion of
+.I ORIGIN
+and
+.I LIB
+as shell variables!)
 .TP
 .B LD_PRELOAD
 A list of additional, user-specified, ELF shared
@@ -269,6 +302,23 @@ In secure-execution mode,
 preload pathnames containing slashes are ignored,
 and shared objects in the standard search directories are loaded
 only if the set-user-ID mode bit is enabled on the shared object file.
+
+Within the pathnames specified in
+.BR LD_PRELOAD ,
+the dynamic linker understands the strings
+.IR $ORIGIN ,
+.IR $LIB ,
+and
+.IR $PLATFORM
+(or the versions using curly braces around the names)
+as described above in
+.IR "Rpath token expansion" .
+.\" Tested with the following:
+.\"
+.\"    LD_PRELOAD=3D'$LIB/libmod.so' LD_LIBRARY_PATH=3D. ./prog
+.\"
+.\" which will reload the libmod.so in 'lib' or 'lib64', using it
+.\" in preference to the version in '.'.
 .TP
 .B LD_TRACE_LOADED_OBJECTS
 (ELF only)


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
