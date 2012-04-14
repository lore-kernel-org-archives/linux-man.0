From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] process_vm_{read,write}v(3): initial man pages
Date: Sun, 15 Apr 2012 09:22:06 +1200
Message-ID: <CAKgNAkjh46Bpar7qkJBn_r4D1qtFkbK_QLVfE3ESgEuaYMGp5g@mail.gmail.com>
References: <1331358148-17235-1-git-send-email-vapier@gentoo.org>
 <201203291517.46815.vapier@gentoo.org> <CAKgNAkiKL64_H2QT6v0hsP-=cM3w=wGJbjaph+JMq6R+Knhysg@mail.gmail.com>
 <201204140036.28834.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201204140036.28834.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Mike,

On Sat, Apr 14, 2012 at 4:36 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wro=
te:
> On Friday 13 April 2012 21:07:28 Michael Kerrisk wrote:
>> On Fri, Mar 30, 2012 at 8:17 AM, Mike Frysinger wrote:
>> > On Thursday 29 March 2012 14:42:49 Michael Kerrisk wrote:
>> >> .\" FIXME: What does the following sentence mean?
>> >
>> > heh, i was just about to suggest a clarification. =A0consider the =
case
>> > where you want to read a C string from a remote process. =A0you do=
n't know
>> > its length, so it is probably cheaper to read too much data and th=
en
>> > discard the rest than it is to read it byte by byte in a single sy=
scall.
>> >
>> > further consider the string lies in the last page of a valid mappi=
ng.
>> > =A0you don't want to always say "read 500 bytes" because if the fi=
rst 200
>> > bytes are the last 200 bytes of the last page, the remaining 300 b=
ytes
>> > cover invalid memory, and so no data will be read.
>> >
>> > instead, you'd split the remote read array into two elements and h=
ave
>> > them merge back into a single write array entry. =A0the first read=
 entry
>> > goes up to the page boundary while the second starts on the next p=
age
>> > boundary.
>> >
>> >> Keep this in mind when attempting to
>> >> extract data of unknown length (such as C strings which are
>> >> null-terminated) by avoiding spanning memory pages (typically 4Ki=
B).
>> >
>> > ... by avoiding spanning memory pages (typically 4KiB) in a single=
 iovec
>> > element.
>>
>> Thanks for the clear explanation, and the crisp addition to the
>> man-page text. I also adapted a piece of your explanation to add int=
o
>> the page after the above sentence:
>>
>> =3D=3D
>> (Instead, split the remote read array into two
>> .I iovec
>> elements and have them merge back into a single write array entry.
>> The first read entry goes up to the page boundary,
>> while the second starts on the next page boundary.)
>> =3D=3D
>>
>> However, as I look at the text, there is still a nagging doubt. The
>> paragraph starts
>> =3D=3D
>> The count arguments and
>> .IR local_iov
>> are checked before doing any transfers.
>> If the counts are too big, or
>> .I local_iov
>> is invalid,
>> or the addresses refer to regions that are inaccessible to the local
>> process, none of the vectors will be processed and an
>> error will be returned immediately.
>> =3D=3D
>>
>> That seems to contradict the advice "Instead, split the remote read
>> array", because surely if the second of the iovec elements refers to
>> an inaccessible region, then as stated in the early part of the
>> paragraph, "none of the vectors will be processed". And the advice
>> refers to the "remote read array".
>>
>> What am I missing? I suspect the advice should instead apply to the
>> *remote_iov*, and perhaps be placed in the following paragraph.
>
> the new text you added describes the remote args (the stuff that need=
s
> splitting). =A0the existing text you refer to describes the local arg=
s. =A0i don't
> see any contradiction here -- the kernel first checks the local memor=
y regions
> to make sure the local process has full access to its own regions bef=
ore
> processing anything, and then it processes the remote memory regions =
one
> element at a time while doing the actual transfers.

I think you've missed my point. The text starts out with a sentence
describing the checks performed on the count arguments and local_iov.
Then it says "Keep this in mind" (i.e., the aforementioned point) and
gives some advice about how to avoid a certain kind of error when
specifying remote_iov. All of the technical details are correct, but
the logic of the explanation is (it seems to me) broken. The "Keep
this in mind" suggests that the second part of the text is dependent
on the explanation given in the first part, when in fact it is not. If
you still don't see what I mean, can you describe to me what "this" in
"Keep this in mind" refers to.

It seems to me that the "Keep this in mind" part belons with the
*following* paragraph, like so:

=3D=3D
The count arguments and
=2EIR local_iov
are checked before doing any transfers.
If the counts are too big, or
=2EI local_iov
is invalid,
or the addresses refer to regions that are inaccessible to the local pr=
ocess,
none of the vectors will be processed
and an error will be returned immediately.

Note, however, that these system calls do not check the memory regions
in the remote process until just before doing the read/write.
Consequently, a partial read/write may result if one of the
=2EI remote_iov
elements points to an invalid memory region in the remote process.
No further reads/writes will be attempted beyond that point.
Keep this in mind when attempting to
read data of unknown length (such as C strings that are null-terminated=
)
from a remote process,
by avoiding spanning memory pages (typically 4KiB) in a single
=2EI iovec
element.
(Instead, split the remote read into two
=2EI remote_iov
elements and have them merge back into a single write array entry.
The first read entry goes up to the page boundary,
while the second starts on the next page boundary.)
=3D=3D

Does that not make better sense?

>> >> Note, however, that these system calls do not check the memory re=
gions
>> >> in the remote process until just before doing the read/write.
>> >> Consequently, a partial read/write may result if one of the
>> >> .I remote_vec
>> >> elements points to an invalid memory region in the remote process=
=2E
>> >> No further reads/writes will be attempted beyond that point.
>> >
>> > should clarify that the partial read/write applies to iovec elemen=
ts
>> > granularity and not byte granularity. =A0i.e. the syscall won't re=
turn a
>> > partial read that splits a single iovect element.
>>
>> I added this text under RETURN VALUE:
>>
>> =3D=3D
>> (Partial transfers apply at the granularity of
>> .I iovec
>> elements.
>> These system calls won't perform a partial
>> transfer that splits a single
>> .I iovec
>> element.)
>> =3D=3D
>>
>> And again a question does "a single iovec element" here apply to the
>> remove iovec elements, the local iovec elements, or both?
>
> if any local iovec element is invalid, then it returns immediately wi=
thout any
> transferring of data. =A0this is because the local process should kno=
w what
> is/isn't valid about itself before making any requests. =A0however, i=
t's hard
> for it to know about the remote process, so the remote elements are "=
looser"
> in checking (which is a good thing).

Perhaps I'm too clogged up with a cold, but I couldn't draw an answer
to the question " does "a single iovec element" here apply to the
remote iovec elements, the local iovec elements, or both?" from your
reply.

Mike, thanks for persisting so far with trying to clarify things.

Cheers,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
