From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] lockf.3: update pointer to documentation in the kernel
	source in SEE ALSO
Date: Mon, 30 Mar 2009 07:30:59 +1300
Message-ID: <cfd18e0f0903291130m4f54a799jc8ae93fc9bbf3311@mail.gmail.com>
References: <200903261117.08423.knikanth@suse.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200903261117.08423.knikanth-l3A5Bk7waGM@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikanth Karthikesan <knikanth-l3A5Bk7waGM@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Nikanth,

On Thu, Mar 26, 2009 at 6:47 PM, Nikanth Karthikesan <knikanth-l3A5Bk7waGM@public.gmane.org>=
 wrote:
> The lockf.3 points to locks.txt and mandatory.txt in Documentation wh=
ich has
> been moved to Documentation/filesystems/locks.txt and
> Documentation/filesystems/mandatory-locking.txt
>
> Signed-off-by: Nikanth Karthikesan <knikanth-l3A5Bk7waGM@public.gmane.org>

Thanks.  Fixed for 3.20.  I also included some text noting that
mandatory.txt was the name in kernels <=3D 2.6.23.

Cheers,

Michael


> diff --git a/man3/lockf.3 b/man3/lockf.3
> index 53b5837..44fe024 100644
> --- a/man3/lockf.3
> +++ b/man3/lockf.3
> @@ -134,6 +134,6 @@ SVr4, POSIX.1-2001.
> =A0There are also
> =A0.I locks.txt
> =A0and
> -.I mandatory.txt
> +.I mandatory-locking.txt
> =A0in
> -.IR /usr/src/linux/Documentation .
> +.IR /usr/src/linux/Documentation/filesystems .
>
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
