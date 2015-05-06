From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] man5/gai.conf.5: A label is followed by precedence. Other
 wording changes
Date: Wed, 06 May 2015 18:37:11 +0200
Message-ID: <554A4337.90006@gmail.com>
References: <20130812165402.GA30412@nt1.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130812165402.GA30412-9epcXJ+zteU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Regid Ichira <regid23-9epcXJ+zteU@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/12/2013 06:54 PM, Regid Ichira wrote:
>   There are 3 small hunks.  The first and third one seem to me
> obvoius.  The second one is by following the title of the label
> paragraph header,
>     label netmask precedence

Thanks, Regid. (Long after the fact) applied!

Cheers,

Michael


>   Applied to 3.53, on top of commit
> 09d3c20c0dd97586f4978253a24327767a2a13e6
> ---
>  man5/gai.conf.5 |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/man5/gai.conf.5 b/man5/gai.conf.5
> index be1fc25..cd9f69c 100644
> --- a/man5/gai.conf.5
> +++ b/man5/gai.conf.5
> @@ -42,15 +42,15 @@ The keywords currently recognized are:
>  .TP
>  \fBlabel\fR \fInetmask\fR \fIprecedence\fR
>  The value is added to the label table used in the RFC\ 3484 sorting.
> -If any \fBlabel\fR definition is present in the configuration file
> -is present, the default table is not used.
> +If any \fBlabel\fR definition is present in the configuration file,
> +the default table is not used.
>  All the label definitions
>  of the default table which are to be maintained have to be duplicated.
>  Following the keyword,
> -the line has to contain a network mask and a label value.
> +the line has to contain a network mask and a precedence value.
>  .TP
>  \fBprecedence\fR \fInetmask\fR \fIprecedence\fR
> -This  keyword is similar to \fBlabel\fR, but instead the value is added
> +This keyword is similar to \fBlabel\fR, but instead the value is added
>  to the precedence table as specified in RFC\ 3484.
>  Once again, the
>  presence of a single \fBprecedence\fR line in the configuration file
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
