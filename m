From: Jeff Epler <jepler-ixP+gI44yfQ4d9/VWYMlNA@public.gmane.org>
Subject: Re: [PATCH] adjtimex: PPM scaling is by 2^-16
Date: Fri, 2 Jan 2015 15:15:21 -0600
Message-ID: <20150102211519.GA55815@unpythonic.net>
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
Cc: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Jan 02, 2015 at 05:39:17PM +0100, Laurent Georget wrote:
> +    long freq;        /* Frequency offset, in units of 2^-16 PPM
> +                         (parts per million) (see NOTES below) */
...
> +.SH NOTES
> +In struct
> +.IR timex ,
> +.IR freq ,
> +.IR ppsfreq ,
> +and
> +.I stabil
> +are PPM (parts per million) with a 16-bits fractional part, which means that a
> +value of 1 in one of those fields actually means 2^-16 PPM, and 2^16=65535 is
> +1 PPM. This is the case for both input values (in the case of
> +.IR freq )
> +and output values.

I appreciate the addition of the NOTES section, this is likely to be
unclear to first-time readers and that section should clear it up
nicely.  Giving the definition of PPM as "parts per million" is good
too.

However, the patch got line-wrapped again (I fixed it manually above).
With line-wrapped fix, consider it

Reviewed-by: Jeff Epler <jepler-ixP+gI44yfQ4d9/VWYMlNA@public.gmane.org>

hm, as a separate issue, "ppm" seems to typically be written in
lowercase.  see e.g., http://en.wikipedia.org/wiki/Parts-per_notation

Jeff
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
