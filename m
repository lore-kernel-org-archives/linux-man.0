From: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] adjtimex: PPM scaling is by 2^-16
Date: Fri, 2 Jan 2015 19:51:44 +0100
Message-ID: <20150102185144.GB4206@localhost.localdomain>
References: <54A2DEAD.2050708@supelec.fr>
 <20150102024118.GA8293@unpythonic.net>
 <20150102062920.GB4221@localhost.localdomain>
 <54A6C9B5.4050904@supelec.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54A6C9B5.4050904-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Cc: Jeff Epler <jepler-ixP+gI44yfQ4d9/VWYMlNA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Jan 02, 2015 at 05:39:17PM +0100, Laurent Georget wrote:
> Ah, ok, I finally understood what you meant by "fractional part".
> Perhaps we could explicit it in the man page like in the following patch?

Much improved. Looks good to me.

Thanks,
Richard
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
