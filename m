From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Things I wish I'd known about Inotify
Date: Sat, 12 Apr 2014 07:44:27 +0200
Message-ID: <5348D2BB.3090108@gmail.com>
References: <CAKgNAkjymzawYMKZGedK=fai55cwo4p=yeYe6GT8MdxWON__zw@mail.gmail.com> <20140403205236.GE14107@quack.suse.cz> <533E60D6.2000704@gmail.com> <20140404124338.GA26806@quack.suse.cz> <534117AD.1030708@gmail.com> <20140407093152.GC14927@quack.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140407093152.GC14927-+0h/O2h83AeN3ZZ/Hiejyg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, John McCutchan <john-jueV0HHMeujJJrXXpGQQMAC/G2K4zDHf@public.gmane.org>, Robert Love <rlove-L7G0xEPcOZbYtjvyW6yDsg@public.gmane.org>, Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>, radu.voicilas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, daniel-dYEgDbNUoShWk0Htik3J/w@public.gmane.org, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gamin-list-rDKQcyrBJuzYtjvyW6yDsg@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, inotify-tools-general-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/07/2014 11:31 AM, Jan Kara wrote:
> On Sun 06-04-14 11:00:29, Michael Kerrisk (man-pages) wrote:
>> On 04/04/2014 02:43 PM, Jan Kara wrote:
>>> On Fri 04-04-14 09:35:50, Michael Kerrisk (man-pages) wrote:
>>>> On 04/03/2014 10:52 PM, Jan Kara wrote:
>>>>> On Thu 03-04-14 08:34:44, Michael Kerrisk (man-pages) wrote:
>>
>> [...]
>>
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
s=20
>>>> nontrivial, since:
>>>>
>>>> * There may not even be an IN_MOVED_FROM event
>>>> * There may be an arbitrary number of other events in between the=20
>>>>   IN_MOVED_FROM and the IN_MOVED_TO.
>>>>
>>>> Therefore, one has to use heuristic approaches such as "allow at l=
east
>>>> N millisconds" or "check the next N events" to see if there is an
>>>> IN_MOVED_FROM that matches the IN_MOVED_TO. I can't see any way ar=
ound
>>>> that being inherently racy. (It's unfortunate that the kernel can'=
t=20
>>>> provide a guarantee that the two events are always consecutive, si=
nce
>>>> that would simply user space's life considerably.)
>>
>>>   Yeah, it's unpleasant but doing that would be quite costly/comple=
x at the
>>> kernel side.=20
>>
>> Yep, I imagined that was probably the reason.
>   I had a look into that code again and it's all designed around the =
fact
> that there's a single inode to notify. If you liked to have atomic re=
name
> notifications, you'd have to rewrite that to work with two inodes, fi=
nding
> out whether these two inodes are actually watched by the same group o=
r
> not... Doable but complex. Alternatively you could just lock down the=
 whole
> notification subsystem while generating rename events. But that's rat=
her
> costly. Just that we have the complications written down somewhere in=
 case
> someone wants to look into this in future.
>=20
>>> And the race would in the worst case lead to application
>>> thinking there's been file moved outside of watched area & a file m=
oved
>>> somewhere else inside the watched area. So the application will hav=
e to
>>> possibly inspect that file. That doesn't seem too bad.
>>
>> It's actually very bad. See the text above. The point is that one li=
kely
>> treatment on an IN_MOVED_FROM event that has no IN_MOVED_TO is to re=
move
>> the watches for the moved out subtree. If it turns out that this rea=
lly
>> was just a rename(), then on the IN_MOVED_TO, the watches will be re=
created
>> *with different watch descriptors*, thus invalidating the watch desc=
riptors
>> in any queued but as yet unprocessed inotify events. See what I mean=
?=20
>> That's quite painful for user space.

Sorry for the late follow-up....

>   But if I understand it right, you loose only the information for re=
created
> watches. So you effectively loose all the information about what has
> happened inside the subtree of moved directory (or what has happened =
with
> the moved file). But since you think it's a file / dir moved from out=
side
> of watched area, you have to fully rescan that file / dir anyway. =20

Ack on you summary there.

> Sure
> that's costly but if your heuristics for detecting rename works 99.9%=
 of
> time it should be OK, shouldn't it? And you have to have that code ha=
ndling
> caching file / dir written anyway for handling real moves from outsid=
e of
> watched hierarchy.

And ack on that.

> Don't get me wrong, I understand it would be easier for userspace to =
get
> atomic rename notifications, I'm just trying to understand what exact=
ly is
> painful so that I can compare the cost at the kernel side with the co=
st at
> the userspace side...

Yes, I was probably a little too strong in my statement. My perspective
is that I'd tried to write an (experimental) application that would tra=
ck=20
*all* events for a file tree (modulo queue overflow), and then I=20
encountered the wall of "rename() events are not consecutive", which=20
basically rendered that task impossible because of the races involved.=20

All that you say above also fits with my understanding. I was just
(perhaps overly) disappointed to find that I couldn't (perfectly)=20
achieve the tracking task that I'd attempted. (And furthermore, of=20
course, the code became a bit more complicated to handle the=20
possibility that some queued events may be for watch descriptors=20
that are no longer valid.)

Thanks for your response.

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
