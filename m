From: Mihai Paraschivescu <paraschivescu_mihail-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Subject: Man page typo
Date: Sun, 18 Apr 2010 08:57:54 -0700 (PDT)
Message-ID: <838959.52751.qm@web45611.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi!

My name is Mihail Paraschivescu, I'm from Romania. I have a lot of experience under Linux in C/C++ and a few days ago I got a new project related to System V message queues. So I start to document myself about all the things it may involve. While reading the man page of msgsnd(2) function I saw that among other thing it's written that:

"The queue capacity is defined by the msg_bytes field in the associated data structure for the message queue."

If I'm not wrong, the exact name of that field in the msqid_ds structure is msg_qbytes. The same thing appears also on the online manual pages, I checked it already.

I know this is a very minor typo, but I thought that it would be better to fix it such that other coders to get 100% correct information form this man page.

I am using Mandriva Linux 2010 and the man page is "part of release 3.23 of the Linux man-pages project".

Thanks a lot and have a nice day!

Mihail


      
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
