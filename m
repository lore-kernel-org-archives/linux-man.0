From: Georg Sauthoff <gsauthof-If1cxaH3S3JVgF+RW+Bo1SZEdBbF94EN@public.gmane.org>
Subject: fsync(2) EINVAL example, fifo(7) read-only
Date: Sun, 23 Jan 2011 10:08:47 +0100
Message-ID: <20110123090847.GQ3446@lenovo.private>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

just small stuff:

from the ERRORS section of fsync(2):


'EROFS, EINVAL
              fd is bound to a special file which does not support
              synchronization.
'

Consider adding an example of an file which does not support
synchronization, i.e. a note that doing fsync on a fifo yields EINVAL.



from fifo(7):

'A process can open a FIFO in nonblocking mode.  In this case, opening for read
 only will succeed even if no-one has opened on the write side yet, opening for
 write only will fail with ENXIO (no such device or address) unless the other
 end has already been opened.
'

IMHO it would be easier to parse, if 'read only'/'write only' would be
substituted with 'read-only'/'write-only'.


Best regards
Georg
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
