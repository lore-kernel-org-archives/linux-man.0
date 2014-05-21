From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 17/24] resolver.3: Fix prototypes and extern-declaration
Date: Wed, 21 May 2014 20:31:22 +0200
Message-ID: <537CF0FA.1060704@gmail.com>
References: <1400684275-20972-1-git-send-email-rv@rasmusvillemoes.dk> <1400684275-20972-18-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400684275-20972-18-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thank you, Rasmus. Applied.

Cheers,

Michael


On 05/21/2014 04:57 PM, Rasmus Villemoes wrote:
> Fix const- and signedness of various char* parameters.
> 
> Also, there is no "struct state", but _res is a struct
> __res_state. (Actually, _res is errno-like in that it is really a
> macro expanding to (*__res_state()).)
> 
> Signed-off-by: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
> ---
>  man3/resolver.3 | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/man3/resolver.3 b/man3/resolver.3
> index a3fd2e8..4c0b03e 100644
> --- a/man3/resolver.3
> +++ b/man3/resolver.3
> @@ -38,7 +38,7 @@ dn_comp, dn_expand \- resolver routines
>  .B #include <netinet/in.h>
>  .B #include <arpa/nameser.h>
>  .B #include <resolv.h>
> -.B extern struct state _res;
> +.B extern struct __res_state _res;
>  .sp
>  .B int res_init(void);
>  .sp
> @@ -60,23 +60,23 @@ dn_comp, dn_expand \- resolver routines
>  .sp
>  .BI "int res_mkquery(int " op ", const char *" dname ", int " class ,
>  .RS
> -.BI "int " type ", char *" data ", int " datalen ", struct rrec *" newrr ,
> -.BI "char *" buf ", int " buflen );
> +.BI "int " type ", const unsigned char *" data ", int " datalen ,
> +.BI "const unsigned char *" newrr ", unsigned char *" buf ", int " buflen );
>  .RE
>  .sp
> -.BI "int res_send(const char *" msg ", int " msglen ", char *" answer ,
> +.BI "int res_send(const unsigned char *" msg ", int " msglen ,
>  .RS
> -.BI "int " anslen );
> +.BI "unsigned char *" answer ", int " anslen );
>  .RE
>  .sp
> -.BI "int dn_comp(unsigned char *" exp_dn ", unsigned char *" comp_dn ,
> +.BI "int dn_comp(const char *" exp_dn ", unsigned char *" comp_dn ,
>  .RS
>  .BI "int " length ", unsigned char **" dnptrs ", unsigned char **" lastdnptr );
>  .RE
>  .sp
> -.BI "int dn_expand(unsigned char *" msg ", unsigned char *" eomorig ,
> +.BI "int dn_expand(const unsigned char *" msg ", const unsigned char *" eomorig ,
>  .RS
> -.BI "unsigned char *" comp_dn ", char *" exp_dn ,
> +.BI "const unsigned char *" comp_dn ", char *" exp_dn ,
>  .BI "int " length );
>  .RE
>  .fi
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
