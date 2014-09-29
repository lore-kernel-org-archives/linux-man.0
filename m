From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Document POSIX MQ /proc/sys/fs/mqueue files
Date: Mon, 29 Sep 2014 11:10:02 +0200
Message-ID: <542921EA.4050709@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Madars Vitolins <m@silodev.com>
List-Id: linux-man@vger.kernel.org

Hello Doug, David,

I think you two were the last ones to make significant=20
changes to the semantics of the files in /proc/sys/fs/mqueue,
so I wonder if you (or anyone else who is willing) might
take a look at the man page text below that I've written
(for the mq_overview(7) page) to describe past and current
reality, and let me know of improvements of corrections.

By the way, Doug, your commit ce2d52cc1364 appears to have
changed/broken the semantics of the files in the /dev/mqueue=20
filesystem. Formerly, the QSIZE field in these files showed
the number of bytes of real user data in all of the queued
messages. After that commit, QSIZE now includes kernel=20
overhead bytes, which does not seem very useful for user=20
space. Was that change intentional? I see no mention of the
change in the commit message, so it sounds like it was not=20
intended.

Cheers,

Michael

=46rom mq_overview(7) draft:

   /proc interfaces
       The following interfaces can be used to limit the amount of  ker=
=E2=80=90
       nel  memory  consumed  by  POSIX  message  queues  and to set th=
e
       default attributes for new message queues:

       /proc/sys/fs/mqueue/msg_default (since Linux 3.5)
              This file  defines  the  value  used  for  a  new  queue'=
s
              mq_maxmsg setting when the queue is created with a call t=
o
              mq_open(3) where attr is specified as NULL.   The  defaul=
t
              value for this file is 10.  The minimum and maximum are a=
s
              for /proc/sys/fs/mqueue/msg_max.  If  msg_default  exceed=
s
              msg_max,  a  new queue's default mq_maxmsg value is cappe=
d
              to the msg_max limit.  Up until Linux 2.6.28, the  defaul=
t
              mq_maxmsg  was  10;  from  Linux  2.6.28 to Linux 3.4, th=
e
              default was the value defined for the msg_max limit.

       /proc/sys/fs/mqueue/msg_max
              This file can be used to view and change the ceiling valu=
e
              for the maximum number of messages in a queue.  This valu=
e
              acts as a ceiling on the attr->mq_maxmsg argument given t=
o
              mq_open(3).   The  default  value  for msg_max is 10.  Th=
e
              minimum value is 1 (10 in  kernels  before  2.6.28).   Th=
e
              upper  limit is HARD_MSGMAX.  The msg_max limit is ignore=
d
              for  privileged  processes  (CAP_SYS_RESOURCE),  but   th=
e
              HARD_MSGMAX ceiling is nevertheless imposed.

              The  definition  of  HARD_MSGMAX has changed across kerne=
l
              versions:

              *  Up to Linux 2.6.32: 131072 / sizeof(void *)

              *  Linux 2.6.33 to 3.4: (32768 * sizeof(void *) / 4)

              *  Since Linux 3.5: 65,536

       /proc/sys/fs/mqueue/msgsize_default (since Linux 3.5)
              This file defines the value used for a new queue's mq_msg=
=E2=80=90
              size  setting  when  the  queue  is created with a call t=
o
              mq_open(3) where attr is specified as NULL.   The  defaul=
t
              value  for this file is 8192.  The minimum and maximum ar=
e
              as   for   /proc/sys/fs/mqueue/msgsize_max.     If    msg=
=E2=80=90
              size_default  exceeds  msgsize_max,  a new queue's defaul=
t
              mq_msgsize value is capped to the msgsize_max  limit.   U=
p
              until  Linux 2.6.28, the default mq_msgsize was 8192; fro=
m
              Linux 2.6.28 to Linux  3.4,  the  default  was  the  valu=
e
              defined for the msgsize_max limit.

       /proc/sys/fs/mqueue/msgsize_max
              This  file  can  be used to view and change the ceiling o=
n
              the maximum message size.  This value acts as a ceiling o=
n
              the  attr->mq_msgsize  argument  given to mq_open(3).  Th=
e
              default value for msgsize_max is 8192 bytes.  The  minimu=
m
              value  is  128 (8192 in kernels before 2.6.28).  The uppe=
r
              limit for msgsize_max has varied across kernel versions:

              *  Before Linux 2.6.28, the upper limit is INT_MAX.

              *  From Linux 2.6.28 to 3.4, the limit is 1,048,576.

              *  Since Linux 3.5, the limit is 16,777,216 (HARD_MSGSIZE=
=E2=80=90
                 MAX).

              The  msgsize_max  limit  is ignored for privileged proces=
s
              (CAP_SYS_RESOURCE), but, since Linux  3.5,  the  HARD_MSG=
=E2=80=90
              SIZEMAX ceiling is enforced for privileged processes.

       /proc/sys/fs/mqueue/queues_max
              This  file  can be used to view and change the system-wid=
e
              limit on the number of message queues that can be created=
=2E
              The default value for queues_max is 256.  The semantics o=
f
              this limit have changed across kernel versions as follows=
:

              *  Before Linux 3.5, this limit could be  changed  to  an=
y
                 value  in  the  range 0 to INT_MAX, but privileged pro=
=E2=80=90
                 cesses (CAP_SYS_RESOURCE) can exceed the limit.

              *  Since Linux 3.5, there is a ceiling for this  limit  o=
f
                 1024     (HARD_QUEUESMAX).      Privileged    processe=
s
                 (CAP_SYS_RESOURCE) can exceed the queues_max limit, bu=
t
                 the  HARD_QUEUESMAX  limit  is enforced even for privi=
=E2=80=90
                 leged processes.

              *  Starting with Linux 3.14, the HARD_QUEUESMAX ceiling i=
s
                 removed: no ceiling is imposed on the queues_max limit=
,
                 and privileged processes (CAP_SYS_RESOURCE) can  excee=
d
                 the limit.

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
