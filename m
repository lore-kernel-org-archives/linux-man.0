From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [PATCH] ld.so.8: Document LD_AUDIT
Date: Wed, 7 Jan 2009 19:25:54 +0100
Message-ID: <20090107182554.GA21648@machine.or.cz>
References: <cfd18e0f0812191320o54724999l622b1b3ea59755da@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0812191320o54724999l622b1b3ea59755da-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi!

On Fri, Dec 19, 2008 at 04:20:31PM -0500, Michael Kerrisk wrote:
> On Sun, Dec 7, 2008 at 1:28 PM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
> > +.TP
> > +.B LD_AUDIT
> > +(glibc since 2.4)
> > +A colon-separated list of additional,
> 
> Why the word "additional" here?

Copy'n'paste oversight, sorry.

> > user-specified, ELF shared libraries
> 
> The word "libraries" is interesting.  The glibc sources imply that
> multiple auditing libraries is supported, but a brief play with this
> led to crashes for me.  (That could easily be because I'm doing things
> wrong.)  Did you try this, or see an example anywhere?

I have not tested this, just assumed from the code. Maybe 'shared
objects' would be more appropriate, too?

> --- a/man8/ld.so.8
> +++ b/man8/ld.so.8
> @@ -177,13 +177,47 @@ Version of
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
> +A colon-separated list of user-specified, ELF shared libraries
> +to be loaded before all others in a separate linker namespace
> +(i.e., one that does not intrude upon the normal symbol bindings that
> +would occur in the process).
> +These libraries can be used to audit the operation of the dynamic linker.
> +.B LD_AUDIT
> +is ignored for set-user-ID/set-group-ID binaries.
> +
> +The dynamic linker will notify the audit
> +libraries at so-called auditing checkpoints\(emfor example,
> +loading a new library, resolving a symbol,
> +or calling a symbol from another shared object\(emby
> +calling an appropriate function within the audit library.
> +The following functions may be supplied in the audit library:
> +.IR la_version (),
> +.IR la_activity (),
> +.IR la_objsearch (),
> +.IR la_objopen (),
> +.IR la_preinit (),
> +.IR la_symbind32 (),
> +.IR la_symbind64 (),
> +.IR la_objclose (),
> +.IR la_<platform>_pltenter ()
> +(e.g.,
> +.IR la_i86_gnu_pltenter ()),
> +and
> +.IR la_<platform>_pltexit ()
> +(e.g.,
> +.IR la_i86_gnu_pltexit ()).
> +These functions are prototyped in
> +.IR <link.h>
> +and
> +.IR <bits/link.h> .
> +The auditing interface is largely compatible with that provided on Solaris,
> +as described in its
> +.IR "Linker and Libraries Guide" ,
> +in the chapter
> +.IR "Runtime Linker Auditing Interface" .
>  .TP
>  .B LD_BIND_NOT
>  (glibc since 2.1.95)

Acked-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
