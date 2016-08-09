From: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Subject: Recommending UB in fmemopen man page
Date: Tue, 9 Aug 2016 11:13:46 -0400
Message-ID: <20160809151346.GA18472@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.lists-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This recent Stack Overflow question turned up a recommendaton to
invoke undefined behavior in the fmemopen man page:

http://stackoverflow.com/questions/38854163/using-rewind-on-a-file-opened-with-fmemopen

The stdio buffer associated with the fmemopen-obtained FILE, and the
output memory buffer into which it's writing, are conceptually
distinct entities, and there is no reason to expect reasonable results
if you modify the contents of a setvbuf-associated buffer through
other means while it's associated with a FILE.

The following text should simply be removed:

       Alternatively, the caller can explicitly set buf as the stdio
       stream buffer, at the same time informing stdio of the buffer's
       size, using:

           setbuffer(stream, buf, size);

Rich
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
