From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Fix possible race condition in readlink.2 example
Date: Thu, 18 Jul 2013 02:04:32 +0200
Message-ID: <51E73110.5090709@gmail.com>
References: <20130715161929.GA22636@server.mountain-tech.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130715161929.GA22636-sklCMb5Bxfd6qHUw6WWyqb5k8TFzwjDl@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chuck Coffing <clc-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/15/13 18:19, Chuck Coffing wrote:
> Hi Michael,
> 
> I noticed that the example in the readlink.2 man pages does error
> checking for a race condition that would cause the value of the symbolic
> link to get larger.  However, it doesn't handle the opposite case, in
> which the value gets shorter.  (The NULL terminator is always set at the
> old, longer offset.)  This could cause a program to operate on
> uninitialized data.
> 
> Here's a patch against 3.52:

Thanks, Chuck. Applied.

Cheers,

Michael



>>From 3db3021cc137937c79f95d2aa1c2820b20732c22 Mon Sep 17 00:00:00 2001
> From: Chuck Coffing <clc-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> Date: Mon, 15 Jul 2013 10:11:15 -0600
> Subject: [PATCH] Fix possible race condition in readlink.2 example
> 
> ---
>  man2/readlink.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/readlink.2 b/man2/readlink.2
> index f4ee2cb..9633149 100644
> --- a/man2/readlink.2
> +++ b/man2/readlink.2
> @@ -204,7 +204,7 @@ main(int argc, char *argv[])
>          exit(EXIT_FAILURE);
>      }
>  
> -    linkname[sb.st_size] = \(aq\\0\(aq;
> +    linkname[r] = \(aq\\0\(aq;
>  
>      printf("\(aq%s\(aq points to \(aq%s\(aq\\n", argv[1], linkname);
>  
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
