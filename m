From: Ricardo Biehl Pasquali <pasqualirb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ip.7: INADDR_* values cannot be assigned directly to s_addr
Date: Thu, 14 Dec 2017 19:18:20 -0200
Message-ID: <20171214211815.GA4844@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Signed-off-by: Ricardo Biehl Pasquali <pasqualirb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

According to The Open Group Base Specifications Issue 7, RATIONALE
section of <http://pubs.opengroup.org/onlinepubs/9699919799/
basedefs/netinet_in.h.html> some INADDR_* values must be converted
using htonl().

INADDR_ANY and INADDR_BROADCAST are byte-order-neutral so they do
not require htonl(), however I only comment this fact in NOTES.
On the text I recommend to use htonl(), "even if for some subset
it's not necessary".

Proof code:
	#include <arpa/inet.h> /* inet_addr() htonl() */
	#include <inttypes.h> /* PRIu32 */
	#include <netinet/in.h> /* INADDR_* */
	#include <stdio.h> /* printf() */

	#define LOOPBACK_ADDRESS  "127.0.0.1"

	int
	main(void)
	{
		/* uint32_t as defined in the former
		 * specification */
		uint32_t addr;

		addr = inet_addr(LOOPBACK_ADDRESS);

		printf("inet_addr:              %" PRIu32 "\n"
		       "htonl(INADDR_LOOPBACK): %" PRIu32 "\n"
		       "INADDR_LOOPBACK:        %" PRIu32 "\n",
		       addr, htonl(INADDR_LOOPBACK),
		       INADDR_LOOPBACK);

		return 0;
	}

		Ricardo Biehl Pasquali

 man7/ip.7 | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/man7/ip.7 b/man7/ip.7
index d05d211..d7481e2 100644
--- a/man7/ip.7
+++ b/man7/ip.7
@@ -193,8 +193,11 @@ contains the host interface address in network byte order.
 .I in_addr
 should be assigned one of the
 .BR INADDR_*
-values (e.g.,
+values
+(e.g.,
 .BR INADDR_ANY )
+using
+.BR htonl (3)
 or set using the
 .BR inet_aton (3),
 .BR inet_addr (3),
@@ -1267,6 +1270,13 @@ Using the
 socket options level isn't portable; BSD-based stacks use the
 .B IPPROTO_IP
 level.
+.PP
+.B INADDR_ANY
+(0.0.0.0) and
+.B INADDR_BROADCAST
+(255.255.255.255) are byte-order-neutral. That means
+.BR htonl (3)
+has no effect on them.
 .SS Compatibility
 For compatibility with Linux 2.0, the obsolete
 .BI "socket(AF_INET, SOCK_PACKET, " protocol )
-- 
2.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
