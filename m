From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: backtrace_symbols_fd() can trigger a call to malloc()
Date: Fri, 05 Dec 2014 16:18:27 +0100
Message-ID: <5481CCC3.3020405@bfs.de>
References: <CACKs7VD8DcgDBOU85uxq6R2n5sC4cAEH7cdE90Zt9EN3Of7e=g@mail.gmail.com>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACKs7VD8DcgDBOU85uxq6R2n5sC4cAEH7cdE90Zt9EN3Of7e=g@mail.gmail.com>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lnx-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org



Am 05.12.2014 16:09, schrieb Stefan Puiu:
> Hi Michael,
>=20
> Currently, the backtrace(3) manual page says this about backtrace_sym=
bols_fd():
>=20
> back=E2=80=90
>        trace_symbols_fd() does not call malloc(3), and so can be
> employed in situations where the latter function might fail.
>=20
>=20
> However, I watched a video of a presentation about signal handling an=
d
> the speaker was saying that calling backtrace() can trigger a call to
> malloc - indirectly. That happens because the backtrace*() functions
> are part of libgcc, which gets dynamically loaded whenever needed;
> dynamic loading would, in turn, trigger a malloc. The talk can be
> found here: http://free-electrons.com/pub/video/2008/ols/ols2008-gila=
d-ben-yossef-fault-handlers.ogg
>=20
> I decided to test it out, and it seems that this is still true (at
> least on Ubuntu 12.04). I compiled the attached program (I used
> CXXFLAGS =3D '-Wall -g -std=3Dc++0x', the -std=3D part is not really =
needed)
> and ran it through gdb, putting a breakpoint on the line where
> backtrace is called. When that breakpoint is hit, I set a breakpoint
> on malloc, continued and voila:
>=20
> Breakpoint 2, __GI___libc_malloc (bytes=3D36) at malloc.c:2910
> 2910    malloc.c: No such file or directory.
> (gdb) bt
> #0  __GI___libc_malloc (bytes=3D36) at malloc.c:2910
> #1  0x00007ffff7de294e in local_strdup (s=3D0x7ffff7ff2574
> "/lib/x86_64-linux-gnu/libgcc_s.so.1") at dl-load.c:162
> #2  _dl_map_object (loader=3D0x7ffff7ff94c0, name=3D0x7ffff7b94918
> "libgcc_s.so.1", type=3D2, trace_mode=3D0, mode=3D-1879048191,
> nsid=3D<optimized out>) at dl-load.c:2473
> #3  0x00007ffff7ded84b in dl_open_worker (a=3D0x7fffffffdcb0) at dl-o=
pen.c:225
> #4  0x00007ffff7de9176 in _dl_catch_error (objname=3D0x7fffffffdcf8,
> errstring=3D0x7fffffffdd00, mallocedp=3D0x7fffffffdd0f,
> operate=3D0x7ffff7ded700 <dl_open_worker>, args=3D0x7fffffffdcb0) at
> dl-error.c:178
> #5  0x00007ffff7ded31a in _dl_open (file=3D0x7ffff7b94918
> "libgcc_s.so.1", mode=3D-2147483647, caller_dlopen=3D0x7ffff7b260a9,
> nsid=3D-2, argc=3D1, argv=3D<optimized out>, env=3D0x7fffffffe068) at
> dl-open.c:639
> #6  0x00007ffff7b4bc62 in do_dlopen (ptr=3D0x7fffffffdeb0) at dl-libc=
=2Ec:89
> #7  0x00007ffff7de9176 in _dl_catch_error (objname=3D0x7fffffffdee0,
> errstring=3D0x7fffffffded0, mallocedp=3D0x7fffffffdeef,
> operate=3D0x7ffff7b4bc20 <do_dlopen>, args=3D0x7fffffffdeb0) at
> dl-error.c:178
> #8  0x00007ffff7b4bd24 in dlerror_run (args=3D0x7fffffffdeb0,
> operate=3D0x7ffff7b4bc20 <do_dlopen>) at dl-libc.c:48
> #9  __GI___libc_dlopen_mode (name=3D<optimized out>, mode=3D<optimize=
d
> out>) at dl-libc.c:165
> #10 0x00007ffff7b260a9 in init () at ../sysdeps/x86_64/../ia64/backtr=
ace.c:53
> #11 __GI___backtrace (array=3D<optimized out>, size=3D20) at
> ../sysdeps/x86_64/../ia64/backtrace.c:104
> #12 0x000000000040066c in g () at backtrace.cpp:20
> #13 0x000000000040068c in f () at backtrace.cpp:26
> #14 0x0000000000400697 in main () at backtrace.cpp:31
>=20
> Here's a tentative patch for backtrace.3 against git:
>=20
>=20
> diff --git a/man3/backtrace.3 b/man3/backtrace.3
> index 1b21794..5344d58 100644
> --- a/man3/backtrace.3
> +++ b/man3/backtrace.3
> @@ -114,7 +114,8 @@ it writes the strings, one per line, to the file =
descriptor
>  .BR backtrace_symbols_fd ()
>  does not call
>  .BR malloc (3),
> -and so can be employed in situations where the latter function might=
 fail.
> +and so can be employed in situations where the latter function might
> +fail, but see NOTES.
>  .SH RETURN VALUE
>  .BR backtrace ()
>  returns the number of addresses returned in
> @@ -156,6 +157,21 @@ violated.
>  Inlined functions do not have stack frames.
>  .IP *
>  Tail-call optimization causes one stack frame to replace another.
> +.IP *
> +.BR backtrace ()
> +and
> +.BR backtrace_symbols_fd ()
> +don't call
> +.BR malloc ()
> +explicitly, but they are part of libgcc, which gets loaded dynamical=
ly
> +when first used. Dynamic loading usually triggers a call to
> +.BR malloc ().

> +So you need to call
> +.BR backtrace ()
> +or some other libgcc function early in your program to trigger loadi=
ng
> +of libgcc in order to make sure that later calls don't trigger the
> +indirect memory allocation (for instance when called from a signal
> +handler).

I would drop that part. there are several way to load libgcc (e.g.LD_PR=
ELOAD).

what about "make sure that libgcc is already loaded at the begining" ?
something like that.


just my 2 cents
re,
 wh

>  .PP
>  The symbol names may be unavailable without the use of special linke=
r
>  options.
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
