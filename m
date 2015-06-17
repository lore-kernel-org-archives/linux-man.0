From: Arjun Shankar <arjun-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] hosts.equiv.5: Fix format, clarify IdM needs, and
 provide examples.
Date: Wed, 17 Jun 2015 18:17:55 +0200
Message-ID: <20150617181755.0bea170c@zion>
References: <55615A71.4010600@redhat.com>
	<557FF511.7040500@gmail.com>
	<558091DD.30004@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <558091DD.30004-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

> > Just a note: I'm hoping for a response from Arjun before I commit this.
> Hope is not a plan :-)

I see that I got here a little late. This looks good, but I have one
nitpick:

> +Allow user from host to login:
> +.LP
> +.RS 4
> +.TP
> +host user

It might make sense to repeat here that such an entry will allow the
specified user on the remote host to login as *any* user on the local host.

i.e., something like:

-Allow user from host to login:
+Allow user from host to login as any non-root user:

Cheers,
Arjun
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
