From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] recvmmsg.2/sendmmsg.2: fix signatures
Date: Thu, 2 Nov 2017 07:50:58 +0100
Message-ID: <580d59ec-5e5c-a9b4-e1e2-c993e048f110@gmail.com>
References: <CAJgzZorunHq-6ztgLS4Ya3wWKbXxzE87wCykgBN3ofCcmVKi0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJgzZorunHq-6ztgLS4Ya3wWKbXxzE87wCykgBN3ofCcmVKi0g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: enh <enh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/02/2017 01:09 AM, enh wrote:
> ---
>   man2/recvmmsg.2 | 2 +-
>   man2/sendmmsg.2 | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Thanks, Elliot. Applied.

Cheers,

Michael


> diff --git a/man2/recvmmsg.2 b/man2/recvmmsg.2
> index 3ff1b63a3..e7dfe848a 100644
> --- a/man2/recvmmsg.2
> +++ b/man2/recvmmsg.2
> @@ -38,7 +38,7 @@ recvmmsg \- receive multiple messages on a socket
>   .PP
>   .BI "int recvmmsg(int " sockfd ", struct mmsghdr *" msgvec \
>   ", unsigned int " vlen ","
> -.BI "             unsigned int " flags ", struct timespec *" timeout ");"
> +.BI "             int " flags ", struct timespec *" timeout ");"
>   .fi
>   .SH DESCRIPTION
>   The
> diff --git a/man2/sendmmsg.2 b/man2/sendmmsg.2
> index e61ed0b4e..a4895c1ac 100644
> --- a/man2/sendmmsg.2
> +++ b/man2/sendmmsg.2
> @@ -35,7 +35,7 @@ sendmmsg \- send multiple messages on a socket
>   .PP
>   .BI "int sendmmsg(int " sockfd ", struct mmsghdr *" msgvec \
>   ", unsigned int " vlen ","
> -.BI "             unsigned int " flags ");"
> +.BI "             int " flags ");"
>   .fi
>   .SH DESCRIPTION
>   The
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
