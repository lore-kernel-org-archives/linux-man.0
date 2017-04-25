From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Use lower case for hostname example
Date: Tue, 25 Apr 2017 15:36:25 +0200
Message-ID: <1d02cae1-f4d0-6e9a-fd72-330b9430e67d@gmail.com>
References: <142de45e-6ca5-bfea-60ab-9d634740a709@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <142de45e-6ca5-bfea-60ab-9d634740a709-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 04/18/2017 12:54 PM, Marko Myllynen wrote:
> I think upper-casing hostnames was a thing of the 90s, is this ok?

Thanks, Marko. Applied.

Cheers,

Michael


> ---
>  man7/hostname.7 | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/man7/hostname.7 b/man7/hostname.7
> index 23c35e9..bc181a9 100644
> --- a/man7/hostname.7
> +++ b/man7/hostname.7
> @@ -41,8 +41,8 @@
>  hostname \- hostname resolution description
>  .SH DESCRIPTION
>  Hostnames are domains, where a domain is a hierarchical, dot-separated
> -list of subdomains; for example, the machine monet, in the Berkeley
> -subdomain of the EDU domain would be represented as "monet.Berkeley.EDU".
> +list of subdomains; for example, the machine "monet", in the "berkeley"
> +subdomain of the "edu" domain would be represented as "monet.berkeley.edu".
>  
>  Hostnames are often used with network client and server programs,
>  which must generally translate the name to an address for use.
> @@ -75,9 +75,9 @@ by searching through a list of domains until a match is found.
>  The default search list includes first the local domain,
>  then its parent domains with at least 2 name components (longest first).
>  For example,
> -in the domain CS.Berkeley.EDU, the name lithium.CChem will be checked first
> -as lithium.CChem.CS.Berkeley.EDU and then as lithium.CChem.Berkeley.EDU.
> -Lithium.CChem.EDU will not be tried, as there is only one component
> +in the domain cs.berkeley.edu, the name lithium.cchem will be checked first
> +as lithium.cchem.cs.berkeley.edu and then as lithium.cchem.berkeley.edu.
> +lithium.cchem.edu will not be tried, as there is only one component
>  remaining from the local domain.
>  The search path can be changed from the default
>  by a system-wide configuration file (see
> 
> Thanks,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
