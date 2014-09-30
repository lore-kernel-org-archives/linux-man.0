From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Document POSIX MQ /proc/sys/fs/mqueue files
Date: Tue, 30 Sep 2014 12:49:21 +0200
Message-ID: <542A8AB1.5000009@gmail.com>
References: <542921EA.4050709@gmail.com> <1412022198.23497.23.camel@linux-t7sj.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412022198.23497.23.camel-dxKd5G12XOI1EaDjlw0dpg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Madars Vitolins <m@silodev.com>, Manfred Spraul <manfred-nhLOkwUX5cPe2c5cEj3t2g@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi David,

On 09/29/2014 10:23 PM, Davidlohr Bueso wrote:
> Hi Michael,
>=20
> Cc'ing Manfred.

(Thanks, I should have thought of that.)

> On Mon, 2014-09-29 at 11:10 +0200, Michael Kerrisk (man-pages) wrote:
>> Hello Doug, David,
>>
>> I think you two were the last ones to make significant=20
>> changes to the semantics of the files in /proc/sys/fs/mqueue,
>> so I wonder if you (or anyone else who is willing) might
>> take a look at the man page text below that I've written
>> (for the mq_overview(7) page) to describe past and current
>> reality, and let me know of improvements of corrections.
>=20
> Over the years posix mqueues have increasingly become a mess *sigh* :=
-/
> Thanks for doing this and untangling some of the historic changes.
>=20
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
>>               to the msg_max limit.=20
>=20
> I think rephrasing this would read easier. Basically the behavior is
> this:
>=20
> 		info->attr.mq_maxmsg =3D min(ipc_ns->mq_msg_max,
> 					   ipc_ns->mq_msg_default);
>=20
> Something like:
> "a new queue's default mq_maxmsg value will be the smallest of msg_de=
fault and msg_max"

Yes, better. Changed. Thanks.
>=20
>>  Up until Linux 2.6.28, the  default
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
>=20
> Note that the HARD_MSGMAX check is done *only* for privileged process=
es,
> regular processes only check against namespace values. This is a pret=
ty
> fundamental difference. The same goes of course for msgsize:

Yes, I understand. But, the existing text still seems okay to me. The
thing is that HARD_MSGMAX is still in effect a limit for unprivileged=20
processes also, since it is a ceiling on 'msg_max'. See what I mean?

> 	if (capable(CAP_SYS_RESOURCE)) {
> 		if (attr->mq_maxmsg > HARD_MSGMAX ||
> 		    attr->mq_msgsize > HARD_MSGSIZEMAX)
> 			return -EINVAL;
> 	} else {
> 		if (attr->mq_maxmsg > ipc_ns->mq_msg_max ||
> 		    attr->mq_msgsize > ipc_ns->mq_msgsize_max)
> 			return -EINVAL;
> 	}
>=20
>=20
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
>=20
> You might want to mention the units (bytes) when refering to limits.

I added the words "bytes" in the text near here.
=20
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
>=20
> Ditto here.

("bytes" does already get mentioned below.)

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
>=20
> Given that this was treated as a bug that breaks user-space, I don't
> think we really want to document the behavior between 3.5 and 3.14 (a=
ll
> three bullets). Stable kernels back to 3.5 now have the default
> behavior, so its as nothing ever changed(?). Now, if you explicitly w=
ant
> to document such bug, I would agree, but just not mentioning it as
> intentional differences in behavior. Does that make sense?

Yes. I've simplified that piece to just:

       /proc/sys/fs/mqueue/queues_max
              This file can be used to view and change  the  system-wid=
e
              limit on the number of message queues that can be created=
=2E
              The default value for queues_max is 256.   No  ceiling  i=
s
              imposed  on  the  queues_max  limit;  privileged processe=
s
              (CAP_SYS_RESOURCE) can exceed the limit (but see BUGS).

plus:

    BUGS
       In  Linux  versions  3.5 to 3.14, the kernel imposed a ceiling o=
f
       1024 (HARD_QUEUESMAX) on the value to which the queues_max  limi=
t
       could be raised, and the ceiling was enforced even for privilege=
d
       processes.  This ceiling value was removed  in  Linux  3.14,  an=
d
       patches  to stable kernels 3.5.x to 3.13.x also removed the ceil=
=E2=80=90
       ing.

Okay?

Thanks for the careful review, David.

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
