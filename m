From: "Serge E. Hallyn" <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>
Subject: Re: Documentation for CLONE_NEWPID
Date: Sun, 23 Nov 2008 16:20:23 -0600
Message-ID: <20081123222023.GB12687@hallyn.com>
References: <4923810B.7010201@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4923810B.7010201-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Pavel Emelyanov <xemul-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sukadev Bhattiprolu <sukadev-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Nadia Derbey <Nadia.Derbey-6ktuUTfB/bM@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Quoting Michael Kerrisk (mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org):
> Pavel, Kir,
> 
> Drawing fairly heavily on your LWN.net article
> (http://lwn.net/Articles/259217/), plus the kernel source and some
> experimentation, I created the patch below to document CLONE_NEWPID for the
> clone(2) manual page.  Could you please review and let me know of any
> improvements or inaccuracies.


Thanks, Michael, this is something we've definately been wanting to
get to.

...

> +(i.e., the process created using the
> +.BR CLONE_NEWPID
> +flag) has the PID 1, and is the "init" process for the namespace.
> +Children that are orphaned within the namespace will be reparented
> +to this process rather than
> +.BR init (8).
> +Unlike the traditional
> +.B init
> +process, the "init" process of a PID namespace can terminate,
> +and if it does, all of the processes in the namespace are terminated.
> +
> +PID namespaces form a hierarchy.
> +When a PID new namespace is created,
> +the PIDs of the processes in that namespace are visible

The processes in that namespace are visible, but by different
pids.  So saying that the pids are visible in the parent
pidns isn't quite right.

> +in the PID namespace of the process that created the new namespace;
> +analogously, if the parent PID namespace is itself
> +the child of another PID namespace,
> +then PIDs of the child and parent PID namespaces will both be

Again, the processes, not pids, are visible.

> +visible in the grandparent PID namespace.
> +Conversely, the processes in the "child" PID namespace do not see
> +the PIDs of the processes in the parent namespace.
> +The existence of a namespace hierarchy means that each process
> +may now have multiple PIDs:
> +one for each namespace in which it is visible.
> +(A call to
> +.BR getpid (2)
> +always returns the PID associated with the namespace in which
> +the process was created.)
> +
> +After creating the new namespace,
> +it is useful for the child to change its root directory
> +and mount a new procfs instance at
> +.I /proc
> +so that tools such as
> +.BR ps (1)
> +work correctly.

Probably not worth mentioning here, but if it has done
CLONE_NEWNS then it doesn't need to change its root, it
can just mount a new proc instance over /proc.

> +
> +Use of this flag requires: a kernel configured with the
> +.B CONFIG_PID_NS
> +configuration option and requires that the process be privileged
> +.RB (CAP_SYS_ADMIN ).
> +This flag can't be specified in conjunction with
> +.BR CLONE_THREAD .
> +.TP
>  .BR CLONE_PARENT " (since Linux 2.3.12)"
>  If
>  .B CLONE_PARENT
> @@ -627,6 +701,14 @@ were specified in
>  .IR flags .
>  .TP
>  .B EINVAL
> +Both
> +.BR CLONE_NEWPID
> +and
> +.BR CLONE_THREAD
> +were specified in
> +.IR flags .
> +.TP
> +.B EINVAL
>  Returned by
>  .BR clone ()
>  when a zero value is specified for
> @@ -639,6 +721,8 @@ copied.
>  .TP
>  .B EPERM
>  .B CLONE_NEWNS
> +or
> +.B CLONE_NEWPID
>  was specified by a non-root process (process without \fBCAP_SYS_ADMIN\fP).
>  .TP
>  .B EPERM

I assume you've considered the pros and cons of mentioning
signal semantics with respect to init tasks of child pid namespaces,
and decided it's not worth mentioning yet as the semantics are not
yet finalized?

The goal is to treat the process as a system-wide init with respect
to signals coming from its own namespace, and treat it as an ordinary
task for signals coming from its ancestor namespaces.  But as you've
probably read, the implementation may result in some unfortunate
side-effects regarding blocked signals etc.

thanks,
-serge
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
