From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: Things I wish I'd known about Inotify
Date: Sat, 12 Jul 2014 21:06:45 +0200
Message-ID: <CAKgNAkj=j2Auym+Euis0qYot3nYoASkeaf4kFPWvL-M-FCXEvQ@mail.gmail.com>
References: <CAKgNAkjymzawYMKZGedK=fai55cwo4p=yeYe6GT8MdxWON__zw@mail.gmail.com>
 <20140403205236.GE14107@quack.suse.cz> <533E60D6.2000704@gmail.com> <20140404124338.GA26806@quack.suse.cz>
Reply-To: mtk.manpages@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20140404124338.GA26806@quack.suse.cz>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Jan Kara <jack@suse.cz>
Cc: John McCutchan <john@johnmccutchan.com>, Robert Love <rlove@rlove.org>, Eric Paris <eparis@redhat.com>, Lennart Poettering <lennart@poettering.net>, Radu Voicilas <radu.voicilas@gmail.com>, daniel@veillard.com, Christoph Hellwig <hch@infradead.org>, Vegard Nossum <vegard.nossum@oracle.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>, gamin-list@gnome.org, lkml <linux-kernel@vger.kernel.org>, inotify-tools-general@lists.sourceforge.net, jake@lwn.net
List-Id: linux-man@vger.kernel.org

Late follow up on this thread..., since another question occurred in
discussions with Jake.

On Fri, Apr 4, 2014 at 2:43 PM, Jan Kara <jack@suse.cz> wrote:
> On Fri 04-04-14 09:35:50, Michael Kerrisk (man-pages) wrote:
>> On 04/03/2014 10:52 PM, Jan Kara wrote:
>> > On Thu 03-04-14 08:34:44, Michael Kerrisk (man-pages) wrote:
[...]
>> >>    Dealing with rename() events
>> >>        The  IN_MOVED_FROM  and  IN_MOVED_TO events that are gener=
ated by
>> >>        rename(2) are usually available as consecutive events when=
  read=E2=80=90
>> >>        ing from the inotify file descriptor.  However, this is no=
t guar=E2=80=90
>> >>        anteed.  If multiple processes are triggering  events  for=
  moni=E2=80=90
>> >>        tored  objects,  then  (on rare occasions) an arbitrary nu=
mber of
>> >>        other events may appear between the IN_MOVED_FROM and IN_M=
OVED_TO
>> >>        events.
>> >>
>> >>        Matching  up  the IN_MOVED_FROM and IN_MOVED_TO event pair=
 gener=E2=80=90
>> >>        ated by rename(2) is thus inherently racy.  (Don't forget =
that if
>> >>        an  object is renamed outside of a monitored directory, th=
ere may
>> >>        not even be an IN_MOVED_TO event.)  Heuristic  approaches =
 (e.g.,
>> >>        assume the events are always consecutive) can be used to e=
nsure a
>> >>        match in most cases, but will inevitably miss some cases, =
causing
>> >>        the  application  to  perceive  the IN_MOVED_FROM and IN_M=
OVED_TO
>> >>        events as being unrelated.  If watch  descriptors  are  de=
stroyed
>> >>        and  re-created as a result, then those watch descriptors =
will be
>> >>        inconsistent with the watch descriptors in  any  pending  =
events.
>> >>        (Re-creating the inotify file descriptor and rebuilding th=
e cache
>> >>        may be useful to deal with this scenario.)
>> >   Well, but there's 'cookie' value meant exactly for matching up
>> > IN_MOVED_FROM and IN_MOVED_TO events. And 'cookie' is guaranteed t=
o be
>> > unique at least within the inotify instance (in fact currently it =
is unique
>> > within the whole system but I don't think we want to give that pro=
mise).
>>
>> Yes, that's already assumed by my discussion above (its described el=
sewhere
>> in the page). But your comment makes me think I should add a few wor=
ds to
>> remind the reader of that fact. I'll do that.
>   Yes, that would be good.
>
>> But, the point is that even with the cookie, matching the events is
>> nontrivial, since:
>>
>> * There may not even be an IN_MOVED_FROM event
>> * There may be an arbitrary number of other events in between the
>>   IN_MOVED_FROM and the IN_MOVED_TO.
>>
>> Therefore, one has to use heuristic approaches such as "allow at lea=
st
>> N millisconds" or "check the next N events" to see if there is an
>> IN_MOVED_FROM that matches the IN_MOVED_TO. I can't see any way arou=
nd
>> that being inherently racy. (It's unfortunate that the kernel can't
>> provide a guarantee that the two events are always consecutive, sinc=
e
>> that would simply user space's life considerably.)
>   Yeah, it's unpleasant but doing that would be quite costly/complex =
at the
> kernel side. And the race would in the worst case lead to application
> thinking there's been file moved outside of watched area & a file mov=
ed
> somewhere else inside the watched area. So the application will have =
to
> possibly inspect that file. That doesn't seem too bad.

One further question. The IN_MOVED_FROM+IN_MOVED_TO pair may not be
guaranteed to be contiguous in the read buffer, but is their insertion
in the event queue guaranteed to be atomic from a user-space point of
view? That is to say: having read an IN_MOVED_FROM event, does user
space have the guarantee that if there is an IN_MOVED_TO event, then
it will already be in the queue? The reason I ask is that this would
affect how user space might try to read the IN_MOVED_TO event. If
there is no such guarantee, then a read() (or select()/poll()) with
(small) timeout is needed. If such a guarantee is provided, then a
nonblocking read() would suffice.

Cheers,

Michael

PS I just now found this code by John McCutchan
https://git.gnome.org/browse/gnome-vfs/tree/modules/inotify-kernel.c#n5=
70
which suggests that the insertion of the event pair is not atomic
w.r.t. user space. Still, I wonder if there is any definitive
statement about this.

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
