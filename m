From: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Unable to parse a sentence in sync_file_range.2
Date: Fri, 19 Feb 2010 00:32:23 +0100
Message-ID: <7b3bdec71002181532o4ed24f53j121c3923ea7fa8df@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

When translating sync_file_range.2 I had been confused by this sentence:

  When writing into preallocated space, many filesystems also
  require calls into the block allocator, which this system
  call does not sync out to disk.

Can someone please rephrase it?  In particular, what does 'which' refer to?
Thanks.

Denis
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
