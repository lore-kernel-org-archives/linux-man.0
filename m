From: "Matthew De Mars" <demarsm-YYhoBthLFQ5BDgjK7y7TUQ@public.gmane.org>
Subject: setrlimit(3) man page formula not accurate for newer kernel versions
Date: Wed, 18 Dec 2013 13:16:06 -0600
Message-ID: <193ECE4F1ACA5746B704099DCF7619B5037D0ACC@mars.orbitec.int>
Mime-Version: 1.0
Content-Type: text/plain;charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-class: urn:content-classes:message
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello

The page being referred to in this e-mail is part of release 3.55 of the
Linux man-pages project.

Name and release of the distribution: RedHawk Embedded Linux version 6.3
(based on kernel.org 3.5.7)


The setrlimit(3) man page provides an equation for calculating the
memory consumed
by a POSIX message queue, but this equation is inaccurate for kernel
version 3.5.7
(and maybe slightly earlier releases, I'm not sure). Here is the text
from the man
page:

  Each message queue that the user creates counts (until it is removed)
against this
  limit according to the formula:

  bytes = attr.mq_maxmsg * sizeof(struct msg_msg *) + attr.mq_maxmsg *
attr.mq_msgsize


This calculation doesn't include new "overhead" which got introduced at
some point
during kernel development. Here is the comment found in the 3.5.7 kernel
source
code:

                /*

                 * We used to allocate a static array of pointers and
account

                 * the size of that array as well as one msg_msg struct
per

                 * possible message into the queue size. That's no
longer

                 * accurate as the queue is now an rbtree and will grow
and

                 * shrink depending on usage patterns.  We can, however,
still

                 * account one msg_msg struct per message, but the nodes
are

                 * allocated depending on priority usage, and most
programs

                 * only use one, or a handful, of priorities.  However,
since

                 * this is pinned memory, we need to assume worst case,
so

                 * that means the min(mq_maxmsg, max_priorities) *
struct

                 * posix_msg_tree_node.

                 */

Could you please update the setrlimit(3) man page so that it also
includes
the new formula for calculating queue size (whatever that formula is)
and so that
it also states with which kernel revision the new formula went into
effect?

Thanks very much!

- Matt DeMars



This message may contain confidential information and is intended only for the individual named. If you are not the named addressee you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately by e-mail if you have received this message by mistake and delete this e-mail from your system. E-mail transmission cannot be guaranteed to be secure or error-free as information could be intercepted, corrupted, lost, destroyed, arrive late or incomplete, or contain viruses. The sender therefore does not accept liability for any errors, omissions or malware in the contents of this message, which arise as a result of e-mail transmission. 


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
