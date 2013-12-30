From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc(5): fix indentation for net examples
Date: Tue, 31 Dec 2013 00:27:19 +1300
Message-ID: <52C15897.5060309@gmail.com>
References: <1388237204-12791-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1388237204-12791-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/29/13 02:26, Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>

Hi Mike,

I'm not sure what the goal of this change is. What's broken?
(Note that there is some value, in terms of easy parsing of
man output, to having only the section headings start in 
column 1.)

Cheers,

Michael


> ---
>  man5/proc.5 | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index 942b833..60829b2 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -2023,14 +2023,12 @@ The format is:
>  
>  .nf
>  .ft CW
> -.in 1n
>  Inter-|   Receive                                                |  Transmit
>   face |bytes    packets errs drop fifo frame compressed multicast|bytes    packets errs drop fifo colls carrier compressed
>      lo: 2776770   11307    0    0    0     0          0         0  2776770   11307    0    0    0     0       0          0
>    eth0: 1215645    2751    0    0    0     0          0         0  1782404    4324    0    0    0   427       0          0
>    ppp0: 1622270    5552    1    0    0     0          0         0   354130    5669    0    0    0     0       0          0
>    tap0:    7714      81    0    0    0     0          0         0     7714      81    0    0    0     0       0          0
> -.in
>  .ft
>  .fi
>  .\" .TP
> @@ -2126,12 +2124,10 @@ The format is:
>  
>  .nf
>  .ft CW
> -.in 1n
>  sl  local_address rem_address   st tx_queue rx_queue tr rexmits  tm\->when uid
>   1: 01642C89:0201 0C642C89:03FF 01 00000000:00000001 01:000071BA 00000000 0
>   1: 00000000:0801 00000000:0000 0A 00000000:00000000 00:00000000 6F000100 0
>   1: 00000000:0201 00000000:0000 0A 00000000:00000000 00:00000000 00000000 0
> -.in
>  .ft
>  .fi
>  .TP
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
