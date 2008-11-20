From: ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org (Eric W. Biederman)
Subject: Re: CLONE_NEWIPC documentation
Date: Wed, 19 Nov 2008 17:16:28 -0800
Message-ID: <m163mji4cz.fsf@frodo.ebiederm.org>
References: <4924651C.4080909@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4924651C.4080909-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (Michael Kerrisk's message of "Wed,
	19 Nov 2008 14:12:28 -0500")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Kirill Korotaev <dev-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, Pavel Emelianov <xemul-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, Cedric Le Goater <clg-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:

> Kirill, Pavel,
>
> Below is a patch to document the CLONE_NEWIPC flag that was
> added in 2.6.19.
>
> Could you please review and let me know of improvements
> or inaccuracies?
>
> Cheers,
>
> Michael
>
> --- a/man2/clone.2
> +++ b/man2/clone.2
> @@ -225,6 +224,36 @@ Calls to
>  .BR umask (2)
>  performed later by one of the processes do not affect the other process.
>  .TP
> +.BR CLONE_NEWIPC " (since Linux 2.4.19)"
> +If
> +.B CLONE_NEWIPC
> +is set, then create the process in a new IPC namespace.
> +If this flag is not set, then (as with
> +.BR fork (2)),
> +the process is created in the same IPC namespace as
> +the calling process.

> +This flag is intended for the implementation of control groups.

The above sentence is wrong.

+This flag is intended for the implementation of containers.

Would be correct.

Both control groups and namespaces feed into the user space container
concept.  Control groups are multiprocess resource limits.
Namespaces are affect the mapping from resource name to resource.

What is interesting is you can unshare a sysvipc namespace and still have
sysvipc shared memory mapped from another sysvipc namespace.

This is something that needs to be watched for.

Eric
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
