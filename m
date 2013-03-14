From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] getent.1: netgroup description incorrectly refers to initgroups
Date: Thu, 14 Mar 2013 10:45:25 +0100
Message-ID: <CAKgNAkhoRSH-J7w29RAp4wrQBokXnxpXJ2U2QAs-Kmyh8iSh0g@mail.gmail.com>
References: <779520949.761574.1363083991689.JavaMail.open-xchange@mail.proseconsulting.co.uk>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <779520949.761574.1363083991689.JavaMail.open-xchange-RQPCmHpfmte0awjZ7YbxSY5Lr7LD32fptUK59QYPAWc@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark R Bannister <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Mark,

On Tue, Mar 12, 2013 at 11:26 AM, Mark R Bannister
<mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org> wrote:
> Hi Michael,
>
> Here is a patch for man-pages-3.48 to correct an error in the description for
> the netgroup database in getent(1).

Thanks. Applied.

Cheers,

Michael


> --- getent.1    2013-03-05 17:22:14.000000000 +0000
> +++ getent.1.new        2013-03-12 10:14:07.524858000 +0000
> @@ -20,7 +20,7 @@
>  .\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111,
>  .\" USA.
>  .\"
> -.TH GETENT 1 2011-10-31 "Linux" "User Commands"
> +.TH GETENT 1 2013-03-12 "Linux" "User Commands"
>  .SH NAME
>  getent \- get entries from Name Service Switch libraries
>  .SH SYNOPSIS
> @@ -214,7 +214,7 @@
>  to match to a netgroup name via
>  .BR innetgr (3).
>  Enumeration is not supported on
> -.BR initgroups ,
> +.BR netgroup ,
>  so either one or three
>  .I keys
>  must be provided.



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
