From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: Things I wish I'd known about Inotify
Date: Tue, 15 Jul 2014 06:15:22 +0200
Message-ID: <53C4AADA.1090208@gmail.com>
References: <CAKgNAkjymzawYMKZGedK=fai55cwo4p=yeYe6GT8MdxWON__zw@mail.gmail.com> <20140403205236.GE14107@quack.suse.cz> <533E60D6.2000704@gmail.com> <20140404124338.GA26806@quack.suse.cz> <CAKgNAkj=j2Auym+Euis0qYot3nYoASkeaf4kFPWvL-M-FCXEvQ@mail.gmail.com> <20140714112838.GG30550@quack.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20140714112838.GG30550@quack.suse.cz>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Jan Kara <jack@suse.cz>
Cc: mtk.manpages@gmail.com, John McCutchan <john@johnmccutchan.com>, Robert Love <rlove@rlove.org>, Eric Paris <eparis@redhat.com>, Lennart Poettering <lennart@poettering.net>, Radu Voicilas <radu.voicilas@gmail.com>, daniel@veillard.com, Christoph Hellwig <hch@infradead.org>, Vegard Nossum <vegard.nossum@oracle.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>, gamin-list@gnome.org, lkml <linux-kernel@vger.kernel.org>, inotify-tools-general@lists.sourceforge.net, jake@lwn.net
List-Id: linux-man@vger.kernel.org

On 07/14/2014 01:28 PM, Jan Kara wrote:
> On Sat 12-07-14 21:06:45, Michael Kerrisk (man-pages) wrote:
>> Late follow up on this thread..., since another question occurred in
>> discussions with Jake.
>>
>> On Fri, Apr 4, 2014 at 2:43 PM, Jan Kara <jack@suse.cz> wrote:
>>> On Fri 04-04-14 09:35:50, Michael Kerrisk (man-pages) wrote:
>>>> On 04/03/2014 10:52 PM, Jan Kara wrote:
>>>>> On Thu 03-04-14 08:34:44, Michael Kerrisk (man-pages) wrote:
>> [...]
>>>>>>    Dealing with rename() events
>>>>>>        The  IN_MOVED_FROM  and  IN_MOVED_TO events that are gene=
rated by
>>>>>>        rename(2) are usually available as consecutive events whe=
n  read=E2=80=90
>>>>>>        ing from the inotify file descriptor.  However, this is n=
ot guar=E2=80=90
>>>>>>        anteed.  If multiple processes are triggering  events  fo=
r  moni=E2=80=90
>>>>>>        tored  objects,  then  (on rare occasions) an arbitrary n=
umber of
>>>>>>        other events may appear between the IN_MOVED_FROM and IN_=
MOVED_TO
>>>>>>        events.
>>>>>>
>>>>>>        Matching  up  the IN_MOVED_FROM and IN_MOVED_TO event pai=
r gener=E2=80=90
>>>>>>        ated by rename(2) is thus inherently racy.  (Don't forget=
 that if
>>>>>>        an  object is renamed outside of a monitored directory, t=
here may
>>>>>>        not even be an IN_MOVED_TO event.)  Heuristic  approaches=
  (e.g.,
>>>>>>        assume the events are always consecutive) can be used to =
ensure a
>>>>>>        match in most cases, but will inevitably miss some cases,=
 causing
>>>>>>        the  application  to  perceive  the IN_MOVED_FROM and IN_=
MOVED_TO
>>>>>>        events as being unrelated.  If watch  descriptors  are  d=
estroyed
>>>>>>        and  re-created as a result, then those watch descriptors=
 will be
>>>>>>        inconsistent with the watch descriptors in  any  pending =
 events.
>>>>>>        (Re-creating the inotify file descriptor and rebuilding t=
he cache
>>>>>>        may be useful to deal with this scenario.)
>>>>>   Well, but there's 'cookie' value meant exactly for matching up
>>>>> IN_MOVED_FROM and IN_MOVED_TO events. And 'cookie' is guaranteed =
to be
>>>>> unique at least within the inotify instance (in fact currently it=
 is unique
>>>>> within the whole system but I don't think we want to give that pr=
omise).
>>>>
>>>> Yes, that's already assumed by my discussion above (its described =
elsewhere
>>>> in the page). But your comment makes me think I should add a few w=
ords to
>>>> remind the reader of that fact. I'll do that.
>>>   Yes, that would be good.
>>>
>>>> But, the point is that even with the cookie, matching the events i=
s
>>>> nontrivial, since:
>>>>
>>>> * There may not even be an IN_MOVED_FROM event
>>>> * There may be an arbitrary number of other events in between the
>>>>   IN_MOVED_FROM and the IN_MOVED_TO.
>>>>
>>>> Therefore, one has to use heuristic approaches such as "allow at l=
east
>>>> N millisconds" or "check the next N events" to see if there is an
>>>> IN_MOVED_FROM that matches the IN_MOVED_TO. I can't see any way ar=
ound
>>>> that being inherently racy. (It's unfortunate that the kernel can'=
t
>>>> provide a guarantee that the two events are always consecutive, si=
nce
>>>> that would simply user space's life considerably.)
>>>   Yeah, it's unpleasant but doing that would be quite costly/comple=
x at the
>>> kernel side. And the race would in the worst case lead to applicati=
on
>>> thinking there's been file moved outside of watched area & a file m=
oved
>>> somewhere else inside the watched area. So the application will hav=
e to
>>> possibly inspect that file. That doesn't seem too bad.
>>
>> One further question. The IN_MOVED_FROM+IN_MOVED_TO pair may not be
>> guaranteed to be contiguous in the read buffer, but is their inserti=
on
>> in the event queue guaranteed to be atomic from a user-space point o=
f
>> view? That is to say: having read an IN_MOVED_FROM event, does user
>> space have the guarantee that if there is an IN_MOVED_TO event, then
>> it will already be in the queue? The reason I ask is that this would
>> affect how user space might try to read the IN_MOVED_TO event. If
>> there is no such guarantee, then a read() (or select()/poll()) with
>> (small) timeout is needed. If such a guarantee is provided, then a
>> nonblocking read() would suffice.
>   That's a good question... So the events are not generated atomicall=
y even
> from userspace POV - i.e., a userspace process may see a state where
> IN_MOVED_FROM event is already in the buffer but IN_MOVED_TO event is=
n't
> generated yet.

Thanks for the confirmation, Jan. I also did some user-space
experimentation that pretty much showed the insertion must be nonatomic=
=2E

Cheers,

Michael



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-fsdevel=
" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
