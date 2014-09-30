From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Document POSIX MQ /proc/sys/fs/mqueue files
Date: Tue, 30 Sep 2014 12:12:24 +0200
Message-ID: <CAKgNAkj9+Z1yO-zrQ_qWFut7BqOkzNtNCruSSRyTKMpXZOcBaw@mail.gmail.com>
References: <542921EA.4050709@gmail.com> <1412011687.15492.39.camel@firewall.xsintricity.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412011687.15492.39.camel-v+aXH1h/sVwpzh8Nc7Vzg+562jBIR2Zt@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Madars Vitolins <m@silodev.com>
List-Id: linux-man@vger.kernel.org

Hi Doug,

On Mon, Sep 29, 2014 at 7:28 PM, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wro=
te:
> On Mon, 2014-09-29 at 11:10 +0200, Michael Kerrisk (man-pages) wrote:
>> Hello Doug, David,
>>
>> I think you two were the last ones to make significant
>> changes to the semantics of the files in /proc/sys/fs/mqueue,
>> so I wonder if you (or anyone else who is willing) might
>> take a look at the man page text below that I've written
>> (for the mq_overview(7) page) to describe past and current
>> reality, and let me know of improvements of corrections.
>>
>> By the way, Doug, your commit ce2d52cc1364 appears to have
>> changed/broken the semantics of the files in the /dev/mqueue
>> filesystem. Formerly, the QSIZE field in these files showed
>> the number of bytes of real user data in all of the queued
>> messages. After that commit, QSIZE now includes kernel
>> overhead bytes, which does not seem very useful for user
>> space. Was that change intentional? I see no mention of the
>> change in the commit message, so it sounds like it was not
>> intended.
>
> That change didn't come in that commit.  That commit modified it, but
> didn't introduce it.

(Which commit was it then? d6629859b36 ?)

> Now, was it intentional? Yes.  Is it valuable, useful?  That depends =
on
> your perspective.

Thanks for the detailed explanation below. However, I don't understand
why the (useful) work that you describe below necessitated a change in
the QSIZE value that was exposed to user space. Surely the necessary
changes could have been done internally while still leaving QSIZE to
expose the same value it ever did? As things stand now (and unless I
am missing something), QSIZE exposes an implementation-specific
internal value that has little meaning or value to user space. And,
it's unfortunate that the commit message made no mention of the fact
that there was an ABI change here.

[...]

> The man page below looks fine to me.

Thanks for checking it!

Cheers,

Michael


> It covers the various
> incarnations.  If I add some tweaks to the priorities value though, i=
t
> will need updating again ;-)
>
> Although this section wasn't included below, I would update how the
> memory is calculated to match what I wrote above.  However, I would a=
lso
> put in a notation that the calculation can change when the kernel's
> internal implementation changes and resource usage therefore changes.
>
>> Cheers,
>>
>> Michael
>>
>> From mq_overview(7) draft:
>>
>>    /proc interfaces
>>        The following interfaces can be used to limit the amount of  =
ker=E2=80=90
>>        nel  memory  consumed  by  POSIX  message  queues  and to set=
 the
>>        default attributes for new message queues:
>>
>>        /proc/sys/fs/mqueue/msg_default (since Linux 3.5)
>>               This file  defines  the  value  used  for  a  new  que=
ue's
>>               mq_maxmsg setting when the queue is created with a cal=
l to
>>               mq_open(3) where attr is specified as NULL.   The  def=
ault
>>               value for this file is 10.  The minimum and maximum ar=
e as
>>               for /proc/sys/fs/mqueue/msg_max.  If  msg_default  exc=
eeds
>>               msg_max,  a  new queue's default mq_maxmsg value is ca=
pped
>>               to the msg_max limit.  Up until Linux 2.6.28, the  def=
ault
>>               mq_maxmsg  was  10;  from  Linux  2.6.28 to Linux 3.4,=
 the
>>               default was the value defined for the msg_max limit.
>>
>>        /proc/sys/fs/mqueue/msg_max
>>               This file can be used to view and change the ceiling v=
alue
>>               for the maximum number of messages in a queue.  This v=
alue
>>               acts as a ceiling on the attr->mq_maxmsg argument give=
n to
>>               mq_open(3).   The  default  value  for msg_max is 10. =
 The
