From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] udp.7: Add missing #include directive.
Date: Sat, 27 Jul 2013 12:18:13 +0200
Message-ID: <51F39E65.6080807@gmail.com>
References: <1374850725-11310-1-git-send-email-bpoirier@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374850725-11310-1-git-send-email-bpoirier-l3A5Bk7waGM@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Poirier <bpoirier-l3A5Bk7waGM@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/26/13 16:58, Benjamin Poirier wrote:
> Using the UDP_CORK socket option documented in udp.7 requires including
> <netinet/udp.h>.

Thanks, Benjamin. Applied.

Cheers,

Michael


> Signed-off-by: Benjamin Poirier <bpoirier-l3A5Bk7waGM@public.gmane.org>
> ---
> 
> Here's a small test program:
> 
> <<<<<<<< minicork.c
> #include <netinet/in.h>
> #include <netinet/ip.h>
> //#include <netinet/udp.h>
> 
> 
> int main()
> {
> 	int fd, option;
> 
> 	fd = socket(AF_INET, SOCK_DGRAM, 0);
> 
> 	option = 1;
> 	setsockopt(fd, IPPROTO_UDP, UDP_CORK, &option, sizeof(option));
> 
> 	return 0;
> }
>>>>>>>>>
> 
> ---
>  man7/udp.7 |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/man7/udp.7 b/man7/udp.7
> index 313c78d..e2e723a 100644
> --- a/man7/udp.7
> +++ b/man7/udp.7
> @@ -16,6 +16,8 @@ udp \- User Datagram Protocol for IPv4
>  .B #include <sys/socket.h>
>  .br
>  .B #include <netinet/in.h>
> +.br
> +.B #include <netinet/udp.h>
>  .sp
>  .B udp_socket = socket(AF_INET, SOCK_DGRAM, 0);
>  .SH DESCRIPTION
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
