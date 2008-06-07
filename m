From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Patch: signalfd(2) typo
Date: Sat, 7 Jun 2008 20:31:11 +0200
Message-ID: <cfd18e0f0806071131h7be9b0b5o6a61a8f8425c98fc@mail.gmail.com>
References: <cone.1212859907.312748.21450.500@commodore.email-scan.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cone.1212859907.312748.21450.500-lO+bjgoT4TKm14v+eVDVcBDJ/jce7dRH@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Jun 7, 2008 at 7:31 PM, Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org> wrote:
>
>
> --- man-pages-2.80/man2/signalfd.2~     2008-06-03 05:50:15.000000000 -0400
> +++ man-pages-2.80/man2/signalfd.2      2008-06-07 13:27:31.000000000 -0400
> @@ -168,7 +168,7 @@
> .\" ssi_trapno is unused on most (all?) arches?
>    int32_t  ssi_status;  /* Exit status or signal (SIGCHLD) */
>    int32_t  ssi_int;     /* Integer sent by sigqueue(2) */
> -    uint64_t ssi_ptr      /* Pointer sent by sigqueue(2) */;
> +    uint64_t ssi_ptr;     /* Pointer sent by sigqueue(2) */
>    uint64_t ssi_utime;   /* User CPU time consumed (SIGCHLD) */
>    uint64_t ssi_stime;   /* System CPU time consumed (SIGCHLD) */
>    uint64_t ssi_addr;    /* Address that generated signal

Hi Sam,

Thanks for the message -- I'll apply the change shortly.  A couple of things:

* For really simple stuff like this, *if it's easier for you*, then
you don't need to go to the work of writing a patch -- a few words
describing the problem ("misplaced semicolon on ssi_ptr field in
structure definition"), will suffice.

* IMO (but I'm ready to hear counter-arguments), to save list noise,
it's probably better not to CC the list on trivial patches which I'm
likely to automatically apply anyway.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
