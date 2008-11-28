From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: signal handling description for Michaels CLONE_NEWPID man page
Date: Fri, 28 Nov 2008 16:58:00 -0500
Message-ID: <cfd18e0f0811281358s2e831b04qc56277db403c2039@mail.gmail.com>
References: <20081127070720.954560982@bull.net>
	 <20081127070806.626288939@bull.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081127070806.626288939-6ktuUTfB/bM@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nadia.Derbey-6ktuUTfB/bM@public.gmane.org
Cc: serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, sukadev-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, xemul-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org, kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Nadia,

Thanks for putting this together.  A few questions below.

On Thu, Nov 27, 2008 at 2:07 AM,  <Nadia.Derbey-6ktuUTfB/bM@public.gmane.org> wrote:
> Michael,
>
> Here is the proposal for a description of signals handling in pid
> namespaces.
>
> This applies on top of your CLONE_NEWPID patch.
>
> Regards,
> Nadia
>
> ---
>  man2/clone.2 |   23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> Index: man-pages-3.13/man2/clone.2
> ===================================================================
> --- man-pages-3.13.orig/man2/clone.2    2008-11-24 09:34:30.000000000 +0100
> +++ man-pages-3.13/man2/clone.2 2008-11-27 09:17:53.000000000 +0100
> @@ -226,6 +226,29 @@ configuration option and requires that t
>  .RB (CAP_SYS_ADMIN ).
>  This flag can't be specified in conjunction with
>  .BR CLONE_THREAD .
> +
> +.BR "Signals handling:"
> +just like all the system calls that address a PID, signals can only be sent
> +to a process whose PID belongs to the same namespace as the caller.
> +
> +There are ways signals can be sent across namespaces boundaries such that

Just so I'm clear.  We're talking about the case here where, for
example, a process in a parent namespace sends a signal to a process
in the child namespace.  In such a case, the PID of the sender is not
meaningful.  Right?

> +the sender does not have a valid pid in the receiver's pid namespace.
> +In such cases, the sender pid will be seen by the receiver as a 0 value
> +(this has an impact, for example, on the
> +.BR siginfo_t
> +structure contents - NOTE, this is still under development).

Can you fill me in on the possibilities of "this is still under development"?

Cheers,

Michael

> +The "init" process of a PID namespace has a particular status, since it
> +is known both by its children as PID 1 and by its father's PID namespace
> +as any other PID. Thus, the "init" process of a PID namespace can be sent
> +any signal by a process that belongs to its ancestor's PID namespace (given
> +that the sender has the appropriate permission). But the only signals that
> +can be sent to the "init" process of a PID namespace from its own namespace
> +are those for which it has explicitly installed signal handlers.
> +More precisely, signals are sent successfully (i.e
> +.BR kill (2)
> +will not fail), but the "init" process will silently ignore unhandled signals.
> +
>  .TP
>  .BR CLONE_PARENT " (since Linux 2.3.12)"
>  If
>
> --
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
