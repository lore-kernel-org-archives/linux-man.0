From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: getifaddrs: Prevent possible NULL pointer access
Date: Wed, 6 Oct 2010 07:35:02 +0200
Message-ID: <AANLkTimpbiNc9ZdO_+3d_PoJXBY+btH-HbeQVYUHpa4t@mail.gmail.com>
References: <201010051457.23610.thomas.jarosch@intra2net.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201010051457.23610.thomas.jarosch-XXsH3GEs1jrby3iVrkZq2A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Jarosch <thomas.jarosch-XXsH3GEs1jrby3iVrkZq2A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Oct 5, 2010 at 2:57 PM, Thomas Jarosch
<thomas.jarosch-XXsH3GEs1jrby3iVrkZq2A@public.gmane.org> wrote:
> Hello,
>
> the example code for getifaddrs() contains a possible NULL pointer access.
> Attached is a patch against man-pages 3.22 from Fedora 12.

Thanks Thomas. Applied for man-pages 3.29.

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
