From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: gettid(2)
Date: Sat, 22 Mar 2008 07:02:55 +0100
Message-ID: <cfd18e0f0803212302s210ac598ua6959abc93628f11@mail.gmail.com>
References: <cone.1206110097.469414.10945.500@commodore.email-scan.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cone.1206110097.469414.10945.500-lO+bjgoT4TKm14v+eVDVcBDJ/jce7dRH@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Mar 21, 2008 at 3:34 PM, Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org> wrote:
> gettid() is not defined in my copy of sys/types.h, and it does not appear to
> be a glibc wrapper for it.
>
> The only way to access this syscall, it seems:
>
> #include <sys/types.h>
> #include <sys/syscalls.h>
>
> syscall(SYS_gettid);


Sam,

Raed the NOTES section:

    Glibc does not provide a wrapper for this system call; call it
    using syscall(2).

Cheers,

Michael


-- 
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
