From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: epoll(7) redux
Date: Wed, 9 Apr 2008 13:15:15 +0200
Message-ID: <cfd18e0f0804090415m1ddb36bahce8e6b724e60da7d@mail.gmail.com>
References: <cone.1207739243.602382.23947.500@commodore.email-scan.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cone.1207739243.602382.23947.500-lO+bjgoT4TKm14v+eVDVcBDJ/jce7dRH@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>, Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Apr 9, 2008 at 1:07 PM, Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org> wrote:
> Q2
>
>   Can two epoll sets wait for the same file descriptor? If so, are events
> reported to both epoll file descriptors?
>
> A2
>
>   Yes, and events would be reported to both. However, it is not recommended.
>
> =========
>
> It's not clear what "not recommended" means. Furthermore, I don't think
> there's anything wrong with two epoll file descriptors waiting for different
> events on the same file descriptor. One's waiting for POLLIN, the other for
> POLLOUT. What's wrong with that?

Perhaps Davide has some thought to offer here?



-- 
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug? Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
