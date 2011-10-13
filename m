From: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: add io_getevents() BUGS
Date: Thu, 13 Oct 2011 10:31:07 +0200
Message-ID: <20111013083107.GB17800@saboteur.suse.cz>
References: <20110323191425.GA15819@saboteur.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110323191425.GA15819-n1fJoQsqRnsVI8jrpt9EEQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi!
> For reference see: http://marc.info/?l=linux-aio&m=130089887002435&w=2
> 
> The attached patch adds BUGS paragraph into corresponding manpage.

This one is not applied as well.

> From f8b30bf9d4a7ac1f821462906f43ca84624915cf Mon Sep 17 00:00:00 2001
> From: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
> Date: Wed, 23 Mar 2011 20:06:22 +0100
> Subject: [PATCH] Added note about segfault into io_getevents manual.
> 
> Signed-off-by: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
> ---
>  man2/io_getevents.2 |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/man2/io_getevents.2 b/man2/io_getevents.2
> index a337404..e08fd01 100644
> --- a/man2/io_getevents.2
> +++ b/man2/io_getevents.2
> @@ -98,6 +98,9 @@ then the return value follows the usual conventions for
>  indicating an error: \-1, with
>  .I errno
>  set to a (positive) value that indicates the error.
> +.SH "BUGS"
> +This call may cause segmentation fault instead of returning
> +\fBEINVAL\fP for invalid \fIctx_id\fP.
>  .SH "SEE ALSO"
>  .PP
>  .BR io_cancel (2),
> -- 
> 1.6.4.2
> 


-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
