From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: Things I wish I'd known about Inotify
Date: Sun, 06 Apr 2014 11:00:29 +0200
Message-ID: <534117AD.1030708@gmail.com>
References: <CAKgNAkjymzawYMKZGedK=fai55cwo4p=yeYe6GT8MdxWON__zw@mail.gmail.com> <20140403205236.GE14107@quack.suse.cz> <533E60D6.2000704@gmail.com> <20140404124338.GA26806@quack.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20140404124338.GA26806@quack.suse.cz>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Jan Kara <jack@suse.cz>
Cc: mtk.manpages@gmail.com, John McCutchan <john@johnmccutchan.com>, Robert Love <rlove@rlove.org>, Eric Paris <eparis@redhat.com>, Lennart Poettering <lennart@poettering.net>, radu.voicilas@gmail.com, daniel@veillard.com, Christoph Hellwig <hch@infradead.org>, Vegard Nossum <vegard.nossum@oracle.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, linux-man <linux-man@vger.kernel.org>, gamin-list@gnome.org, lkml <linux-kernel@vger.kernel.org>, inotify-tools-general@lists.sourceforge.net
List-Id: linux-man@vger.kernel.org

On 04/04/2014 02:43 PM, Jan Kara wrote:
> On Fri 04-04-14 09:35:50, Michael Kerrisk (man-pages) wrote:
>> On 04/03/2014 10:52 PM, Jan Kara wrote:
>>> On Thu 03-04-14 08:34:44, Michael Kerrisk (man-pages) wrote:

[...]

>>>>    Dealing with rename() events
>>>>        The  IN_MOVED_FROM  and  IN_MOVED_TO events that are genera=
ted by
>>>>        rename(2) are usually available as consecutive events when =
 read=E2=80=90
>>>>        ing from the inotify file descriptor.  However, this is not=
 guar=E2=80=90
>>>>        anteed.  If multiple processes are triggering  events  for =
 moni=E2=80=90
>>>>        tored  objects,  then  (on rare occasions) an arbitrary num=
ber of
>>>>        other events may appear between the IN_MOVED_FROM and IN_MO=
VED_TO
>>>>        events.
>>>>
>>>>        Matching  up  the IN_MOVED_FROM and IN_MOVED_TO event pair =
gener=E2=80=90
>>>>        ated by rename(2) is thus inherently racy.  (Don't forget t=
hat if
>>>>        an  object is renamed outside of a monitored directory, the=
re may
>>>>        not even be an IN_MOVED_TO event.)  Heuristic  approaches  =
(e.g.,
>>>>        assume the events are always consecutive) can be used to en=
sure a
>>>>        match in most cases, but will inevitably miss some cases, c=
ausing
>>>>        the  application  to  perceive  the IN_MOVED_FROM and IN_MO=
VED_TO
>>>>        events as being unrelated.  If watch  descriptors  are  des=
troyed
>>>>        and  re-created as a result, then those watch descriptors w=
ill be
>>>>        inconsistent with the watch descriptors in  any  pending  e=
vents.
>>>>        (Re-creating the inotify file descriptor and rebuilding the=
 cache
>>>>        may be useful to deal with this scenario.)
>>>   Well, but there's 'cookie' value meant exactly for matching up
>>> IN_MOVED_FROM and IN_MOVED_TO events. And 'cookie' is guaranteed to=
 be
>>> unique at least within the inotify instance (in fact currently it i=
s unique
>>> within the whole system but I don't think we want to give that prom=
ise).
>>
>> Yes, that's already assumed by my discussion above (its described el=
sewhere
>> in the page). But your comment makes me think I should add a few wor=
ds to
>> remind the reader of that fact. I'll do that.
>   Yes, that would be good.
>=20
>> But, the point is that even with the cookie, matching the events is=20
>> nontrivial, since:
>>
>> * There may not even be an IN_MOVED_FROM event
>> * There may be an arbitrary number of other events in between the=20
>>   IN_MOVED_FROM and the IN_MOVED_TO.
>>
>> Therefore, one has to use heuristic approaches such as "allow at lea=
st
>> N millisconds" or "check the next N events" to see if there is an
>> IN_MOVED_FROM that matches the IN_MOVED_TO. I can't see any way arou=
nd
>> that being inherently racy. (It's unfortunate that the kernel can't=20
>> provide a guarantee that the two events are always consecutive, sinc=
e
>> that would simply user space's life considerably.)

>   Yeah, it's unpleasant but doing that would be quite costly/complex =
at the
> kernel side.=20

Yep, I imagined that was probably the reason.

> And the race would in the worst case lead to application
> thinking there's been file moved outside of watched area & a file mov=
ed
> somewhere else inside the watched area. So the application will have =
to
> possibly inspect that file. That doesn't seem too bad.

It's actually very bad. See the text above. The point is that one likel=
y
treatment on an IN_MOVED_FROM event that has no IN_MOVED_TO is to remov=
e
the watches for the moved out subtree. If it turns out that this really
was just a rename(), then on the IN_MOVED_TO, the watches will be recre=
ated
*with different watch descriptors*, thus invalidating the watch descrip=
tors
in any queued but as yet unprocessed inotify events. See what I mean?=20
That's quite painful for user space.

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
