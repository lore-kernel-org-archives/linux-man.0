From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Revised keyrings(7) man page for review
Date: Tue, 13 Dec 2016 13:57:16 +0100
Message-ID: <CAKgNAkh9JLN4P+Fu+yRCNo96E3VwjYLRquuaf43XRWeuC7gnNw@mail.gmail.com>
References: <51643019-bb42-4066-c824-c55b9e668ac6@man7.org>
 <25262.1481628931@warthog.procyon.org.uk> <9f32a79b-5795-bff4-b741-bf927a525149@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9f32a79b-5795-bff4-b741-bf927a525149-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Michael Kerrisk <mtk-ASgREoAs3yw@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, keyrings-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello David,

Amended a piece here after Eugene's note about encrypted keys.

On 13 December 2016 at 13:43, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi David,
>
> On 12/13/2016 12:35 PM, David Howells wrote:
>> Michael Kerrisk <mtk-ASgREoAs3yw@public.gmane.org> wrote:
>>
>>>        "big_key" (since Linux 3.13)
>>>               This  key type is similar to the "user" key type, but it
>>>               may hold a payload of up to 1MiB in size.  The data  may
>>>               be stored in the swap space rather than in kernel memory
>>
>> stored encrypted (as of 4.8).
>
> Added "encrypted".

So, I've updated this piece a couple of times since the draft that you
reviewed, and by now it reads:

       "big_key" (since Linux 3.13)
              This key type is similar to the "user" key type, but it may
              hold  a  payload  of up to 1 MiB in size.  This key type is
              useful for tasks such as holding Kerberos ticket caches.

              The payload data may be stored in  the  swap  space  rather
              than in kernel memory if the data size exceeds the overhead
              of storing the data encrypted in swap space.  (A tmpfs file
              is  used,  which requires filesystem structures to be allo=E2=
=80=90
              cated in the kernel; The size of  these  structures  deter=E2=
=80=90
              mines  the  size  threshold  above  which the tmpfs storage
              method  is  used.)   Since  Linux  4.8,  payload  data   is
              encrypted,  to  prevent  it  being written unencrypted into
              swap space.

Okay?

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
