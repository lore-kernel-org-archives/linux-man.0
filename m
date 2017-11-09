From: Ricardo Biehl <rbpoficial-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: BUG: ip(7): INADDR_* values cannot be assigned directly to s_addr
Date: Thu, 9 Nov 2017 19:29:30 -0200
Message-ID: <CAAu8Fsc+Dk7KGSRb+qg9eHW0k2Meui2Covwxv-08QXhrp02a1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Doing a search for "INADDR" in ip(7) manual page should be sufficient to find
occurrences.

Below follows kinda a C file. It contains a description and the code which shows
the BUG.

ip7_manpage_bug.c
/*
 * 09/11/2017
 * confirms the BUG in ip(7) manual page
 *
 * Description: A BUG in ip(7) man page that says INADDR_* values can be
 * assigned directly, whereas they must be assigned with htonl()
 *   htonl = host to network long, or host byte order to network byte order
 *   conversion on uint32_t type
 *
 * An excerpt of what is wrong: "The s_addr member of struct in_addr contains
 * the host interface address in network byte order.  in_addr should be assigned
 * one of the INADDR_* values [...]"
 *
 * See RATIONALE section of reference #0 for the note from the standard
 *
 * references
 * #0:
 * http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/netinet_in.h.html
 */

#include <arpa/inet.h> /* inet_addr() htonl() */
#include <inttypes.h> /* PRIu32 */
#include <netinet/in.h> /* INADDR_* */
#include <stdio.h> /* printf() :-) */

#define LOOPBACK_ADDRESS  "127.0.0.1"

int
main(void)
{
	/* uint32_t as defined in reference #0 */
	uint32_t addr;

	addr = inet_addr(LOOPBACK_ADDRESS);

	printf("inet_addr:              %" PRIu32 "\n"
	       "htonl(INADDR_LOOPBACK): %" PRIu32 "\n"
	       "INADDR_LOOPBACK:        %" PRIu32 "\n",
	       addr, htonl(INADDR_LOOPBACK), INADDR_LOOPBACK);

	return 0;
}


-- 
Ricardo Biehl Pasquali
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
