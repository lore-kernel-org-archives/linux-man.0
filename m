From: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH] fsync.2 updates
Date: Sun, 1 Jan 2012 03:49:16 +0100
Message-ID: <20120101024916.GA16572@gaara.hadrons.org>
References: <20111104061203.GA1300@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111104061203.GA1300-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi!

On 2011-11-04 6:12:04, Christoph Hellwig wrote:
> - fsync works on any fd and does not require a writeable one,
>   correct the EBADF error code explanation.

The problem is, while this is true for Linux, that's not a safe portable
assumption to make on POSIX in general as that behaviour is not
specified and as such is implementation specific, some Unix systems
do actually fail on read-only file descriptors, for example:

  <http://h30097.www3.hp.com/docs/base_doc/DOCUMENTATION/V50_HTML/MAN/MAN2/0033____.HTM>
  <http://publib.boulder.ibm.com/infocenter/aix/v6r1/index.jsp?topic=/com.ibm.aix.basetechref/doc/basetrf1/fsync.htm>

So if this part of the patch gets applied it would be nice to add a
note stating this is Linux specific behaviour, and that other systems
might still fail on such condition.

regards,
guillem
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
