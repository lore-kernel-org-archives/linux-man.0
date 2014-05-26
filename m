From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] README: explain usage of prefix when installing
Date: Mon, 26 May 2014 08:07:35 +0200
Message-ID: <5382DA27.1070508@gmail.com>
References: <1401068212-17756-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401068212-17756-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/26/2014 03:36 AM, Heinrich Schuchardt wrote:
> Installing the manpages to /usr may not be the preferred option
> when working on a system with a packaging system like apt or yum,
> where /usr is reserved for packages and /usr/local or /opt is used
> for user addons.
> 
> README should explain how to install to a path different to /usr.

Thanks, Heinrich. APplied.

Cheers,

Michael


> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  README | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/README b/README
> index 447a925..0ec038f 100644
> --- a/README
> +++ b/README
> @@ -4,6 +4,8 @@ This package contains Linux man pages for sections
>  
>  Install by copying to your favourite location.
>  "make install" will just copy them to /usr/share/man/man[1-8].
> +To install to a path different from /usr use
> +"make install prefix=/install/path".
>  "make" will move the pages from this package that are older than
>  the already installed ones to a subdirectory `not_installed',
>  then remove old versions (compressed or not),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
