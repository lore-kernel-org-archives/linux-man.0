From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Maximum number of file descriptors that may be passed via SCM_RIGHTS
Date: Wed, 14 Sep 2011 08:07:31 +0200
Message-ID: <CAKgNAkjs2MfpNdT3CmBW4stdaTWoP=RoFRd8Cm6jkUPVCn8YCg@mail.gmail.com>
References: <cone.1306367829.726700.9970.500@monster.email-scan.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cone.1306367829.726700.9970.500-eRFusrvvrKWtZOM0fQ182pBYcbvojoGw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Sam,

On Thu, May 26, 2011 at 1:57 AM, Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org> wrote:
> Anyone knows if the maximum number of file descriptors that can be passed
> via SCM_RIGHTS is documented anywhere?
>
> Up to at least 2.6.35, I could stuff as many as 255 file descriptors. Which
> sort of made sense.
>
> I updated to Fedora 15, which is based on 2.6.38, and the maximum number of
> file descriptors I can stuff into a message seems to be 253. With 254,
> strace tells me that the kernel refuses with EINVAL.

No info on this sorry. Let me know if you determine(d) the details.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
