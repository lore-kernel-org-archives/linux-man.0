From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ip.7: INADDR_* values cannot be assigned directly to
 s_addr
Date: Mon, 18 Dec 2017 17:42:40 +0100
Message-ID: <0f994a1a-a6af-c795-735d-ab07107d41bc@gmail.com>
References: <20171214211815.GA4844@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171214211815.GA4844-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ricardo Biehl Pasquali <pasqualirb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Ricardo,

On 12/14/2017 10:18 PM, Ricardo Biehl Pasquali wrote:
> Signed-off-by: Ricardo Biehl Pasquali <pasqualirb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks. I applid you patch, but then also did 
s/INADDR_ANY/INADDR_LOOPBACK/ in the first sentence that you
changed. INADDR_LOOPBACK is a better example, since it is not
byte-order neutral.

Cheers,

Michael


> ---
> 
> According to The Open Group Base Specifications Issue 7, RATIONALE
> section of <http://pubs.opengroup.org/onlinepubs/9699919799/
> basedefs/netinet_in.h.html> some INADDR_* values must be converted
> using htonl().
> 
> INADDR_ANY and INADDR_BROADCAST are byte-order-neutral so they do
> not require htonl(), however I only comment this fact in NOTES.
> On the text I recommend to use htonl(), "even if for some subset
> it's not necessary".
> 
> Proof code:
> 	#include <arpa/inet.h> /* inet_addr() htonl() */
> 	#include <inttypes.h> /* PRIu32 */
> 	#include <netinet/in.h> /* INADDR_* */
> 	#include <stdio.h> /* printf() */
> 
> 	#define LOOPBACK_ADDRESS  "127.0.0.1"
> 
> 	int
> 	main(void)
> 	{
> 		/* uint32_t as defined in the former
> 		 * specification */
> 		uint32_t addr;
> 
> 		addr = inet_addr(LOOPBACK_ADDRESS);
> 
> 		printf("inet_addr:              %" PRIu32 "\n"
> 		       "htonl(INADDR_LOOPBACK): %" PRIu32 "\n"
> 		       "INADDR_LOOPBACK:        %" PRIu32 "\n",
> 		       addr, htonl(INADDR_LOOPBACK),
> 		       INADDR_LOOPBACK);
> 
> 		return 0;
> 	}
> 
> 		Ricardo Biehl Pasquali
> 
>  man7/ip.7 | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/man7/ip.7 b/man7/ip.7
> index d05d211..d7481e2 100644
> --- a/man7/ip.7
> +++ b/man7/ip.7
> @@ -193,8 +193,11 @@ contains the host interface address in network byte order.
>  .I in_addr
>  should be assigned one of the
>  .BR INADDR_*
> -values (e.g.,
> +values
> +(e.g.,
>  .BR INADDR_ANY )
> +using
> +.BR htonl (3)
>  or set using the
>  .BR inet_aton (3),
>  .BR inet_addr (3),
> @@ -1267,6 +1270,13 @@ Using the
>  socket options level isn't portable; BSD-based stacks use the
>  .B IPPROTO_IP
>  level.
> +.PP
> +.B INADDR_ANY
> +(0.0.0.0) and
> +.B INADDR_BROADCAST
> +(255.255.255.255) are byte-order-neutral. That means
> +.BR htonl (3)
> +has no effect on them.
>  .SS Compatibility
>  For compatibility with Linux 2.0, the obsolete
>  .BI "socket(AF_INET, SOCK_PACKET, " protocol )
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
