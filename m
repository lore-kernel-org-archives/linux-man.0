From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] process_vm_{read,write}v(3): initial man pages
Date: Tue, 24 Apr 2012 21:07:52 +1200
Message-ID: <CAKgNAki+hiCAdGe9ExFsY2MwsLE=yvHib+nb5WQbXqtBXCqHMw@mail.gmail.com>
References: <1331358148-17235-1-git-send-email-vapier@gentoo.org>
 <201204140036.28834.vapier@gentoo.org> <CAKgNAkjh46Bpar7qkJBn_r4D1qtFkbK_QLVfE3ESgEuaYMGp5g@mail.gmail.com>
 <201204240024.56967.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201204240024.56967.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mike,

On Tue, Apr 24, 2012 at 4:24 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wro=
te:
> On Saturday 14 April 2012 17:22:06 Michael Kerrisk (man-pages) wrote:
>> The count arguments and
>> .IR local_iov
>> are checked before doing any transfers.
>> If the counts are too big, or
>> .I local_iov
>> is invalid,
>> or the addresses refer to regions that are inaccessible to the local
>> process, none of the vectors will be processed
>> and an error will be returned immediately.
>
> to be clear, the arrays themselves are checked to see if they point t=
o valid
> memory, as are the count values, before the transfer takes place. =A0=
so if
> local_iov/remote_iov are NULL or similarly invalid, nothing happens. =
=A0in
> practice, this generally equates to the same thing, but there is a sl=
ight edge
> case -- if the remote_iov array is mostly valid, but the remote count=
 value
> causes it to spill into invalid memory, nothing will be processed. =A0=
note that
> i'm talking about the storage of the elements themselves and not the =
memory
> they point to. =A0but maybe being super pedantic here isn't necessary=
 ...
>
>> Note, however, that these system calls do not check the memory regio=
ns
>> in the remote process until just before doing the read/write.
>> Consequently, a partial read/write may result if one of the
>
> any mention of a partial read/write should point to the text clarifyi=
ng what
> that means (perhaps something as simple as "see RETURN VALUE for more=
 info".

I added a reference to RETURN VALUE there.

>> Does that not make better sense?
>
> it does

Good.

>> Perhaps I'm too clogged up with a cold, but I couldn't draw an answe=
r
>> to the question " does "a single iovec element" here apply to the
>> remote iovec elements, the local iovec elements, or both?" from your
>> reply.
>
> wrt partial transfers, remote only afaict. =A0this is by virtue of no=
thing being
> transferred at all if any of the local elements are invalid.

Okay -- I added the word "remote".

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