>>               minimum value is 1 (10 in  kernels  before  2.6.28).  =
 The
>>               upper  limit is HARD_MSGMAX.  The msg_max limit is ign=
ored
>>               for  privileged  processes  (CAP_SYS_RESOURCE),  but  =
 the
>>               HARD_MSGMAX ceiling is nevertheless imposed.
>>
>>               The  definition  of  HARD_MSGMAX has changed across ke=
rnel
>>               versions:
>>
>>               *  Up to Linux 2.6.32: 131072 / sizeof(void *)
>>
>>               *  Linux 2.6.33 to 3.4: (32768 * sizeof(void *) / 4)
>>
>>               *  Since Linux 3.5: 65,536
>>
>>        /proc/sys/fs/mqueue/msgsize_default (since Linux 3.5)
>>               This file defines the value used for a new queue's mq_=
msg=E2=80=90
>>               size  setting  when  the  queue  is created with a cal=
l to
>>               mq_open(3) where attr is specified as NULL.   The  def=
ault
>>               value  for this file is 8192.  The minimum and maximum=
 are
>>               as   for   /proc/sys/fs/mqueue/msgsize_max.     If    =
msg=E2=80=90
>>               size_default  exceeds  msgsize_max,  a new queue's def=
ault
>>               mq_msgsize value is capped to the msgsize_max  limit. =
  Up
>>               until  Linux 2.6.28, the default mq_msgsize was 8192; =
from
>>               Linux 2.6.28 to Linux  3.4,  the  default  was  the  v=
alue
>>               defined for the msgsize_max limit.
>>
>>        /proc/sys/fs/mqueue/msgsize_max
>>               This  file  can  be used to view and change the ceilin=
g on
>>               the maximum message size.  This value acts as a ceilin=
g on
>>               the  attr->mq_msgsize  argument  given to mq_open(3). =
 The
>>               default value for msgsize_max is 8192 bytes.  The  min=
imum
>>               value  is  128 (8192 in kernels before 2.6.28).  The u=
pper
>>               limit for msgsize_max has varied across kernel version=
s:
>>
>>               *  Before Linux 2.6.28, the upper limit is INT_MAX.
>>
>>               *  From Linux 2.6.28 to 3.4, the limit is 1,048,576.
>>
>>               *  Since Linux 3.5, the limit is 16,777,216 (HARD_MSGS=
IZE=E2=80=90
>>                  MAX).
>>
>>               The  msgsize_max  limit  is ignored for privileged pro=
cess
>>               (CAP_SYS_RESOURCE), but, since Linux  3.5,  the  HARD_=
MSG=E2=80=90
>>               SIZEMAX ceiling is enforced for privileged processes.
>>
>>        /proc/sys/fs/mqueue/queues_max
>>               This  file  can be used to view and change the system-=
wide
>>               limit on the number of message queues that can be crea=
ted.
>>               The default value for queues_max is 256.  The semantic=
s of
>>               this limit have changed across kernel versions as foll=
ows:
>>
>>               *  Before Linux 3.5, this limit could be  changed  to =
 any
>>                  value  in  the  range 0 to INT_MAX, but privileged =
pro=E2=80=90
>>                  cesses (CAP_SYS_RESOURCE) can exceed the limit.
>>
>>               *  Since Linux 3.5, there is a ceiling for this  limit=
  of
>>                  1024     (HARD_QUEUESMAX).      Privileged    proce=
sses
>>                  (CAP_SYS_RESOURCE) can exceed the queues_max limit,=
 but
>>                  the  HARD_QUEUESMAX  limit  is enforced even for pr=
ivi=E2=80=90
>>                  leged processes.
>>
>>               *  Starting with Linux 3.14, the HARD_QUEUESMAX ceilin=
g is
>>                  removed: no ceiling is imposed on the queues_max li=
mit,
>>                  and privileged processes (CAP_SYS_RESOURCE) can  ex=
ceed
>>                  the limit.
>>
>
>
> --
> Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>               GPG KeyID: 0E572FDD
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
