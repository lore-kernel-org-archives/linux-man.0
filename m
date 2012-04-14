From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] process_vm_{read,write}v(3): initial man pages
Date: Sat, 14 Apr 2012 13:08:08 +1200
Message-ID: <CAKgNAkggSz2Wm8argCycL1+-TmHt2=PurrJS4W05j5zR2sXppg@mail.gmail.com>
References: <1331358148-17235-1-git-send-email-vapier@gentoo.org>
 <201203211143.37042.vapier@gentoo.org> <CAKgNAkiNiG42ZtjYszYWBQWsvsk+c-mHhucER6Umt3esUvRCKg@mail.gmail.com>
 <CAKgNAkiEF6yTN-S-7-7L3Bu+QQyBepgocQM5S=CAOZ+npBQmEQ@mail.gmail.com> <20120402113316.7a2c6a20@Gantu>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120402113316.7a2c6a20@Gantu>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Chris,

On Mon, Apr 2, 2012 at 2:03 PM, Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org> wrote:
> On Fri, 30 Mar 2012 07:42:49 +1300
> "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> On Thu, Mar 22, 2012 at 7:29 AM, Michael Kerrisk (man-pages)
>> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > On Thu, Mar 22, 2012 at 4:43 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
>> > wrote:
>> >> Michael: should i fold in the updates that came from this thread
>> >> and send a v2, or are you going to tackle it ?
>> >
>> > I'll work on a draft, and have it out for review in a few days.
>>
>> Mike, Chris,
>>
>> Here's a heavily edited version of the page that Mike sent in. Since I
>> might have messed something up, could I ask you two to take a good
>> look at this page?
>>
>
> ....
>
>>
>> The
>> .BR process_vm_readv ()
>> system call transfers data from the process
>> .I pid
>> to the calling process.
>> The data to be transferred is identified by
>> .IR remote_vec
>
> Just a typo, but I think you mean remote_iov here instead of remote_vec
> (it occurs in a few places below as well). There's some cases of
> local_vec instead of local_iov too.

Yes. Thanks for catching that.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
