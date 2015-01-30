From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] socket.2: document AF_ALG
Date: Fri, 30 Jan 2015 07:05:00 +0100
Message-ID: <54CB1F0C.6070906@gmail.com>
References: <2022953.c9E5IKVA29@tauon>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2022953.c9E5IKVA29@tauon>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, 'Herbert Xu' <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 01/29/2015 05:29 PM, Stephan Mueller wrote:
> Add a reference to the AF_ALG protocol accessible via socket(2).
> 
> Signed-off-by: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
> CC: Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>
> ---
>  man2/socket.2 | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/man2/socket.2 b/man2/socket.2
> index 229dab3..8885079 100644
> --- a/man2/socket.2
> +++ b/man2/socket.2
> @@ -116,6 +116,11 @@ Low level packet interface
>  T}:T{
>  .BR packet (7)
>  T}
> +T{
> +.B AF_ALG
> +T}:T{
> +Interface to kernel crypto API
> +T}
>  .TE
>  .PP
>  The socket has the indicated
> @@ -378,6 +383,12 @@ families.
>  However, already the BSD man page promises: "The protocol
>  family generally is the same as the address family", and subsequent
>  standards use AF_* everywhere.
> +
> +The AF_ALG protocol type is added with kernel version 2.6.38. More
> +information on this interface is provided with
> +Documentation/crypto/crypto-API-userspace.txt provided in the
> +Linux kernel source code tree.
> +

Thanks, Stephan. Applied.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
