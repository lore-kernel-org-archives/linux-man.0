From: "Serge E. Hallyn" <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>
Subject: Re: CLONE_NEWIPC documentation
Date: Sun, 23 Nov 2008 16:48:42 -0600
Message-ID: <20081123224842.GD12687@hallyn.com>
References: <4924651C.4080909@gmail.com> <m163mji4cz.fsf@frodo.ebiederm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <m163mji4cz.fsf-B27657KtZYmhTnVgQlOflh2eb7JE58TQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Kirill Korotaev <dev-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, Pavel Emelianov <xemul-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>, Cedric Le Goater <clg-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Quoting Eric W. Biederman (ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org):
> > +This flag is intended for the implementation of control groups.
> 
> The above sentence is wrong.
> 
> +This flag is intended for the implementation of containers.
> 
> Would be correct.
> 
> Both control groups and namespaces feed into the user space container
> concept.  Control groups are multiprocess resource limits.
> Namespaces are affect the mapping from resource name to resource.
> 
> What is interesting is you can unshare a sysvipc namespace and still have
> sysvipc shared memory mapped from another sysvipc namespace.
> 
> This is something that needs to be watched for.

Oh, I see, so please disregard my last msg, it seems Eric was plenty
clear.

thanks,
-serge
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
