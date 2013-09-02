From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: linkat.2: tfix
Date: Mon, 02 Sep 2013 07:50:54 +0200
Message-ID: <5224273E.7070808@gmail.com>
References: <CAMqf4EGseGsv4agiYjY1Ski96i60FHyAhpaUXeuUsiQErQNc=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMqf4EGseGsv4agiYjY1Ski96i60FHyAhpaUXeuUsiQErQNc=A@mail.gmail.com>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Applied. Thanks.

Cheers,

Michael


On 08/13/13 22:34, D. Barbier wrote:
> diff --git a/man2/linkat.2 b/man2/linkat.2
> index 701d341..fd2a91b 100644
> --- a/man2/linkat.2
> +++ b/man2/linkat.2
> @@ -95,7 +95,7 @@ except that a relative pathname is interpreted relative
>  to the directory referred to by the file descriptor
>  .IR newdirfd .
>  
> -The following values can be biwise ORed in
> +The following values can be bitwise ORed in
>  .IR flags :
>  .TP
>  .BR AT_EMPTY_PATH " (since Linux 2.6.39)"
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
