From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [patch] initrd.4: "normal root file" should read "...file system"
	in one location
Date: Sat, 4 Apr 2009 06:45:18 +1300
Message-ID: <cfd18e0f0904031045x3c1803d6x3b2f3a998d3756e6@mail.gmail.com>
References: <49D5C9D3.9020900@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <49D5C9D3.9020900-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: FeRD <ferdnyc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Frank,

On Fri, Apr 3, 2009 at 9:33 PM, FeRD <ferdnyc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This is admittedly minor, and pretty obvious contextually, but for
> correctness' sake....
>
> Item 7 of the "Boot-Up Operation" listing discusses, "If the normal root
> file has directory /initrd..." -- this should clearly read "file system".
> Patch against the latest git sources follows.

Thanks!  Applied for 3.21.

Cheers,

Michael


> diff --git a/man4/initrd.4 b/man4/initrd.4
> index 47bd46e..b9980e0 100644
> --- a/man4/initrd.4
> +++ b/man4/initrd.4
> @@ -142,7 +142,7 @@ file-system, then the behavior of the kernel is
> .BR UNSPECIFIED .
> See the NOTES section for the current kernel behavior.)
> .IP 7.
> -If the normal root file has directory
> +If the normal root file system has directory
> .IR /initrd ,
> device
> .I /dev/ram0
>
>
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
