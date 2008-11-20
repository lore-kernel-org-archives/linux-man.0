From: ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org (Eric W. Biederman)
Subject: Re: CLONE_NEWUTS documentation
Date: Wed, 19 Nov 2008 17:21:56 -0800
Message-ID: <m1y6zfgpjf.fsf@frodo.ebiederm.org>
References: <492464F8.8070101@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <492464F8.8070101-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (Michael Kerrisk's message of "Wed,
	19 Nov 2008 14:11:52 -0500")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: "Serge E. Hallyn" <serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kirill Korotaev <dev-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, Herbert Poetzl <herbert-dBHVzrDq9nF4Lj/PQRBjDg@public.gmane.org>, Andrey Savochkin <saw-3ImXcnM4P+0@public.gmane.org>, Subrata Modak <subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:

> Serge, Eric,
>
> Below is a patch to document the CLONE_NEWUTS flag that was
> added in 2.6.19.
>
> Could you please review and let me know of improvements
> or inaccuracies?
>
> By the way, does anyone know where the UTS name in the uname()
> API comes from? My best guess is that it's from Unix Timesharing
> System, but I don't know this for sure.
>
> Cheers,
>
> Michael
>
> diff --git a/man2/clone.2 b/man2/clone.2
> index 7212332..80f9caf 100644
> --- a/man2/clone.2
> +++ b/man2/clone.2
> @@ -341,6 +340,33 @@ configuration option and that the process be privileged
>  This flag can't be specified in conjunction with
>  .BR CLONE_THREAD .
>  .TP
> +.BR CLONE_NEWUTS " (since Linux 2.6.19)"
> +If
> +.B CLONE_NEWUTS
> +is set, then create the process in a new UTS namespace.
> +If this flag is not set, then (as with
> +.BR fork (2)),
> +the process is created in the same UTS namespace as
> +the calling process.

> +This flag is intended for the implementation of control groups.

See my previous email about containers vs control groups.

There are some corner cases with NFS usage in the kernel that still
need to be resolved but otherwise the uts namespace is considered correct
and complete.

Eric
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
