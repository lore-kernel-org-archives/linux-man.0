From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] ioctl_list.2: transfer structure
Date: Wed, 30 Dec 2015 20:34:57 +0100
Message-ID: <568431E1.3020700@gmail.com>
References: <1451484328-4247-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1451484328-4247-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/30/2015 03:05 PM, Heinrich Schuchardt wrote:
> The sole parameter to be passed to the wireless.h IOCTLs is
> of type struct iwreq *.

Thanks, Heinrich. Applied.

Cheers,

Michael


> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/ioctl_list.2 | 112 +++++++++++++++++++++++++++++-------------------------
>  1 file changed, 60 insertions(+), 52 deletions(-)
> 
> diff --git a/man2/ioctl_list.2 b/man2/ioctl_list.2
> index cc3488d..2cfbb12 100644
> --- a/man2/ioctl_list.2
> +++ b/man2/ioctl_list.2
> @@ -506,59 +506,67 @@ l l l l.
>  .TE
>  
>  // <include/uapi/linux/wireless.h>
> +.br
> +// This API is deprecated.
> +.br
> +// It is being replaced by nl80211 and cfg80211.
> +See
> +.br
> +//
> +.I https://wireless.wiki.kernel.org/en/developers/documentation/nl80211
>  .TS
> -l l l l.
> -x00008b00	SIOCSIWCOMMIT	struct net_device *	// MORE
> -x00008b01	SIOCGIWNAME	struct net_device *	// MORE
> -x00008b02	SIOCSIWNWID	struct net_device *	// MORE
> -x00008b03	SIOCGIWNWID	struct net_device *	// MORE
> -x00008b04	SIOCSIWFREQ	struct net_device *	// MORE
> -x00008b05	SIOCGIWFREQ	struct net_device *	// MORE
> -x00008b06	SIOCSIWMODE	struct net_device *	// MORE
> -x00008b07	SIOCGIWMODE	struct net_device *	// MORE
> -x00008b08	SIOCSIWSENS	struct net_device *	// MORE
> -x00008b09	SIOCGIWSENS	struct net_device *	// MORE
> -x00008b0a	SIOCSIWRANGE	struct net_device *	// MORE
> -x00008b0b	SIOCGIWRANGE	struct net_device *	// MORE
> -x00008b0c	SIOCSIWPRIV	struct net_device *	// MORE
> -x00008b0d	SIOCGIWPRIV	struct net_device *	// MORE
> -x00008b0e	SIOCSIWSTATS	struct net_device *	// MORE
> -x00008b0f	SIOCGIWSTATS	struct net_device *	// MORE
> -x00008b10	SIOCSIWSPY	struct net_device *	// MORE
> -x00008b11	SIOCGIWSPY	struct net_device *	// MORE
> -x00008b12	SIOCSIWTHRSPY	struct net_device *	// MORE
> -x00008b13	SIOCGIWTHRSPY	struct net_device *	// MORE
> -x00008b14	SIOCSIWAP	struct net_device *	// MORE
> -x00008b15	SIOCGIWAP	struct net_device *	// MORE
> -x00008b17	SIOCGIWAPLIST	struct net_device *	// MORE
> -x00008b18	SIOCSIWSCAN	struct net_device *	// MORE
> -x00008b19	SIOCGIWSCAN	struct net_device *	// MORE
> -x00008b1a	SIOCSIWESSID	struct net_device *	// MORE
> -x00008b1b	SIOCGIWESSID	struct net_device *	// MORE
> -x00008b1c	SIOCSIWNICKN	struct net_device *	// MORE
> -x00008b1d	SIOCGIWNICKN	struct net_device *	// MORE
> -x00008b20	SIOCSIWRATE	struct net_device *	// MORE
> -x00008b21	SIOCGIWRATE	struct net_device *	// MORE
> -x00008b22	SIOCSIWRTS	struct net_device *	// MORE
> -x00008b23	SIOCGIWRTS	struct net_device *	// MORE
> -x00008b24	SIOCSIWFRAG	struct net_device *	// MORE
> -x00008b25	SIOCGIWFRAG	struct net_device *	// MORE
> -x00008b26	SIOCSIWTXPOW	struct net_device *	// MORE
> -x00008b27	SIOCGIWTXPOW	struct net_device *	// MORE
> -x00008b28	SIOCSIWRETRY	struct net_device *	// MORE
> -x00008b29	SIOCGIWRETRY	struct net_device *	// MORE
> -x00008b2a	SIOCSIWENCODE	struct net_device *	// MORE
> -x00008b2b	SIOCGIWENCODE	struct net_device *	// MORE
> -x00008b2c	SIOCSIWPOWER	struct net_device *	// MORE
> -x00008b2d	SIOCGIWPOWER	struct net_device *	// MORE
> -x00008b30	SIOCSIWGENIE	struct net_device *	// MORE
> -x00008b31	SIOCGIWGENIE	struct net_device *	// MORE
> -x00008b16	SIOCSIWMLME	struct net_device *	// MORE
> -x00008b32	SIOCSIWAUTH	struct net_device *	// MORE
> -x00008b33	SIOCGIWAUTH	struct net_device *	// MORE
> -x00008b34	SIOCSIWENCODEEXT	struct net_device *	// MORE
> -x00008b35	SIOCGIWENCODEEXT	struct net_device *	// MORE
> -x00008b36	SIOCSIWPMKSA	struct net_device *	// MORE
> +l l l.
> +x00008b00	SIOCSIWCOMMIT	struct iwreq *
> +x00008b01	SIOCGIWNAME	struct iwreq *
> +x00008b02	SIOCSIWNWID	struct iwreq *
> +x00008b03	SIOCGIWNWID	struct iwreq *
> +x00008b04	SIOCSIWFREQ	struct iwreq *
> +x00008b05	SIOCGIWFREQ	struct iwreq *
> +x00008b06	SIOCSIWMODE	struct iwreq *
> +x00008b07	SIOCGIWMODE	struct iwreq *
> +x00008b08	SIOCSIWSENS	struct iwreq *
> +x00008b09	SIOCGIWSENS	struct iwreq *
> +x00008b0a	SIOCSIWRANGE	struct iwreq *
> +x00008b0b	SIOCGIWRANGE	struct iwreq *
> +x00008b0c	SIOCSIWPRIV	struct iwreq *
> +x00008b0d	SIOCGIWPRIV	struct iwreq *
> +x00008b0e	SIOCSIWSTATS	struct iwreq *
> +x00008b0f	SIOCGIWSTATS	struct iwreq *
> +x00008b10	SIOCSIWSPY	struct iwreq *
> +x00008b11	SIOCGIWSPY	struct iwreq *
> +x00008b12	SIOCSIWTHRSPY	struct iwreq *
> +x00008b13	SIOCGIWTHRSPY	struct iwreq *
> +x00008b14	SIOCSIWAP	struct iwreq *
> +x00008b15	SIOCGIWAP	struct iwreq *
> +x00008b17	SIOCGIWAPLIST	struct iwreq *
> +x00008b18	SIOCSIWSCAN	struct iwreq *
> +x00008b19	SIOCGIWSCAN	struct iwreq *
> +x00008b1a	SIOCSIWESSID	struct iwreq *
> +x00008b1b	SIOCGIWESSID	struct iwreq *
> +x00008b1c	SIOCSIWNICKN	struct iwreq *
> +x00008b1d	SIOCGIWNICKN	struct iwreq *
> +x00008b20	SIOCSIWRATE	struct iwreq *
> +x00008b21	SIOCGIWRATE	struct iwreq *
> +x00008b22	SIOCSIWRTS	struct iwreq *
> +x00008b23	SIOCGIWRTS	struct iwreq *
> +x00008b24	SIOCSIWFRAG	struct iwreq *
> +x00008b25	SIOCGIWFRAG	struct iwreq *
> +x00008b26	SIOCSIWTXPOW	struct iwreq *
> +x00008b27	SIOCGIWTXPOW	struct iwreq *
> +x00008b28	SIOCSIWRETRY	struct iwreq *
> +x00008b29	SIOCGIWRETRY	struct iwreq *
> +x00008b2a	SIOCSIWENCODE	struct iwreq *
> +x00008b2b	SIOCGIWENCODE	struct iwreq *
> +x00008b2c	SIOCSIWPOWER	struct iwreq *
> +x00008b2d	SIOCGIWPOWER	struct iwreq *
> +x00008b30	SIOCSIWGENIE	struct iwreq *
> +x00008b31	SIOCGIWGENIE	struct iwreq *
> +x00008b16	SIOCSIWMLME	struct iwreq *
> +x00008b32	SIOCSIWAUTH	struct iwreq *
> +x00008b33	SIOCGIWAUTH	struct iwreq *
> +x00008b34	SIOCSIWENCODEEXT	struct iwreq *
> +x00008b35	SIOCGIWENCODEEXT	struct iwreq *
> +x00008b36	SIOCSIWPMKSA	struct iwreq *
>  .TE
>  
>  // <include/linux/sbpcd.h>
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
