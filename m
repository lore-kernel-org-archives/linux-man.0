From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 20/24] setnetgrent.3: Fix prototype
Date: Wed, 21 May 2014 20:15:26 +0200
Message-ID: <537CED3E.6020100@gmail.com>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk> <1400684275-20972-21-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-21-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thank you, Rasmus. Applied.

Cheers,

Michael


On 05/21/2014 04:57 PM, Rasmus Villemoes wrote:
> The buflen argument to getnetgrent_r has type size_t.
> 
> Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
> ---
>  man3/setnetgrent.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/setnetgrent.3 b/man3/setnetgrent.3
> index 2a85a95..25293e6 100644
> --- a/man3/setnetgrent.3
> +++ b/man3/setnetgrent.3
> @@ -22,7 +22,7 @@ handle network group entries
>  .BI "int getnetgrent(char **" host ", char **" user ", char **" domain );
>  
>  .BI "int getnetgrent_r(char **" host ", char **" user ","
> -.BI "                  char **" domain ", char *" buf ", int " buflen );
> +.BI "                  char **" domain ", char *" buf ", size_t " buflen );
>  
>  .BI "int innetgr(const char *" netgroup ", const char *" host ","
>  .BI "            const char *" user ", const char *" domain );
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
